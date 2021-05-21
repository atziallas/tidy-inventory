import React from 'react'
import { connect } from 'react-redux'
import {getMessages} from "../reducers/messages";

const Messages = ({ messages }) => (
    <div className="col-12 rounded">
        <ul className="messagelist">
            {messages.map((message,index) => (
                <li key={index} className={"fade " + message.tags.join(" ") + (message.show ? " fadeIn" : " fadeOut")}>{message.message}</li>
            ))}
        </ul>
    </div>
)

const mapStateToProps = (state) => ({
    messages: getMessages(state)
})

export default connect(mapStateToProps)(Messages)