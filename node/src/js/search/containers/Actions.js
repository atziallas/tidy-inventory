import React, {Fragment, useEffect} from 'react'
import {connect} from 'react-redux'
import '../../../scss/_filters.css'
import {doAction, searchBarcode, selectAction} from "../actions/actions";
import {getActions} from '../reducers/reducer';
import Autoselect from "../../common/components/Autoselect";
import {IoBarcodeOutline} from "react-icons/io5"
import {barcodeChanged, toggleScanner} from "../../common/actions/actions";
import {getBarcode} from "../../common/reducers/barcode";

const Actions = ({actions, handleChange, doAction, toggleScanner, searchBarcode, barcode}) => {
   useEffect( () => {
       document.getElementById('barcodeInput').focus()
   },[])
   return (
    <Fragment>
        <div className="col-12 col-sm-5 col-md-4 col-xl-3">
            <div>
                <label htmlFor="actions">Actions</label>
                <Autoselect handleChange={handleChange}
                            options={actions}
                            getOptionValue={o => o.key}
                            getOptionLabel={o => o.name}
                />
            </div>
        </div>
        <div className="col-12 col-sm-2 col-md-4 col-lg-3 col-xl-2 mt-auto limit-width-button">
            <button onClick={doAction} type="button" className="btn btn-primary btn-block mt-2 mt-sm-3">Go!</button>
        </div>
        <div className="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-3 mt-3 mt-md-0 ml-lg-3 ml-0 align-items-end">
            <div>
                <label htmlFor="actions">Select by Barcode</label>
            </div>
            <div className="row no-gutters">
                <div className="col-11 col-sm-10">
                    <div className="input-group popout">
                        <div className="input-group-prepend">
                            <span className="input-group-text">Barcode</span>
                        </div>
                        <input id="barcodeInput" type="text"
                               maxLength={13}
                               className="form-control"
                               onChange={searchBarcode}
                               value={barcode}
                        />
                    </div>
                </div>
                <div onClick={toggleScanner} style={{cursor: 'pointer'}} className="col-1 col-sm-1 ml-sm-0 ml-md-2">
                    <IoBarcodeOutline size={35}/>
                </div>
            </div>
        </div>
    </Fragment>
)}


const mapStateToProps = (state) => ({
    actions: getActions(state),
    barcode: getBarcode(state)
})

const mapDispatchToProps = (dispatch) => ({
    handleChange: (val) => dispatch(selectAction(val.key)),
    searchBarcode: (e) => dispatch(barcodeChanged(e.target.value)),
    toggleScanner: () => dispatch(toggleScanner()),
    doAction: (e) => dispatch(doAction())
})

export default connect(mapStateToProps, mapDispatchToProps)(Actions)
