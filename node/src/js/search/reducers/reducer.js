import {
    CANCEL_SORTING,
    CLEAR_LOOKUP,
    CLICK_COLUMN,
    HIDE_LOADER,
    SELECT_ACTION,
    SET_LOCATION,
    SET_LOOKUP,
    SET_SUBLOCATION,
    SHOW_LOADER
} from "../actions/actions";
import {combineReducers} from "redux";
import locations from "../../common/reducers/locations";
import lookups from "../../common/reducers/lookups";
import filters, {getFilters} from "./filters";
import entities from "./entities";
import {messages, messagesArchive, showArchive} from "../../common/reducers/messages";
import selections from "../../common/reducers/selections";
import designatedLocations from "../../common/reducers/designatedLocations";
import {scanning, showScanner} from "../../common/reducers/scanner";
import {barcode} from "../../common/reducers/barcode";

export const LOCATION_LOOKUP = 'location'
export const SUBLOCATION_LOOKUP = 'sublocation'

export const getSortingIndex = (state, index) => state.sorting.findIndex(i => Math.abs(i) === index) + 1

export const getSortingImage = (state, index) => {
    for (let i = 0; i < state.sorting.length; i++) {
        if (Math.abs(state.sorting[i]) === index) {
            return state.sorting[i] > 0 ? 'up' : 'down'
        }
    }
    return 'none'
}

export const getFiltersAndSorting = (state) => ({
    filters: getFilters(state),
    sorting: getSorting(state)
})

export const getSorting = (state) => state.sorting

export const countSortedColumns = (state) => state.sorting.length

const sorting = (state = [], action) => {
    switch (action.type) {
        case CLICK_COLUMN:
            let found = false;
            const newState = state.map(column => {
                    if (action.columnIndex === Math.abs(column)) {
                        found = true
                        return -column
                    } else
                        return column
                }
            )
            if (found) return newState
            else return [action.columnIndex, ...state]
        case CANCEL_SORTING:
            return state.filter(column => Math.abs(column) !== action.columnIndex)
        default:
            return state

    }
}

export const getFields = (state) => state.fields

const fields = (state = [], action) => {
    return state
}

export const getActions = (state) => state.actions

const actions = (state = [], action) => state

export const getLoading = (state) => state.loading

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

export const getSelectedAction = (state) => state.selectedAction

const selectedAction = (state = '', action) => {
    switch (action.type) {
        case SELECT_ACTION:
            return action.action
        default:
            return state
    }
}

const reducer = (state, action) => ({
    actions: actions(state.actions, action),
    barcode: barcode(state.barcode, action),
    selectedAction: selectedAction(state.selectedAction, action),
    messages: messages(state.messages, action),
    messagesArchive: messagesArchive(state.messagesArchive, action),
    showArchive: showArchive(state.showArchive, action),
    showScanner: showScanner(state.showScanner, action),
    scanning: scanning(state.scanning, action),
    sorting: sorting(state.sorting, action),
    fields: fields(state.fields, action),
    entities: entities(state.entities, action),
    locations: locations(state.locations, action),
    designatedLocations: designatedLocations(state.designatedLocations, action),
    filters: filters(state.filters, action),
    lookups: lookups(state.lookups, action),
    selections: selections(state.selections, action, state),
    loading: loading(state.loading,action)
})

export default reducer