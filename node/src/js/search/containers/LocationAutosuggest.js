import Autocomplete from "../components/Autocomplete";
import {connect} from 'react-redux'
import {getLookup, LOCATION_LOOKUP} from "../reducers/reducer";
import {clearLookup, fetchLookup, setLocation} from "../actions/actions";

const mapStateToProps = (state) => ({
    suggestions: getLookup(state,"location"),
    value: getLookup(state,'location')
})

const mapDispatchToProps = (dispatch) => ({
    fetchSuggestions: (keyword) => dispatch(fetchLookup(keyword.value, LOCATION_LOOKUP)),
    clearSuggestions: () => dispatch(clearLookup(LOCATION_LOOKUP)),
    valueChanged: (value) => dispatch(setLocation(value)),
})

export default connect(mapStateToProps,mapDispatchToProps)(Autocomplete)
