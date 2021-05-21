import {SET_TRANSITION} from "../actions/actions";

export const getTransition = (state) => state.transition
export const OUTGOING = 'OUTGOING'
export const INCOMING = 'INCOMING'
export const OUTSIDE = 'Outside'

const transition = (state = "", action) => {
    switch (action.type) {
        case SET_TRANSITION:
            return action.transition
        default:
            return state
    }
}

export default transition