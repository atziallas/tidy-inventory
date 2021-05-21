export const SET_TRANSITION = 'SET_TRANSITION'
export const SEARCH_BARCODE = 'SEARCH_BARCODE'
export const UPDATE_ENTITIES = 'UPDATE_ENTITIES'
export const REMOVE_ENTITY = 'REMOVE_ENTITY'
export const SHOW_ERROR = 'SHOW_ERROR'
export const CLEAR_ERROR = 'CLEAR_ERROR'
export const REMOVE_BARCODE = 'REMOVE_BARCODE'
export const API_RESPONSE = 'API_RESPONSE'
export const SHOW_ARCHIVE = 'SHOW_ARCHIVE'
export const HIDE_ARCHIVE = 'HIDE_ARCHIVE'

export const showArchive = () => ({
    type: SHOW_ARCHIVE
})

export const hideArchive = () => ({
    type: HIDE_ARCHIVE
})

export const apiResponse = (api, response) => ({
    type: API_RESPONSE,
    api,
    response
})


export const updateEntities = (response) => ({
    type: UPDATE_ENTITIES,
    response
})

export const removeEntity = (entityId) => ({
    type: REMOVE_ENTITY,
    entityId
})

export const searchBarcode = (barcode) => ({
    type: SEARCH_BARCODE,
    barcode
})

export const setTransition = (transition) => ({
    type: SET_TRANSITION,
    transition
})

export const showError = (error) => ({
    type: SHOW_ERROR,
    error
})

export const clearError = (error) => ({
    type: CLEAR_ERROR,
    error
})
