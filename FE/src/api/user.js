import api from "./http";

async function signUp(user, success, fail) {
  console.log(JSON.stringify(user));
  await api.post(`/user`, JSON.stringify(user)).then(success).catch(fail);
}
async function login(user, success, fail) {
  await api.post(`/user/login`, JSON.stringify(user)).then(success).catch(fail);
}
async function tokenRegeneration(user, success, fail) {
  api.defaults.headers["refresh-token"] =
    sessionStorage.getItem("refresh-token"); //axios header에 refresh-token 셋팅
  await api.post(`/user/refresh`, user).then(success).catch(fail);
}
async function logout(id, success, fail) {
  await api.get(`/user/logout/${id}`).then(success).catch(fail);
}

async function findById(id, success, fail) {
  api.defaults.headers["access-token"] = sessionStorage.getItem("access-token");
  await api.get(`/user/info/${id}`).then(success).catch(fail);
}

// async function githubLogin() {
//   await api.get("/login/github");
// }
export { signUp, login, tokenRegeneration, logout, findById };
