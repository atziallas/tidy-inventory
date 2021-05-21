import {hot} from 'react-hot-loader/root';
import React, {Fragment, useEffect, useState} from 'react';
import Results from './Results';
import Filters from "./Filters";
import Actions from './Actions';
import RelocateForm from "./RelocateForm"
import Messages from '../../common/containers/Messages';
import DesignateForm from "./DesignateForm";
import {HiArrowCircleLeft} from "react-icons/hi"
import ArchivePopup from "../../transit/containers/ArchivePopup";
import SearchScanner from "./SearchScanner";

const App = () => {
    const [sidebarVisible, setSidebarVisible] = useState(false);

    useEffect(() => {
        document.body.style.overflow = sidebarVisible ? "hidden" : "auto"
    }, [sidebarVisible]);

    return (
        <Fragment>
            <ArchivePopup/>
            <SearchScanner/>
            <div style={{paddingTop: '4px'}} className="container-fluid">
                <div className="row mb-4">
                    <Actions/>
                </div>
                <div className="row mb-4">
                    <RelocateForm/>
                </div>
                <div className="row mb-4">
                    <DesignateForm/>
                </div>
                <div className="row">
                    <Messages/>
                </div>
                <div className="row">
                    <div className="col-md-12 col-lg-10">
                        <Results/>
                    </div>
                    <div className={"col-lg-2 responsiveSidebar " + (sidebarVisible ? "active" : "")}>
                        <div className="sidebarButton" onClick={() => setSidebarVisible(!sidebarVisible)}>
                            <HiArrowCircleLeft size={45} style={{ fill: '#4c4c4c' }}/>
                            {/*<img src={arrow} alt="sidebar"/>*/}
                            <div style={{color:'#4c4c4c'}}>Filters</div>
                        </div>
                        <Filters/>
                    </div>
                </div>
            </div>
        </Fragment>
    )
}

export default hot(App)