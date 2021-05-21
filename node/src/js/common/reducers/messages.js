import {ARCHIVE_MESSAGES, CLEAR_MESSAGES, HIDE_MESSAGES, SET_MESSAGES, SHOW_MESSAGES} from "../actions/actions";
import {HIDE_ARCHIVE, SHOW_ARCHIVE} from "../../transit/actions/actions";

export const getMessages = (state) => state.messages
export const getMessagesArchive = (state) => state.messagesArchive

export const messages = (state = [], action) => {
    switch (action.type) {
        case SET_MESSAGES:
            return [...state, ...action.messages]
        case SHOW_MESSAGES:
            return state.map(message => action.messages.some(m => m.timestamp === message.timestamp) ? { ...message, show: true } : message)
        case HIDE_MESSAGES:
            return state.map(message => action.messages.some(m => m.timestamp === message.timestamp) ? { ...message, show: false } : message)
        case ARCHIVE_MESSAGES:
            return state.filter(message => !action.messages.some(m => m.timestamp === message.timestamp))
        default:
            return state
    }
}

export const messagesArchive = (state = [], action) => {
    switch (action.type) {
        case ARCHIVE_MESSAGES:
            return [...state, ...action.messages]
        case CLEAR_MESSAGES:
            return state.filter(message => !action.messages.some(m => m.timestamp === message.timestamp))
        default:
            return state
    }
}
export const getArchiveShown = (state) => state.showArchive
export const showArchive = (state = false, action) => {
    switch (action.type) {
        case SHOW_ARCHIVE:
            return true
        case HIDE_ARCHIVE:
            return false
        default:
            return state
    }
}