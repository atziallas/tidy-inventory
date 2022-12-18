import { all, call, debounce, fork, put, select, take, takeEvery, throttle } from 'redux-saga/effects'
import {
    CANCEL_SORTING,
    CLICK_COLUMN,
    CLICK_FILTER,
    DO_ACTION,
    hideLoader,
    showLoader,
    UPDATE_ENTITIES,
    updateEntities,
} from '../actions/actions';
import 'regenerator-runtime/runtime'
import { Api } from '../services/api';
import { getFiltersAndSorting } from "../reducers/reducer"
import {
    BARCODE_CHANGED,
    barcodeChanged,
    DESIGNATE,
    FETCH_LOOKUP,
    SCANNED_BARCODE,
    selectEntity,
    setLookup,
    TRANSFER,
    FILE_DOWNLOADED,
    fileDownloaded
} from '../../common/actions/actions';
import { timeAndDisplayMessages } from "../../common/sagas/messages";
import { getEntity, getEntityIdByBarcode } from "../reducers/entities";
import { validateEAN13 } from "../../common/utils/utils";
import { getSelections, isSelected } from "../../common/reducers/selections";
import { getLocation, getSublocation } from "../../common/reducers/locations";
import { getDesignatedLocation, getDesignatedSublocation } from "../../common/reducers/designatedLocations";
import { getFilters } from "../reducers/filters";

function* doAction() {
    const state = yield select()
    const response = yield call(Api.doAction, state)
    let contentType = response.headers.get('content-type')
    if (contentType === "application/vnd.openxmlformats-officedocument.wordprocessingml.document") {
        yield call(extractAndDownloadFile,response);
        const messages = [{ message: 'File downloaded', show: false, tags: ['success'] }]
        yield put(fileDownloaded())
        yield call(timeAndDisplayMessages, messages)
    }
    else {
        let json = yield response.json();
        yield put(updateEntities(json))
        const messages = json.messages
        yield call(timeAndDisplayMessages, messages)
    }
}

function* extractAndDownloadFile(response) {
    let blob = yield response.blob();
    var a = document.createElement("a");
    document.body.appendChild(a);
    a.style = "display: none";
    var url = window.URL.createObjectURL(blob);
    a.href = url;
    a.download = "stickers_template.docx";
    a.click();
    window.URL.revokeObjectURL(url);
}

function* doActionWatcher() {
    yield takeEvery(DO_ACTION, doAction)
}

export function* transfer() {
    const json = yield call(Api.transfer, yield select(getSelections), yield select(getLocation), yield select(getSublocation), yield select(getFiltersAndSorting))
    yield put(updateEntities(json))
}

export function* designate() {
    const json = yield call(Api.designate, yield select(getSelections), yield select(getDesignatedLocation), yield select(getDesignatedSublocation), yield select(getFiltersAndSorting))
    yield put(updateEntities(json))
}

function* relocate() {
    const state = yield select()
    const json = yield call(Api.relocate, state)
    yield put(updateEntities(json))
}

function* designateWatcher() {
    yield takeEvery(DESIGNATE, designate)
}


function* transferWatcher() {
    yield takeEvery(TRANSFER, transfer)
}

function* fetchLookup(action) {
    const json = yield call(Api.fetchLookup, action.payload, action.lookup)
    yield put(setLookup(json, action.lookup))
}

function* fetchLookupWatcher() {
    yield takeEvery(FETCH_LOOKUP, fetchLookup)
}

function* fetchFilteredResults() {
    const filtersAndSorting = yield select(getFiltersAndSorting)
    const json = yield call(Api.filter, filtersAndSorting)
    yield put(updateEntities(json))
}

function* clearColumnSortWatcher() {
    yield takeEvery(CANCEL_SORTING, fetchFilteredResults)
}

function* clickColumnWatcher() {
    yield takeEvery(CLICK_COLUMN, fetchFilteredResults)
}

function* filterWatcher() {
    yield takeEvery(CLICK_FILTER, fetchFilteredResults)
}

function* searchBarcode(action) {
    if (action.barcode.length === 13) {
        if (validateEAN13(action.barcode)) {
            const entityId = yield select(getEntityIdByBarcode, action.barcode)
            if (entityId !== undefined) {
                const selected = yield select(isSelected, entityId)
                if (!selected) {
                    yield put(selectEntity(entityId))
                    const entity = yield select(getEntity, entityId)
                    yield fork(timeAndDisplayMessages, [{
                        message: `${entity.name} (${entity.barcode}) selected.`,
                        tags: [],
                        show: false
                    }])
                }
            } else {
                yield fork(timeAndDisplayMessages, [{
                    message: `${action.barcode} does not exist in collection.`,
                    tags: ['error'],
                    show: false
                }])
            }
        } else {
            yield fork(timeAndDisplayMessages, [{
                message: `${action.barcode} is not a valid EAN 13 barcode.`,
                tags: ['error'],
                show: false
            }])
        }
        yield put(barcodeChanged(''))
    }
}


function* searchScannedBarcode(action) {
    if (validateEAN13(action.barcode)) {
        const entityId = yield select(getEntityIdByBarcode, action.barcode)
        const selected = yield select(isSelected, entityId)
        if (entityId !== undefined && !selected) {
            yield put(selectEntity(entityId))
            const entity = yield select(getEntity, entityId)
            yield call(timeAndDisplayMessages, [{
                message: `${entity.name} (${entity.barcode} scanned and selected.`,
                tags: [],
                show: false
            }])
        }
    } else {
        yield call(timeAndDisplayMessages, [{
            message: `${action.barcode}) is not a valid EAN 13 barcode.`,
            tags: ['error'],
            show: false
        }])
    }
}

function* searchBarcodeWatcher() {
    // yield takeEvery(BARCODE_CHANGED, searchBarcode)
    yield debounce(200, BARCODE_CHANGED, searchBarcode)
}

function* scannedBarcodeWatcher() {
    yield throttle(2000, SCANNED_BARCODE, searchScannedBarcode)
}

function* toggleLoaderWatcher() {
    let count = 0
    while (true) {
        const action = yield take([CANCEL_SORTING, CLICK_COLUMN, CLICK_FILTER, TRANSFER, DESIGNATE, DO_ACTION, UPDATE_ENTITIES, FILE_DOWNLOADED])
        if (action.type !== UPDATE_ENTITIES && action.type !== FILE_DOWNLOADED) {
            count++
            yield put(showLoader())
        } else {
            count--
            if (count === 0) yield put(hideLoader())
        }
    }
}

export default function* root() {
    yield all([
        fork(clickColumnWatcher),
        fork(clearColumnSortWatcher),
        fork(filterWatcher),
        fork(fetchLookupWatcher),
        fork(transferWatcher),
        fork(designateWatcher),
        fork(doActionWatcher),
        fork(toggleLoaderWatcher),
        fork(searchBarcodeWatcher),
        fork(scannedBarcodeWatcher),
    ])
}
