import { getFiltersAndSorting, getSelectedAction } from "../reducers/reducer";
import { getSelections } from "../../common/reducers/selections";
import { headers } from "../../common/services/api";

const doAction = (state) =>
  fetch("./action", {
    method: "POST",
    body: JSON.stringify({
      ...getFiltersAndSorting(state),
      selections: getSelections(state),
      selectedAction: getSelectedAction(state),
    }),
    headers,
  }).then((response) => {
    return response;
  });

const fetchLookup = (payload, lookup) =>
  fetch("./" + lookup, {
    method: "POST",
    body: JSON.stringify(payload),
    headers,
  }).then((response) => {
    return response.json();
  });

const filter = (filtersAndSorting) =>
  fetch("./filter", {
    method: "POST",
    body: JSON.stringify(filtersAndSorting),
    headers,
  }).then((response) => {
    return response.json();
  });

const designate = (
  selections,
  designatedLocation,
  designatedSublocation,
  filtersAndSorting
) =>
  fetch("designate", {
    method: "POST",
    body: JSON.stringify({
      selections,
      designatedLocation,
      designatedSublocation,
      ...filtersAndSorting,
    }),
    headers,
  }).then((response) => {
    if (response.redirected) {
      return { error: "true" };
    }
    return response.json();
  });

const transfer = (selections, location, sublocation, filtersAndSorting) =>
  fetch("transfer", {
    method: "POST",
    body: JSON.stringify({
      selections,
      location,
      sublocation,
      ...filtersAndSorting,
    }),
    headers,
  }).then((response) => {
    if (response.redirected) {
      return { error: "true" };
    }
    return response.json();
  });

export const Api = {
  filter,
  fetchLookup,
  doAction,
  transfer,
  designate,
};
