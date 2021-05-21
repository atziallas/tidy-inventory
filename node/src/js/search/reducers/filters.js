import { CLICK_FILTER, CLEAR_FILTER } from "../actions/actions";
import { combineReducers } from "redux";


export const getFilters = (state) => {
    return state.filters.filtersAllIds.map(id => ({
        id,
        values: state.filters.filtersById[id].values,
        title: state.filters.filtersById[id].title
    }))
}

const filtersAllIds = (state = [], action) => {
    return state
}
const values = (state = [], action, type) => {
    switch (action.type) {
        case CLICK_FILTER:
            if (type === 'multi') {
                if (!state.includes(action.value))
                    return [...state, action.value]
                else
                    return state.filter(f => f !== action.value)
            } else {
                return state.includes(action.value) ? [] : [action.value]
            }
        case CLEAR_FILTER:
            return []
        default:
            return state
    }
}

const title = (state = '', action) => {
    return state
}

const type = (state = '', action) => {
    return state
}

const filter = (state, action) => ({
    values: values(state.values, action, state.type),
    title: title(state.title, action),
    type: type(state.type, action)
})

const filtersById = (state = {}, action) => {
    switch (action.type) {
        case CLICK_FILTER:
        case CLEAR_FILTER:
            return {
                ...state,
                [action.filter]: filter(state[action.filter], action)
            }
        default:
            return state
    }
}


const filters = combineReducers({
    filtersById,
    filtersAllIds
})

export default filters