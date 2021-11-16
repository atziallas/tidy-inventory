import React, {Fragment} from 'react'
import DesignatedLocationSelect from "../../common/containers/DesignatedLocationSelect";
import DesignatedSublocationSelect from "../../common/containers/DesignatedSublocationSelect";
import {connect} from "react-redux";
import {designate} from "../../common/actions/actions";

const DesignateForm = ({designate}) =>
    (
        <Fragment>
            <div className="col-12 col-sm-5 col-md-4 col-xl-3">
                <div>
                    <label htmlFor="location">Designated Location</label>
                    <DesignatedLocationSelect/>
                </div>
            </div>
            <div className="col-12 col-sm-5 col-md-4 col-xl-3">
                <div>
                    <label htmlFor="sublocation">Designated Sublocation</label>
                    <DesignatedSublocationSelect/>
                </div>
            </div>
            <div className="col-12 col-sm-2 col-md-4 col-lg-3 col-xl-2 mt-auto limit-width-button">
                <button type="button" className="btn btn-primary btn-block mt-2 mt-sm-3" onClick={designate}>Designate selected</button>
            </div>
        </Fragment>
    )



const mapStateToProps = (state) => ({})

const mapDispatchToProps = (dispatch) => ({
    designate: (e) => dispatch(designate())
})

export default connect(mapStateToProps, mapDispatchToProps)(DesignateForm)
