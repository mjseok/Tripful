import { boardList } from "@/api/board";
const boardStore = {
  namespaced: true,
  state: {
    pgno: 1,
    boards: [],
  },
  getters: {},
  mutations: {
    CLEAR_BOARDS(state) {
      state.boards = [];
    },
    SET_BOARD_LIST(state, board) {
      state.boards = board;
    },
  },
  actions: {
    getBoardList: ({ commit }, pgno) => {
      boardList(
        pgno,
        ({ data }) => {
          commit("SET_BOARD_LIST", data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
  },
};

export default boardStore;
