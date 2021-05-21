import expect from 'expect';
import {SET_LOCATION, SET_SUBLOCATION} from '../actions/actions';
import {createSetterReducersObjects} from './utils';

describe('create setter reducers', () => {
    it('should return an object of setter reducers that work properly', () => {
        const reducers = createSetterReducersObjects([
            {name: 'location', action: SET_LOCATION},
            {name: 'sublocation', action: SET_SUBLOCATION, extraReducer: (state = {}, action) => action.type === SET_LOCATION ? {} : state}
        ])

        expect(reducers.location({}, {
                type: SET_LOCATION,
                value: {number: "5"}
            })
        ).toEqual({number: "5"})

        expect(reducers.sublocation({number: "5"}, {
                type: SET_LOCATION,
                value: {number: "3"}
            })
        ).toEqual({})

        expect(reducers.sublocation({number: "5"}, {
                type: SET_SUBLOCATION,
                value: {number: "3"}
            })
        ).toEqual({number: "3"})
    })
}) 