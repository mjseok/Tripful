import api from "./http";

function addLikeSpot(params, success, fail) {
  api
    .get(`/social/addLikeSpot/{spotid}`, { params: params })
    .then(success)
    .catch(fail);
}
export { addLikeSpot };
