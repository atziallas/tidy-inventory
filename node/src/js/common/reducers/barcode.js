import {BARCODE_CHANGED, CLEAR_BARCODE} from "../actions/actions";

export const getBarcode = (state) => state.barcode
export const barcode = (state = "", action) => {
    switch (action.type) {
        case BARCODE_CHANGED:
            return action.barcode
        case CLEAR_BARCODE:
            return ""
        default:
            return state
    }
}