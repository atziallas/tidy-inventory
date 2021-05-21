import lookups from "../../common/reducers/lookups"
import locations from "../../common/reducers/locations"
import transition from "./transition";
import loader from "./loader";
import entities from "./entities";
import designatedLocations from "../../common/reducers/designatedLocations";
import {UPDATE_ENTITIES} from "../actions/actions";
import {messages, messagesArchive, showArchive} from "../../common/reducers/messages";
import selections from "../../common/reducers/selections";
import {scanning, showScanner} from "../../common/reducers/scanner";
import {barcode} from "../../common/reducers/barcode";


const commonLocations = (state, action) => {
    return {}
}

//TODO: you may have to fix this
export const reducer = (state, action) => {
    switch (action.type) {
        case UPDATE_ENTITIES:
            return {...state, ...action.response.state}
        default:
            return {
                barcode: barcode(state.barcode, action),
                lookups: lookups(state.lookups, action),
                locations: locations(state.locations, action, state),
                designatedLocations: designatedLocations(state.designatedLocations, action),
                selections: selections(state.selections, action, state.entities),
                transition: transition(state.transition, action),
                entities: entities(state.entities, action),
                loader: loader(state.loader, action),
                messages: messages(state.messages, action),
                messagesArchive: messagesArchive(state.messagesArchive, action),
                showArchive: showArchive(state.showArchive, action),
                showScanner: showScanner(state.showScanner, action),
                scanning: scanning(state.scanning, action)
            }
    }
}