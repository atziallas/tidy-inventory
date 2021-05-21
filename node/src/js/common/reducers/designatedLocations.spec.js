import designatedLocations from "./designatedLocations";
import {SET_DESIGNATED_LOCATION, SET_DESIGNATED_SUBLOCATION} from "../actions/actions";


describe('locations reducer', () => {
    it('should return the initial state', () => {
        expect(
            designatedLocations({}, { type: "INIT" })
        ).toEqual({
            location: {},
            sublocation: {}
        });
    })

    it('should handle actions properly', () => {
        expect(
            designatedLocations({}, { type: SET_DESIGNATED_SUBLOCATION, value: { test: "test" } })
        ).toEqual({
            location: {},
            sublocation: { test: "test" }
        })

        expect(
            designatedLocations({
                location: {},
                sublocation: { removed: "removed" }
            }, { type: SET_DESIGNATED_LOCATION, value: { test: "test" } })
        ).toEqual({
            location: {test: "test"},
            sublocation: {  }
        })
    })
})
