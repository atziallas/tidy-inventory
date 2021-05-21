import {combineReducers} from "redux";
import {REMOVE_ENTITY} from "../../transit/actions/actions";
import {UPDATE_ENTITIES} from "../actions/actions"
import {SELECT_ENTITY, TOGGLE_SELECTION} from "../../common/actions/actions"
import {getEntities} from "../../transit/reducers/entities";

export const getEntity = (state, entityId) => state.entities.byId[entityId]
export const getEntityIdByBarcode = (state, barcode) => getAllEntityIds(state).find(e => state.entities.byId[e].barcode === barcode)
export const entityExists = (state, barcode) => getEntityIdByBarcode(state, barcode) !== undefined

const entity = (state = {}, action) => {
    switch (action.type) {
        case TOGGLE_SELECTION:
            return {
                ...state,
                selected: !state.selected
            }
        case SELECT_ENTITY:
            return {
                ...state,
                selected: true
            }
        default:
            return state
    }
}

export const getAllEntityIds = (state) => state.entities.allIds

const entitiesById = (state = {}, action) => {
    switch (action.type) {
        case TOGGLE_SELECTION:
        case SELECT_ENTITY:
            return {
                ...state,
                [action.entityId]: entity(state[action.entityId], action)
            }
        case UPDATE_ENTITIES:
            return action.entities.byId
        case REMOVE_ENTITY:
            let {[action.entityId]: omit, ...rest} = state
            return rest
        default:
            return state
    }
}

const entitiesAllIds = (state = [], action) => {
    switch (action.type) {
        case UPDATE_ENTITIES:
            return action.entities.allIds
        case REMOVE_ENTITY:
            return state.filter(e => e !== action.entity)
        default:
            return state
    }
}


const entities = combineReducers({
    byId: entitiesById,
    allIds: entitiesAllIds
})

export default entities