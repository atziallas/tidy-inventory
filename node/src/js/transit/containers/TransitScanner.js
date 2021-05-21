import {getScannerShown, isScanning} from "../../common/reducers/scanner";
import {connect} from 'react-redux'
import {entityExists} from "../reducers/entities";
import {searchBarcode} from "../actions/actions";
import {toggleScanner, toggleScanning} from "../../common/actions/actions";
import {ScannerPopup} from "../../common/components/ScannerPopup";

const mapStateToProps = (state) => ({
    scannerShown: getScannerShown(state),
    entityExists: (barcode) => entityExists(state, barcode),
    scanning: isScanning(state)
})

const mapDispatchToProps = (dispatch) => ({
    scannedBarcode: (barcode) => dispatch(searchBarcode(barcode)),
    toggleScannerPopup: () => dispatch(toggleScanner()),
    toggleScanning: () => dispatch(toggleScanning())
})

export default connect(mapStateToProps, mapDispatchToProps)(ScannerPopup)