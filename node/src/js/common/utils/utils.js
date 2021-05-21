export const getThingUrl = (entityId) => `admin/core/thing/${entityId}/change/`


export const createSetterReducersObject = (slices) => {
    return slices.reduce((acc, slice) => {
        const reducer = (state = {}, action, rootState) => action.type === slice.action ? action.value : state
        let extraReducer = (state, action) => state;  //empty reducer
        if ('extraReducer' in slice) extraReducer = slice.extraReducer
        return {
            ...acc,
            [slice.name]: (state, action, rootState) => extraReducer(reducer(state, action, rootState), action, rootState)
        }
    }, {})
}

export const createSetterReducers = (slices, state = {}, action, rootState) => {
    return slices.reduce((acc, slice) => {
        const reducer = (state = {}, action, rootState) => action.type === slice.action ? action.value : state
        let extraReducer = (state, action) => state;  //empty reducer
        if ('extraReducer' in slice) extraReducer = slice.extraReducer
        return {
            ...acc,
            [slice.name]: extraReducer(reducer(state[slice.name], action, rootState), action, rootState)
        }
    }, {})
}

export const validateEAN13 = (code) => {
    if (code.length === 13) {
        var sum = 0;
        for (var i = 0; i < code.length - 1; i++) {
            if (i % 2 === 0) {
                sum += parseInt(code[i])
            } else {
                sum += parseInt(code[i]) * 3
            }
        }
        const lastDigit = sum % 10
        if (10 - lastDigit === parseInt(code[12])) return true
        if (lastDigit === 0 && parseInt(code[12]) === 0) return true
    }
    return false
}

export const chainReducers = (...reducers) => {
    return (state, action, rootState) => {
        var currentState = state
        for (var reducer of reducers) {
            currentState = reducer(currentState, action, rootState)
        }
        return currentState
    }
}
