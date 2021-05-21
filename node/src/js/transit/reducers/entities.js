import { UPDATE_ENTITIES,REMOVE_ENTITY } from "../actions/actions";

export const getEntities = (state) => state.entities
export const entityExists = (state, barcode) => (getEntities(state).find(e => e.barcode === barcode) > 0)

const entities = (state = [], action) => {
    switch (action.type) {
        case UPDATE_ENTITIES:
            return [...state, action.response.entities]
        // case REMOVE_ENTITY:
        //     return state.filter(e => e.id !== action.entity)
        default:
            return state

    }
}

export default entities