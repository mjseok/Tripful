import {
  signUp,
  login,
  tokenRegeneration,
  logout,
  findById,
  resign,
  update,
  idcheck,
} from "@/api/user";

import jwtDecode from "jwt-decode";
import router from "@/router";

const userStore = {
  namespaced: true,
  state: {
    isLogin: false,
    isLoginError: false,
    userInfo: null,
    isValidToken: false,
    isAdmin: false,
    isExist: false,
    likes: {},
  },
  getters: {
    selectLikesInfo: function (state) {
      return state.likes;
    },
    checkUserInfo: function (state) {
      return state.userInfo;
    },
    checkToken: function (state) {
      return state.isValidToken;
    },
  },
  mutations: {
    SET_IS_LOGIN: (state, isLogin) => {
      state.isLogin = isLogin;
    },
    SET_IS_LOGIN_ERROR: (state, isLoginError) => {
      state.isLoginError = isLoginError;
    },
    SET_IS_VALID_TOKEN: (state, isValidToken) => {
      state.isValidToken = isValidToken;
    },
    SET_USER_INFO: (state, userInfo) => {
      state.isLogin = true;
      state.userInfo = userInfo;
    },
    SET_IS_ADMIN: (state, isAdmin) => {
      state.isAdmin = isAdmin;
    },
    SET_IS_EXIST: (state, isExist) => {
      state.isExist = isExist;
    },
    SET_IS_LIKES: (state, likes) => {
      state.likes = likes;
    },
    SET_LIKES_LIST(state, { likes, spotid }) {
      likes.forEach((like, index) => {
        console.log(like);
        if (like.spotid == spotid) {
          state.likes.splice(index, 1);
        }
      });
    },
  },
  actions: {
    async userConfirm({ commit }, user) {
      await login(
        user,
        ({ data }) => {
          if (data.message === "success") {
            let accessToken = data["access-token"];
            let refreshToken = data["refresh-token"];
            // console.log("login success token created!!!! >> ", accessToken, refreshToken);
            commit("SET_IS_LOGIN", true);
            commit("SET_IS_LOGIN_ERROR", false);
            commit("SET_IS_VALID_TOKEN", true);
            sessionStorage.setItem("access-token", accessToken);
            sessionStorage.setItem("refresh-token", refreshToken);
          } else {
            commit("SET_IS_LOGIN", false);
            commit("SET_IS_LOGIN_ERROR", true);
            commit("SET_IS_VALID_TOKEN", false);
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },

    async tokenRegeneration({ commit, state }) {
      console.log(
        "토큰 재발급 >> 기존 토큰 정보 : {}",
        sessionStorage.getItem("access-token")
      );
      await tokenRegeneration(
        JSON.stringify(state.userInfo),
        ({ data }) => {
          if (data.message === "success") {
            let accessToken = data["access-token"];
            console.log("재발급 완료 >> 새로운 토큰 : {}", accessToken);
            sessionStorage.setItem("access-token", accessToken);
            commit("SET_IS_VALID_TOKEN", true);
          }
        },
        async (error) => {
          // HttpStatus.UNAUTHORIZE(401) : RefreshToken 기간 만료 >> 다시 로그인!!!!
          if (error.response.status === 401) {
            console.log("갱신 실패");
            // 다시 로그인 전 DB에 저장된 RefreshToken 제거.
            await logout(
              state.userInfo.userid,
              ({ data }) => {
                if (data.message === "success") {
                  console.log("리프레시 토큰 제거 성공");
                } else {
                  console.log("리프레시 토큰 제거 실패");
                }
                alert("RefreshToken 기간 만료!!! 다시 로그인해 주세요.");
                commit("SET_IS_LOGIN", false);
                commit("SET_USER_INFO", null);
                commit("SET_IS_VALID_TOKEN", false);
                router.push({ name: "login" });
              },
              (error) => {
                console.log(error);
                commit("SET_IS_LOGIN", false);
                commit("SET_USER_INFO", null);
              }
            );
          }
        }
      );
    },
    async getUserInfo({ commit, dispatch }, token) {
      let decodeToken = jwtDecode(token);
      // console.log("2. getUserInfo() decodeToken :: ", decodeToken);
      await findById(
        decodeToken.id,
        ({ data }) => {
          console.log("Data : " + data);
          if (data.message === "success") {
            commit("SET_USER_INFO", data.userInfo);
            // console.log("3. getUserInfo data >> ", data);
          } else {
            console.log("유저 정보 없음!!!!");
          }
          if (data.userInfo.isadmin == 1) {
            console.log("관리자 입니다~~~~");
            commit("SET_IS_ADMIN", true);
          } else {
            commit("SET_IS_ADMIN", false);
          }
        },
        async (error) => {
          console.log(
            "getUserInfo() error code [토큰 만료되어 사용 불가능.] ::: ",
            error.response.status
          );
          commit("SET_IS_VALID_TOKEN", false);
          await dispatch("tokenRegeneration");
        }
      );
    },
    async userLogout({ commit }, id) {
      await logout(
        id,
        ({ data }) => {
          if (data.message === "success") {
            commit("SET_IS_LOGIN", false);
            commit("SET_USER_INFO", null);
            commit("SET_IS_VALID_TOKEN", false);
          } else {
            console.log("유저 정보 없음!!!!");
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },
    async userSignUp({ commit }, user) {
      await signUp(
        user,
        ({ data }) => {
          if (data.message === "success") {
            alert("회원가입 성공");
            commit("SET_USER_INFO", data.userInfo);
          }
          router.push({ name: "login" });
        },
        (error) => {
          console.log(error);
        }
      );
    },
    async userResign({ commit }, user) {
      await resign(
        user,
        ({ data }) => {
          if (data.message === "success") {
            alert("회원탈퇴 성공");
            commit("SET_USER_INFO", null);
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },
    async userUpdate({ commit }, user) {
      await update(
        user,
        ({ data }) => {
          if (data.message === "success") {
            alert("회원 정보 업데이트 성공");
            commit("SET_USER_INFO", data.userInfo);
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },
    async userIdcheck({ commit }, user) {
      await idcheck(
        user,
        ({ data }) => {
          if (data > 0) {
            commit("SET_IS_EXIST", true);
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },
    userIdWrongLength: ({ commit }, flag) => {
      commit("SET_IS_EXIST", flag);
    },
    userLikesInit: ({ commit }, likes) => {
      commit("SET_IS_LIKES", likes);
    },
    userSetLikes: ({ commit }, { likes, spotid }) => {
      console.log("액션스 : likes : " + likes + " spotid : " + spotid);
      commit("SET_LIKES_LIST", { likes, spotid });
    },
  },
};

export default userStore;
