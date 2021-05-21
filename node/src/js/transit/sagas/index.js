import {
    API_RESPONSE,
    apiResponse,
    REMOVE_BARCODE,
    REMOVE_ENTITY,
    removeEntity,
    SEARCH_BARCODE,
    searchBarcode,
    updateEntities
} from "../actions/actions";
import {actionChannel, all, call, debounce, fork, put, select, take, takeEvery, throttle} from "redux-saga/effects";
import 'regenerator-runtime/runtime'
import {hideLoader, showLoader} from "../../search/actions/actions";
import {timeAndDisplayMessages} from "../../common/sagas/messages";
import {
    BARCODE_CHANGED,
    clearBarcode,
    DESIGNATE,
    SCANNED_BARCODE,
    TOGGLE_SELECTION,
    toggleSelection,
    TRANSFER
} from "../../common/actions/actions";
import {getSelections} from "../../common/reducers/selections";
import {entityExists} from "../reducers/entities";
import {Api} from "../services/api";
import {getLocation, getSublocation} from "../../common/reducers/locations";
import {getDesignatedLocation, getDesignatedSublocation} from "../../common/reducers/designatedLocations";

//TODO: check this
function* selectLine() {
    const selections = yield select(getSelections)
    for (var selection of selections) {

    }
}

function* selectLineWatcher() {
    yield takeEvery(TOGGLE_SELECTION, selectLine)
}

function* removeScannedEntity(action) {
    const json = yield call(Api.removeEntity, action.entityId)
    yield put(updateEntities(json))
    yield put(apiResponse('removeEntity', json))

    //selecting an already existing entity will remove it from selections ;)
    yield put(toggleSelection(action.barcode))
}

function* removeBarcodeWatcher() {
    yield takeEvery(REMOVE_ENTITY, removeScannedEntity)
}

export function* transfer() {
    const json = yield call(Api.transfer,yield select(getSelections), yield select(getLocation), yield select(getSublocation))
    yield put(updateEntities(json))
    yield put(apiResponse('transfer', json))
}

export function* designate() {
    const json = yield call(Api.designate,yield select(getSelections), yield select(getDesignatedLocation), yield select(getDesignatedSublocation))
    yield put(updateEntities(json))
    yield put(apiResponse('designate', json))
}

function* designateWatcher() {
    yield takeEvery(DESIGNATE, designate)
}

function* transferWatcher() {
    yield takeEvery(TRANSFER, transfer)
}

function* barcodeChange(action) {
    if (action.barcode.length > 4) {
        yield call(searchBarcodeAPICall, action.barcode)
    }
}

function* searchBarcodeAPICall(barcode) {
    yield put(searchBarcode(barcode))
    const json = yield call(Api.searchBarcode, barcode)
    yield put(apiResponse('barcodeChanged', json))
    switch (json.result) {
        case 'found':
            yield put(updateEntities(json))
            yield put(clearBarcode())
            // yield put(toggleSelection(barcode))
            break
        case 'invalid':
        case 'exists':
            yield call(timeAndDisplayMessages, json.messages)
            break
    }
}

function* scannedBarcode(action) {
    if (!(yield select(entityExists,action.barcode)))
    {
        yield call(searchBarcodeAPICall, action.barcode)
    }
}

function* scannedBarcodeWatcher() {
    yield throttle(2000, SCANNED_BARCODE, scannedBarcode)
}

function* barcodeTextChangeWatcher() {
    yield debounce(520, BARCODE_CHANGED, barcodeChange)
}

function* loaderWatcher() {
    let pendingCalls = 0
    const channel = yield actionChannel([SEARCH_BARCODE, API_RESPONSE, REMOVE_BARCODE, DESIGNATE, TRANSFER])
    while (true) {
        const action = yield take(channel)
        switch (action.type) {
            case SEARCH_BARCODE:
            case REMOVE_BARCODE:
            case TRANSFER:
            case DESIGNATE:
                yield put(showLoader())
                pendingCalls++
                break
            case API_RESPONSE:
                pendingCalls--
                if (pendingCalls === 0) {
                    yield put(hideLoader())
                }
                break
        }
    }
}



export default function* root() {
    yield all([
        fork(barcodeTextChangeWatcher),
        fork(scannedBarcodeWatcher),
        fork(selectLineWatcher),
        fork(removeBarcodeWatcher),
        fork(transferWatcher),
        fork(loaderWatcher),
        fork(designateWatcher)
    ])
}