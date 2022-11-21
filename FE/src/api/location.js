import api from "./http";

function sidoList(success, fail) {
  api.get(`/spot/sido`).then(success).catch(fail);
}

function gugunList(params, success, fail) {
  api.get(`/spot/gugun`, { params: params }).then(success).catch(fail);
}

function locationList(params,success, fail) {
  api.get(`/spot/list`, { params: params }).then(success).catch(fail);
}
export { sidoList,gugunList,locationList };
