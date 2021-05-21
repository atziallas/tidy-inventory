import {getScannerShown, isScanning} from "../../common/reducers/scanner";
import {connect} from 'react-redux'
import {scannedBarcode, toggleScanner, toggleScanning} from "../../common/actions/actions";
import {entityExists} from "../reducers/entities";
import {ScannerPopup} from "../../common/components/ScannerPopup";

const mapStateToProps = (state) => ({
    scannerShown: getScannerShown(state),
    entityExists: (barcode) => entityExists(state, barcode),
    scanning: isScanning(state)
})

const mapDispatchToProps = (dispatch) => ({
    scannedBarcode: (barcode) => dispatch(scannedBarcode(barcode)),
    toggleScannerPopup: () => dispatch(toggleScanner()),
    toggleScanning: () => dispatch(toggleScanning())
})

export default connect(mapStateToProps, mapDispatchToProps)(ScannerPopup)