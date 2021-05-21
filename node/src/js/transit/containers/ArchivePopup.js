import React from 'react';
import {connect} from 'react-redux'
import Draggable from 'react-draggable';
import {hideArchive} from '../actions/actions';
import Archive from "../../search/containers/Archive";
import close from '../../../images/close.png'
import {getArchiveShown} from "../../common/reducers/messages";

const ArchivePopup = ({archiveShown, hideArchive}) => (
    <div className="archivePopup" style={{display: archiveShown ? 'block' : 'none'}}>
        <Draggable handle=".handle">
            <div className="box no-cursor align-items-center">
                <strong className="handle cursor">
                    <div className="looseRow justify-content-between">
                        <div className="col"></div>
                        <div className="col">Messages Archive</div>
                        <div className="col looseRow align-content-center justify-content-end no-gutters">
                            <div className="col-2 pb-1" style={{textAlign: 'right'}}><img src={close} onClick={hideArchive}/></div>
                        </div>
                    </div>
                </strong>
                <Archive/>
            </div>
        </Draggable>
    </div>
)
const mapStateToProps = (state) => ({
    archiveShown: getArchiveShown(state)
})

const mapDispatchToProps = (dispatch) => ({
    hideArchive: () => dispatch(hideArchive())
})

export default connect(mapStateToProps, mapDispatchToProps)(ArchivePopup)
