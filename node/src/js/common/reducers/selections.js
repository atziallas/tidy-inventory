import {DESELECT_ALL, SELECT_ALL, SELECT_ENTITY, TOGGLE_SELECTION} from "../actions/actions";
import {getAllEntityIds} from "../../search/reducers/entities";

export const isSelected = (state, entityId) => state.selections.includes(entityId)

export const getSelections = (state) => state.selections

const selections = (state = [], action, rootState) => {
    switch (action.type) {
        case SELECT_ENTITY:
            return [...state, action.entityId]
        case TOGGLE_SELECTION:
            if (state.includes(action.entityId))
                return state.filter(e => e !== action.entityId)
            else
                return [...state, action.entityId]
        case SELECT_ALL:
            return getAllEntityIds(rootState)
        case DESELECT_ALL:
            return []
        default:
            return state

    }
}

export default selections
