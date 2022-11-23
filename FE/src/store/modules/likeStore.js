// import { addLikeSpot } from "@/api/like";
const likeStore = {
  namespaced: true,
  state: {
    // pgno: 1,
    // boards: [],
  },
  getters: {
    // checkUserInfo: function (state) {
    //   return state.userInfo;
    // },
    // checkToken: function (state) {
    //   return state.isValidToken;
    // },
  },
  mutations: {
    // CLEAR_BOARDS(state) {
    //   state.boards = [];
    // },
    // SET_BOARD_LIST(state, board) {
    //   state.boards = board;
    // },
  },
    actions: {
    //   addLike:({ commit }, keyword) => {
    //     // 나중에 house.일련번호를 이용하여 API 호출
    //     commit("SET_KEYWORD", keyword);
    //   },
    // getBoardList: ({ commit }, pgno) => {
    //   boardList(
    //     pgno,
    //     ({ data }) => {
    //       commit("SET_BOARD_LIST", data);
    //     },
    //     (error) => {
    //       console.log(error);
    //     }
    //   );
    // },
  },
};

export default likeStore;
