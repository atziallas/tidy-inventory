import {connect} from 'react-redux'
import {getLookup} from '../reducers/lookups';
import Autoselect from '../components/Autoselect';
import {getDesignatedLocation} from "../reducers/designatedLocations";
import {setDesignatedLocation} from "../actions/actions";

const mapStateToProps = (state) => ({
    options: getLookup(state,'location'),
    value: getDesignatedLocation(state)
})

const mapDispatchToProps = (dispatch) => ({
    handleChange: (value) => dispatch(setDesignatedLocation(value)),
})

export default connect(mapStateToProps,mapDispatchToProps)(Autoselect)