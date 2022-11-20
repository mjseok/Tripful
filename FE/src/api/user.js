import api from "./http";

async function signUp(user, success, fail) {
  console.log(JSON.stringify(user));
  await api.post(`/user`, JSON.stringify(user)).then(success).catch(fail);
}
// async function githubLogin() {
//   await api.get("/login/github");
// }
export { signUp };
