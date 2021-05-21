import {combineReducers} from "redux";
import {createSetterReducersObject} from "../utils/utils";
import {SET_DESIGNATED_LOCATION, SET_DESIGNATED_SUBLOCATION} from "../actions/actions";

export const getDesignatedLocation = (state) => state.designatedLocations.location

export const getDesignatedSublocation = (state) => state.designatedLocations.sublocation

const designatedLocations = combineReducers(createSetterReducersObject([
    {name: 'location', action: SET_DESIGNATED_LOCATION},
    {name: 'sublocation', action: SET_DESIGNATED_SUBLOCATION, extraReducer: (state={}, action) => action.type === SET_DESIGNATED_LOCATION ? {} : state}
]))

export default designatedLocations



