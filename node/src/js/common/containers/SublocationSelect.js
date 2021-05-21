import {connect} from 'react-redux'
import Autoselect from "../components/Autoselect";
import {getFilteredSublocations} from '../reducers/lookups';
import {getLocation, getSublocation} from '../reducers/locations';
import {setSublocation} from '../actions/actions';

const mapStateToProps = (state) => ({
    options: getFilteredSublocations(state,getLocation(state)),
    value: getSublocation(state)
})

const mapDispatchToProps = (dispatch) => ({
    handleChange: (value) => dispatch(setSublocation(value)),
})


export default connect(mapStateToProps, mapDispatchToProps)(Autoselect)