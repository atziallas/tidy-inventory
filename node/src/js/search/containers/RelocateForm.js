import React, {Fragment} from 'react'
import {connect} from 'react-redux'
import LocationSelect from "../../common/containers/LocationSelect";
import SublocationSelect from "../../common/containers/SublocationSelect";
import {transfer} from "../../common/actions/actions";

const RelocateForm = ({relocate}) => {
    return (
        <Fragment>
            <div className="col-12 col-sm-5 col-md-4 col-xl-3">
                <div>
                    <label htmlFor="location">Location</label>
                    <LocationSelect/>
                </div>
            </div>
            <div className="col-12 col-sm-5 col-md-4 col-xl-3">
                <div>
                    <label htmlFor="sublocation">Sublocation</label>
                    <SublocationSelect/>
                </div>
            </div>
            <div className="col-12 col-sm-2 col-md-4 col-lg-3 col-xl-2 mt-auto limit-width-button">
                <button type="button" className="btn btn-primary btn-block mt-2 mt-sm-3" onClick={relocate}>Relocate selected</button>
            </div>
        </Fragment>
    )
}

const mapStateToProps = (state) => ({})

const mapDispatchToProps = (dispatch) => ({
    relocate: (e) => dispatch(transfer())
})

export default connect(mapStateToProps, mapDispatchToProps)(RelocateForm)
