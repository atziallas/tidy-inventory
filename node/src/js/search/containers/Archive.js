import React from 'react';
import {connect} from 'react-redux'
import {getMessagesArchive} from "../../common/reducers/messages";

const Archive = ({messages}) => (
    <div className="table-responsive-lg">
        <table className="table table-striped mt-2 searchTable">
            <thead>
            <tr>
                <th>Message</th>
                <th>Timestamp</th>
            </tr>
            </thead>
            <tbody>
            {messages.map((message, index) => (
                <tr key={index}>
                    <td>{message.message}</td>
                    <td>{message.timestamp.toString()}</td>
                </tr>
            ))}
            </tbody>
        </table>
    </div>
)

const mapStateToProps = (state) => ({
    messages: getMessagesArchive(state)
})

const mapDiscpatchToProps = () => ({})

export default connect(mapStateToProps, mapDiscpatchToProps)(Archive)
