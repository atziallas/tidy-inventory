import {connect} from 'react-redux'
import {getFilteredSublocations} from '../reducers/lookups';
import Autoselect from '../components/Autoselect';
import {getDesignatedLocation, getDesignatedSublocation} from "../reducers/designatedLocations";
import {setDesignatedSublocation} from "../actions/actions";

const mapStateToProps = (state) => ({
    options: getFilteredSublocations(state,getDesignatedLocation(state)),
    value: getDesignatedSublocation(state)
})

const mapDispatchToProps = (dispatch) => ({
    handleChange: (value) => dispatch(setDesignatedSublocation(value)),
})

export default connect(mapStateToProps,mapDispatchToProps)(Autoselect)
