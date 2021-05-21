import {combineReducers} from "redux"
import { SHOW_ERROR, CLEAR_ERROR } from "../actions/actions";
import { SHOW_LOADER, HIDE_LOADER } from "../../search/actions/actions";

export const getLoading = (state) => state.loader.loading

const loading = (state = false, action) => {
    switch (action.type) {
        case SHOW_LOADER:
            return true
        case HIDE_LOADER:
            return false
        default:
            return state
    }
}

export const getError = (state) => state.loader.error

const error = (state = "", action) => {
    switch (action.type) {
        case SHOW_ERROR:
            return action.error
        case CLEAR_ERROR:
            return ""
        default:
            return state
    }
}

const loader = combineReducers({loading,error})

export default loader