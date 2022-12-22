import React, {Fragment} from 'react';
import {connect} from 'react-redux'
import {hideArchive, showArchive} from "../actions/actions";
import {getLoading} from "../reducers/loader";
import Messages from "../../common/containers/Messages";
import {Loader} from "../../search/components/Loader";
import history from '../../../images/history.png'
import {IoBarcodeOutline} from "react-icons/io5"
import {barcodeChanged, toggleScanner} from "../../common/actions/actions";
import {getArchiveShown} from "../../common/reducers/messages";
import {getBarcode} from "../../common/reducers/barcode";

const SearchBar = ({barcode, showArchive, loading, toggleArchive, toggleBarcode, searchBarcode}) => (
    <Fragment>
        <div className="row">
            <div className="col-1 align-self-start my-4">
                <img onClick={toggleArchive(showArchive)} style={{'width': '38px', 'cursor': 'pointer'}} src={history}/>
            </div>
            <div className="col-8 col-sm-6 col-md-6 my-4 ml-auto">
                <div className="row align-items-center">
                    <div className="input-group popout">
                        <div className="input-group-prepend">
                            <span className="input-group-text">Barcode</span>
                        </div>
                        <input type="text"
                               maxLength={13}
                               className="form-control"
                               onChange={searchBarcode}
                               value={barcode}
                               placeholder="Enter or scan a barcode"
                        />
                    </div>
                </div>
            </div>
            <div onClick={toggleBarcode} style={{cursor: 'pointer'}} className="col-1 align-self-center pointer">
                <IoBarcodeOutline size={35}/>
            </div>
            <div className="col-1 mr-auto">
                <Loader extraClasses={"inline " + (loading ? "loading" : "")} width="63px" height="90px"/>
            </div>
        </div>
        <div className="row justify-content-center">
            <Messages/>
        </div>
        <div className="quagga-scanner">


        </div>
    </Fragment>
)
const mapStateToProps = (state) => ({
    barcode: getBarcode(state),
    showArchive: getArchiveShown(state),
    loading: getLoading(state),
})

const mapDispatchToProps = (dispatch) => ({
    toggleArchive: (archiveShown) => archiveShown ? () => dispatch(hideArchive()) : () => dispatch(showArchive()),
    toggleBarcode: () => dispatch(toggleScanner()),
    searchBarcode: (e) => dispatch(barcodeChanged(e.target.value)),
})

export default connect(mapStateToProps, mapDispatchToProps)(SearchBar)
