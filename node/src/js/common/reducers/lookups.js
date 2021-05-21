import {CLEAR_LOOKUP, SET_LOOKUP} from "../actions/actions";

export const getFilteredSublocations = (state, location) => {
    const sublocations = state.lookups['sublocation']
    return sublocations.allIds.filter(id => location.id !== undefined ? sublocations.byId[id].location === location.id : true).map(id => ({
            'id': id,
            'name': sublocations.byId[id].name
        })
    )
}

export const getLookup = (state, lookup) => state.lookups[lookup].allIds.map(id => ({id, ...state.lookups[lookup].byId[id]}))

export const getLookupValueById = (state,lookup, id) => state.lookups[lookup].byId[id]

export const getLookupField = (state,lookup, id,field) => state.lookups[lookup].byId[id]?.[field]

export const getLookupByFieldValue = (state,lookup,field,value) => getLookupValueById(state,lookup,state.lookups[lookup].allIds.filter(id => getLookupField(state,lookup,id,field) === value))

const lookups = (state = {}, action) => {
    switch (action.type) {
        case SET_LOOKUP:
            return {
                ...state,
                [action.lookup]: action.results
            }
        case CLEAR_LOOKUP:
            return {
                ...state,
                [action.lookup]: []
            }

        default:
            return state
    }
}

export default lookups