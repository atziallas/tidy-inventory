import React, {Fragment} from 'react';
import {connect} from 'react-redux'
import TransitionEditor from "./TransitionEditor";
import ArchivePopup from "./ArchivePopup";
import SearchBar from "./SearchBar";
import ScanResults from "./ScanResults";
import ScannerPopup from "../../common/components/ScannerPopup";
import TransitScanner from "./TransitScanner";

const App = () => (
    <Fragment>
        <ArchivePopup/>
        <TransitScanner/>
        <div className="container-fluid">
            <SearchBar/>
            <ScanResults/>
            <TransitionEditor/>
        </div>
    </Fragment>
)

const mapStateToProps = (state) => ({
})

const mapDispatchToProps = (dispatch) => ({
})

export default connect(mapStateToProps, mapDispatchToProps)(App)