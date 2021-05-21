import 'whatwg-fetch'
import {CLEAR_LOOKUP, SET_LOCATION, SET_LOOKUP, SET_SUBLOCATION} from "../../common/actions/actions";

export const UPDATE_ENTITIES = 'UPDATE_ENTITIES'
export const CLICK_FILTER = 'CLICK_FILTER'
export const CLEAR_FILTER = 'CLEAR_FILTER'
export const CLICK_COLUMN = 'CLICK_COLUMN'
export const CANCEL_SORTING = 'CANCEL_SORTING'
export const DO_ACTION = 'DO_ACTION'
export const SELECT_ACTION = 'SELECT_ACTION'
export const SHOW_LOADER = 'SHOW_LOADER'
export const HIDE_LOADER = 'HIDE_LOADER'
export const SEARCH_BARCODE = 'SEARCH_BARCODE'

export const searchBarcode = (barcode) => ({
    type: SEARCH_BARCODE,
    barcode
})

export const doAction = () => ({
    type: DO_ACTION
})

export const selectAction = (action) => ({
    type: SELECT_ACTION,
    action
})

export const clearColumn = (columnIndex) => ({
    type: CANCEL_SORTING,
    columnIndex
})

export const cancelSorting = (columnIndex) => ({
    type: CANCEL_SORTING,
    columnIndex
})


export const clickColumn = (columnIndex) => ({
    type: CLICK_COLUMN,
    columnIndex
})

export const filterEntity = (filter, value) => ({
    type: CLICK_FILTER,
    filter,
    value,
})

export const setLocation = (value) => ({
    type: SET_LOCATION,
    value
})

export const setSublocation = (value) => ({
    type: SET_SUBLOCATION,
    value
})

export const setLookup = (results, lookup) => ({
    type: SET_LOOKUP,
    results,
    lookup
})

export const clearLookup = () => ({
    type: CLEAR_LOOKUP
})

export const updateEntities = (entities) => ({
    type: UPDATE_ENTITIES,
    ...entities
})


export const showLoader = () => ({
    type: SHOW_LOADER
})

export const hideLoader = () => ({
    type: HIDE_LOADER
})
