export const SET_LOCATION = 'SET_LOCATION'
export const SET_SUBLOCATION = 'SET_SUBLOCATION'
export const SET_DESIGNATED_LOCATION = 'SET_DESIGNATED_LOCATION'
export const SET_DESIGNATED_SUBLOCATION = 'SET_DESIGNATED_SUBLOCATION'
export const SET_LOOKUP = 'SET_LOOKUP'
export const CLEAR_LOOKUP = 'CLEAR_LOOKUP'
export const FETCH_LOOKUP = 'FETCH_LOOKUP'
export const SET_MESSAGES = 'SET_MESSAGES'
export const SHOW_MESSAGES = 'SHOW_MESSAGES'
export const HIDE_MESSAGES = 'HIDE_MESSAGES'
export const CLEAR_MESSAGES = 'CLEAR_MESSAGES'
export const ARCHIVE_MESSAGES = 'ARCHIVE_MESSAGES'
export const SELECT_ALL = 'SELECT_ALL'
export const TOGGLE_SELECTION = 'TOGGLE_SELECTION'
export const SELECT_ENTITY = 'SELECT_ENTITY'
export const DESELECT_ALL = 'DESELECT_ALL'
export const DESIGNATE = 'DESIGNATE'
export const TRANSFER = 'TRANSFER'
export const TOGGLE_SCANNER = 'TOGGLE_SCANNER'
export const TOGGLE_SCANNING = 'TOGGLE_SCANNING'
export const MESSAGE_SHOW_TIME = 7000
export const MESSAGE_FADE_TIME = 500
export const SCANNED_BARCODE = 'SCANNED_BARCODE'
export const BARCODE_CHANGED = 'BARCODE_CHANGED'
export const CLEAR_BARCODE = 'CLEAR_BARCODE'
export const FILE_DOWNLOADED = 'FILE_DOWNLOADED'
export const ACTION_BLOCKED = 'ACTION_BLOCKED'

export const fileDownloaded = () => ({
    type: FILE_DOWNLOADED,
})

export const actionBlocked = () => ({
    type: ACTION_BLOCKED,
})

export const transfer = () => ({
    type: TRANSFER,
})

export const designate = () => ({
    type: DESIGNATE
})

export const deselectAll = () => ({
    type: DESELECT_ALL
})

export const selectAll = () => ({
    type: SELECT_ALL
})

export const selectEntity = (entityId) => ({
    type: SELECT_ENTITY,
    entityId: entityId
})

export const toggleSelection = (entityId) => ({
    type: TOGGLE_SELECTION,
    entityId: entityId
})

export const archiveMessages = (messages) => ({
    type: ARCHIVE_MESSAGES,
    messages
})

export const showMessages = (messages) => ({
    type: SHOW_MESSAGES,
    messages
})

export const hideMessages = (messages) => ({
    type: HIDE_MESSAGES,
    messages
})

export const clearMessages = (messages) => ({
    type: CLEAR_MESSAGES,
    messages
})

export const setMessages = (messages) => ({
    type: SET_MESSAGES,
    messages
})

export const setDesignatedLocation = (value) => ({
    type: SET_DESIGNATED_LOCATION,
    value
})

export const setDesignatedSublocation = (value) => ({
    type: SET_DESIGNATED_SUBLOCATION,
    value
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

export const fetchLookup = (payload, lookup) => ({
    type: FETCH_LOOKUP,
    payload,
    lookup
})

export const toggleScanning = () => ({
    type: TOGGLE_SCANNING
})
export const toggleScanner = () => ({
    type: TOGGLE_SCANNER
})
export const scannedBarcode = (barcode) => ({
    type: SCANNED_BARCODE,
    barcode
})
export const clearBarcode = () => ({
    type: CLEAR_BARCODE,
})
export const barcodeChanged = (barcode) => ({
    type: BARCODE_CHANGED,
    barcode
})