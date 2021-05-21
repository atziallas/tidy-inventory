import Autocomplete from "../components/Autocomplete";
import {connect} from 'react-redux'
import {getLocation, getSublocation, getSublocations, SUBLOCATION_LOOKUP} from "../reducers/reducer";
import {clearLookup, fetchLookup, setSublocation} from "../actions/actions";

const mapStateToProps = (state) => ({
    suggestions: getSublocations(state),
    location: getLocation(state),
    value: getSublocation(state)
})

const mapDispatchToProps = (dispatch) => ({
    callLookup: (payload) => dispatch(fetchLookup(payload, SUBLOCATION_LOOKUP)),
    clearSuggestions: () => dispatch(clearLookup(SUBLOCATION_LOOKUP)),
    valueChanged: (value) => dispatch(setSublocation(value)),

})

const mergeProps = (propsFromState, propsFromDispatch, ownProps) => {
    return {
        ...propsFromState,
        ...propsFromDispatch,
        fetchSuggestions: (keyword) => propsFromDispatch.callLookup({
            keyword: keyword.value,
            location: propsFromState.location
        })
    }
}
export default connect(mapStateToProps, mapDispatchToProps, mergeProps)(Autocomplete)
