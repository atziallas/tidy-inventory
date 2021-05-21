import {connect} from 'react-redux'
import { setLocation } from '../actions/actions';
import Autoselect from '../components/Autoselect';
import { getLookup } from '../reducers/lookups';
import { getLocation } from '../reducers/locations';

const mapStateToProps = (state) => ({
    options: getLookup(state,'location'),
    value: getLocation(state)
})

const mapDispatchToProps = (dispatch) => ({
    handleChange: (value) => dispatch(setLocation(value)),
})

export default connect(mapStateToProps,mapDispatchToProps)(Autoselect)