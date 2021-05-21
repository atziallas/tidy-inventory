import locations from "./locations";
import { SET_SUBLOCATION, SET_LOCATION } from "../actions/actions";


describe('locations reducer', () => {
    it('should return the initial state', () => {
        expect(
            locations({}, { type: "INIT" })
        ).toEqual({
            location: {},
            sublocation: {}
        });
    })

    it('should handle actions properly', () => {
        expect(
            locations({}, { type: SET_SUBLOCATION, value: { test: "test" } })
        ).toEqual({
            location: {},
            sublocation: { test: "test" }
        })

        expect(
            locations({
                location: {},
                sublocation: { removed: "removed" }
            }, { type: SET_LOCATION, value: { test: "test" } })
        ).toEqual({
            location: {test: "test"},
            sublocation: {  }
        })
    })
})
