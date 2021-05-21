import {delay, put} from "redux-saga/effects";
import {archiveMessages, hideMessages, MESSAGE_FADE_TIME, MESSAGE_SHOW_TIME, setMessages, showMessages} from "../actions/actions";

export function* timeAndDisplayMessages(messages) {
    const timedMessages = messages.map(m => ({...m, timestamp: new Date()}));
    yield put(setMessages(timedMessages));
    yield put(showMessages(timedMessages));
    yield delay(MESSAGE_SHOW_TIME);
    yield put(hideMessages(timedMessages));
    yield delay(MESSAGE_FADE_TIME);
    yield put(archiveMessages(timedMessages))
}
