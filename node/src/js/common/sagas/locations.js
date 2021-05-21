import {apiResponse, updateEntities} from "../../transit/actions/actions";
import {getDesignatedLocation, getDesignatedSublocation} from "../reducers/designatedLocations";
import {getSelections} from "../reducers/selections";
import {getLocation, getSublocation} from "../reducers/locations";
import {put, call, select} from "redux-saga/effects";
import {Api} from "../services/api";

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
