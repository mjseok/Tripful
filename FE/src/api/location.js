import api from "./http";

function sidoList(success, fail) {
  api.get(`/spot/sido`).then(success).catch(fail);
}
export { sidoList };
