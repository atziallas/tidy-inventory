import {headers} from "../../common/services/api";


const searchBarcode = (barcode) => fetch('./barcodeChanged', {
    method: "POST",
    body: JSON.stringify({
        barcode
    }),
    headers
}).then(response => {
    return response.json();
})

const removeEntity = (entityId) => fetch('./removeBarcode', {
    method: "POST",
    body: JSON.stringify({
        entityId
    }),
    headers
}).then(response => {
    return response.json();
})

const designate = (selections, designatedLocation, designatedSublocation) => fetch('transit/designate', {
    method: "POST",
    body: JSON.stringify({
        selections,
        designatedLocation,
        designatedSublocation
    }),
    headers
}).then(response => {
    return response.json();
})

const transfer = (selections, location, sublocation) => fetch('transit/transfer', {
    method: "POST",
    body: JSON.stringify({
        selections,
        location,
        sublocation
    }),
    headers
}).then(response => {
    return response.json();
})

export const Api = {
    searchBarcode,
    removeEntity,
    transfer,
    designate,
}