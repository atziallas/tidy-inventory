import React from 'react'
import {connect} from 'react-redux'
import up from "../../../images/up.png";
import down from "../../../images/down.png";
import clear from "../../../images/removeFilter.jpg";
import {countSortedColumns, getFields, getSortingImage, getSortingIndex} from "../reducers/reducer";
import {deselectAll, selectAll} from "../../common/actions/actions";
import {clearColumn, clickColumn} from "../actions/actions";

const headerStyle = {
    'width': '18px',
    'margin': '0px 0px 3px 3px'
}

const ResultsHeader = ({fields,sortedColumnsCount,getSortingIndex,getSortingImage,clickColumn,clearColumnSort,checkAll}) => (
    <thead>
    <tr>
        <th className="sortable-header">
            <input type="checkbox" onChange={checkAll}/>
        </th>
        {fields.map((field, index) => (
            <th key={index} className="sortable-header">
                <span style={{cursor:'pointer'}} onClick={clickColumn(index + 1)}>{field.label}</span>
                {getSortingImage(index + 1) !== 'none' &&
                <span style={{paddingLeft: '7px'}}>
                    <span>{sortedColumnsCount === 1 ? "" : getSortingIndex(index + 1)}</span>
                    <img style={headerStyle} src={getSortingImage(index + 1) === 'up' ? up : down}/>
                    <img
                        onClick={clearColumnSort(index + 1)}
                        style={{cursor:'pointer',margin: '-5px 0px 0px 4px', width: '22px'}}
                        src={clear}/>
                </span>
                }
            </th>
        ))}
    </tr>
    </thead>
)

const mapStateToProps = (state) => ({
    fields: getFields(state),
    sortedColumnsCount: countSortedColumns(state),
    getSortingImage: (index) => getSortingImage(state, index),
    getSortingIndex: (index) => getSortingIndex(state, index),
})

const mapDispatchToProps = (dispatch) => ({
    checkAll: (e) => e.target.checked ? dispatch(selectAll()) : dispatch(deselectAll()),
    clickColumn: (index) => (e) => dispatch(clickColumn(index)),
    clearColumnSort: (index) => (e) => dispatch(clearColumn(index))
})

export default connect(mapStateToProps, mapDispatchToProps)(ResultsHeader)
