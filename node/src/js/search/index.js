import React from 'react'
import { render } from 'react-dom'
import thunk from 'redux-thunk';
import { Provider } from 'react-redux'
import App from './containers/App'
import reducer from './reducers/reducer'
import '../../scss/search.scss'
import { composeWithDevTools } from 'redux-devtools-extension';
import rootSaga from './sagas'
import createSagaMiddleware from 'redux-saga'
import { createStore, applyMiddleware, } from 'redux';

const composeEnhancers = composeWithDevTools({
    // Specify name here, actionsBlacklist, actionsCreators and other options if needed
});
const sagaMiddleware = createSagaMiddleware()
const store = createStore(
    reducer, initialState, composeEnhancers(
        applyMiddleware(thunk),
        applyMiddleware(sagaMiddleware))
)
sagaMiddleware.run(rootSaga)

render(
    <Provider store={store}>
        <App />
    </Provider>,
    document.getElementById('root')
)

