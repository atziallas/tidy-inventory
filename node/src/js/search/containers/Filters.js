import React, {Fragment} from 'react'
import {connect} from 'react-redux'
import '../../../scss/_filters.css'
import {getFilters} from '../reducers/filters';
import {getLookup} from '../../common/reducers/lookups';
import {filterEntity} from '../actions/actions';
import history from "../../../images/history.png";
import {hideArchive, showArchive} from "../../transit/actions/actions";
import {getArchiveShown} from "../../common/reducers/messages";

const Filters = ({filters, getLookup, getFilterHandler, showArchive, toggleArchive}) =>
    <Fragment>
        <div onClick={toggleArchive(showArchive)} style={{cursor: 'pointer', margin: '16px 0px 8px 0px'}}>
            <img style={{'width': '31px', marginRight: '6px'}} src={history}/>Archive
        </div>
        {
            filters.map(filter => (
                <Fragment key={filter.id}>
                    <div className="filterHeader">{filter.title}</div>
                    <ul className="filter">
                        {getLookup(filter.id).map(item =>
                            (<li key={item.id} className={filter.values.includes(item.id) ? 'active' : ''}
                                 onClick={getFilterHandler(filter.id, item.id)}>
                                {item.name}
                            </li>)
                        )}
                    </ul>
                </Fragment>
            ))}
    </Fragment>


const mapStateToProps = (state) => ({
    filters: getFilters(state),
    getLookup: (lookup) => getLookup(state, lookup),
    showArchive: getArchiveShown(state),
})

const mapDispatchToProps = (dispatch) => ({
    getFilterHandler: (filterId, itemId) => (e) => dispatch(filterEntity(filterId, itemId)),
    toggleArchive: (archiveShown) => archiveShown ? () => dispatch(hideArchive()) : () => dispatch(showArchive()),
})

export default connect(mapStateToProps, mapDispatchToProps)(Filters)
