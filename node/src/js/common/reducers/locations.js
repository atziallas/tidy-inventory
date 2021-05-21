import {combineReducers} from "redux";
import {SET_SUBLOCATION, SET_LOCATION} from "../actions/actions";
import {chainReducers, createSetterReducers, createSetterReducersObject} from "../utils/utils";
import {SET_TRANSITION} from "../../transit/actions/actions";
import {INCOMING, OUTGOING, OUTSIDE} from "../../transit/reducers/transition";
import {getLookupByFieldValue} from "./lookups";
import {getEntities} from "../../transit/reducers/entities";

export const getLocation = (state) => state.locations.location

export const getSublocation = (state) => state.locations.sublocation

const findTopLocation = (rootState) => {
    const entities = getEntities(rootState)
    var maxEncounters = 0
    var currentMax
    var acc = {}
    for (var i = 0; i < entities.length; i++) {
        const entity = entities[i]
        const key = entity.designatedLocation + '.' + entity.designatedSublocation
        if (key in acc) {
            acc[key]++
        } else {
            acc[key] = 1
        }
        if (acc[key] > maxEncounters) {
            maxEncounters = acc[key]
            currentMax = key
        }
    }
    return currentMax
}

const incomingTransitionLocation = (state = {}, action, rootState) => {
    if (action.type === SET_TRANSITION && action.transition === INCOMING) {
        getLookupByFieldValue(rootState, 'location', 'id', findTopLocation(rootState).split('.')[0])
    }
    else return state
}

const incomingTransitionSublocation = (state = {}, action, rootState) => {
    if (action.type === SET_TRANSITION && action.transition === INCOMING) {
        getLookupByFieldValue(rootState, 'sublocation', 'id', findTopLocation(rootState).split('.')[1])
    }
    else return state
}

const outgoingTransition = (state = {}, action, rootState) => {
    if (action.type === SET_TRANSITION && action.transition === OUTGOING)
        return getLookupByFieldValue(rootState, 'location', 'name', OUTSIDE)
    else return state
}

const resetSublocation = (state = {}, action) => action.type === SET_LOCATION ? {} : state

const locations = (state, action, rootState) => createSetterReducers([
    {
        name: 'location',
        action: SET_LOCATION,
        extraReducer: chainReducers(incomingTransitionLocation, outgoingTransition)
    },
    {
        name: 'sublocation',
        action: SET_SUBLOCATION,
        extraReducer: chainReducers(incomingTransitionSublocation, resetSublocation)
    }
], state, action, rootState)


export default locations

// export default locations



