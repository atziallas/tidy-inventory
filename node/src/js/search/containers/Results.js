import React from 'react'
import { connect } from 'react-redux'
import { getFields, getLoading, } from '../reducers/reducer';
import { Loader } from "../components/Loader";
import { getAllEntityIds, getEntity } from '../reducers/entities';
import { isSelected } from "../../common/reducers/selections";
import { toggleSelection } from "../../common/actions/actions";
import ResultsHeader from "./ResultsHeader";
import { getLookup, getLookupField } from "../../common/reducers/lookups";
import { getThingUrl } from "../../common/utils/utils";

const drawFieldCell = (entityId, field, getEntity) => {
    if (field.id === 'name')
        return (
            <td key={field.id}>
                <a href={getThingUrl(entityId)}>{getEntity(entityId).name}</a>
            </td>
        )
    else if (field.id === 'fetched_length') {
        var length = getEntity(entityId)[field.id]
        if (length === "0.0") {
            length = "-"
        }
        return (
            <td key={field.id}>
                <span>{length}</span>
            </td>
        )
    }
    else
        // django admin returns html for some fields e.g. <img> for boolean fields
        return (
            <td key={field.id}> 
                <span dangerouslySetInnerHTML={{ __html: getEntity(entityId)[field.id] }} />
            </td>
        )

}

const Results = ({ fields, entityIds, getEntity, isSelected, selectLine, loading }) => (
    <div className={loading ? "loading" : ""} style={{ position: "relative" }}>
        <Loader width="150px" height="90px" extraClasses="" />
        <div className="loaderModal">
            <div className="table-responsive-lg">
                <table className="table table-striped mt-2 searchTable vertical-middle">
                    <ResultsHeader />
                    <tbody>
                        {entityIds.map(entityId => (
                            <tr key={entityId} onClick={selectLine(entityId)}
                                className={isSelected(entityId) ? 'table-warning' : ''}>
                                <td>
                                    <input type="checkbox" checked={isSelected(entityId)}
                                        value={entityId} readOnly />
                                </td>
                                {fields.map(field =>
                                   drawFieldCell(entityId, field, getEntity) 
                                )}
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
)

const mapStateToProps = (state) => ({
    fields: getFields(state),
    entityIds: getAllEntityIds(state),
    getEntity: (entityId) => getEntity(state, entityId),
    isSelected: (entityId) => isSelected(state, entityId),
    loading: getLoading(state)
})

const mapDispatchToProps = (dispatch) => ({
    selectLine: (entityId) => (e) => dispatch(toggleSelection(entityId)),
})

export default connect(mapStateToProps, mapDispatchToProps)(Results)