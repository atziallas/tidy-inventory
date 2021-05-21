import {TOGGLE_SCANNER, TOGGLE_SCANNING} from "../actions/actions";

export const getScannerShown = (state) => state.showScanner
export const showScanner = (state = false, action) => {
    switch (action.type) {
        case TOGGLE_SCANNER:
            return !state
        default:
            return state
    }
}

export const isScanning = (state) => state.scanning
export const scanning = (state = false, action) => {
    switch (action.type) {
        case TOGGLE_SCANNING:
            return !state
        default:
            return state
    }
}