import React, {Fragment} from 'react';
import {connect} from 'react-redux'
import {removeBarcode, removeEntity} from '../actions/actions';
import {getEntities} from '../reducers/entities';
import {isSelected} from "../../common/reducers/selections";
import {deselectAll, selectAll, toggleSelection} from "../../common/actions/actions";
import SearchBar from "./SearchBar";
import {getLookupField} from "../../common/reducers/lookups";


const ScanResults = ({checkAll, entities, removeEntity, selectLine, isSelected, getLookupName}) => (
    <div className="row justify-content-center">
        <div className="col-11 col-sm-12">
            <table className="table table-striped searchTable vertical-middle">
                <thead>
                <tr className="text-uppercase">
                    <th className="sortable-header" style={{textAlign: 'center'}}><input type="checkbox"
                                                                                         onChange={checkAll}/></th>
                    <th>Name</th>
                    <th>Barcode</th>
                    <th>Type</th>
                    <th>Location</th>
                    <th>Sublocation</th>
                    <th>Designated Location</th>
                    <th>Designated Sublocation</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                {
                    entities.map(entity => (
                        <tr key={entity.barcode} style={{cursor: 'pointer'}} onClick={selectLine(entity.id)}
                            className={isSelected(entity.id) ? 'table-warning' : ''}>
                            <td>
                                <input type="checkbox" readOnly={true} checked={isSelected(entity.id)}/>
                            </td>
                            <td>{entity.name}</td>
                            <td>{entity.barcode}</td>
                            <td>{entity.type}</td>
                            <td>{getLookupName(entity.location, 'location')}</td>
                            <td>{getLookupName(entity.sublocation, 'sublocation')}</td>
                            <td>{getLookupName(entity.designatedLocation, 'location')}</td>
                            <td>{getLookupName(entity.designatedSublocation, 'sublocation')}</td>
                            <td style={{textAlign: 'center'}}>
                                <input type="button" value="remove" onClick={removeEntity(entity.id)}/>
                            </td>
                        </tr>
                    ))
                }
                </tbody>
            </table>
        </div>
    </div>
)

const mapStateToProps = (state) => ({
    entities: getEntities(state),
    getLookupName: (id, lookup) => getLookupField(state, lookup, id, 'name'),
    isSelected: (entityId) => isSelected(state, entityId)
})

const mapDispatchToProps = (dispatch) => ({
    selectLine: (entityId) => (e) => dispatch(toggleSelection(entityId)),
    checkAll: (e) => e.target.checked ? dispatch(selectAll()) : dispatch(deselectAll()),
    removeEntity: (entityId) => (e) => dispatch(removeEntity(entityId))
})

export default connect(mapStateToProps, mapDispatchToProps)(ScanResults)
