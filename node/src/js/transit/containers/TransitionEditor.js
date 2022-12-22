import React, {Fragment} from 'react';
import {connect} from 'react-redux'
import SublocationSelect from "../../common/containers/SublocationSelect";
import LocationSelect from "../../common/containers/LocationSelect";
import DesignatedLocationSelect from "../../common/containers/DesignatedLocationSelect";
import DesignatedSublocationSelect from "../../common/containers/DesignatedSublocationSelect";
import {getTransition, INCOMING, OUTGOING} from "../reducers/transition";
import {setTransition } from "../actions/actions";
import incoming from '../../../images/in.png'
import out from '../../../images/out.png'
import {designate, transfer} from "../../common/actions/actions";


const TransitionEditor = ({transition, setTransition, transfer, designate}) => {
    return (
        <Fragment>
            {/* <div className="row justify-content-center mt-3">
                <div className="col-5 col-md-4 col-lg-3 text-center">
                    <div className={"inOut p-3" + (transition === 'INCOMING' ? " selected" : "")} onClick={setTransition(INCOMING)}>
                        <img className="d-block mx-auto" src={incoming}/>
                        <div className="pt-2">Incoming</div>
                    </div>
                </div>
                <div className="col-5 col-md-4 col-lg-3 text-center">
                    <div className={"inOut p-3" + (transition === 'OUTGOING' ? " selected" : "")} onClick={setTransition(OUTGOING)}>
                        <img className="d-block mx-auto" src={out}/>
                        <div className="pt-2">Outgoing</div>
                    </div>
                </div>
            </div> */}
            <div className="row justify-content-center mt-3">
                <div className="col-12 col-sm-5 col-lg-4 col-xl-3">
                    <div>
                        <label htmlFor="location">Location</label>
                        <LocationSelect/>
                    </div>
                </div>
                <div className="col-12 col-sm-5 col-lg-4 col-xl-3">
                    <div>
                        <label htmlFor="sublocation">Sublocation</label>
                        <SublocationSelect/>
                    </div>
                </div>
            </div>
            <div className="row justify-content-center mt-4 mb-5">
                <div className="col-12 col-sm-5 col-lg-4 col-xl-3">
                    <button type="button" className="btn btn-warning btn-block" onClick={transfer}>Transfer</button>
                </div>
            </div>
            <div className="row justify-content-center mt-3">
                <div className="col-12 col-sm-5 col-lg-4 col-xl-3">
                    <div>
                        <label htmlFor="location">Designated Location</label>
                        <DesignatedLocationSelect/>
                    </div>
                </div>
                <div className="col-12 col-sm-5 col-lg-4 col-xl-3">
                    <div>
                        <label htmlFor="sublocation">Designated Sublocation</label>
                        <DesignatedSublocationSelect/>
                    </div>
                </div>
            </div>
            <div className="row justify-content-center mt-4 mb-5">
                <div className="col-12 col-sm-5 col-lg-4 col-xl-3">
                    <button type="button" className="btn btn-warning btn-block" onClick={designate}>Designate</button>
                </div>
            </div>
        </Fragment>
    )
}

const mapStateToProps = (state) => ({
    transition: getTransition(state),
})

const mapDispatchToProps = (dispatch,) => ({
    setTransition: (transition) => (e) => dispatch(setTransition(transition)),
    transfer: () => dispatch(transfer()),
    designate: () => dispatch(designate())
})

export default connect(mapStateToProps, mapDispatchToProps)(TransitionEditor)
