import { signUp } from "@/api/user";

const userStore = {
  namespaced: true,
  state: {
    userInfo: null,
  },
  mutations: {
    SET_USER_INFO: (state, userInfo) => {
      state.userInfo = userInfo;
    },
  },
  actions: {
    async userSignUp({ commit }, user) {
      await signUp(
        user,
        ({ data }) => {
          if (data.message === "success") {
            alert("회원가입 성공");
            commit("SET_USER_INFO", data.userInfo);
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },
  },
};

export default userStore;
