const mapStore = {
  namespaced: true,
  state: {
    keyword:"",
  },
  getters: {},
  mutations: {
    CLEAR_KEYWORD(state) {
      state.keyword = "";
    },
    SET_KEYWORD(state, k) {
        state.keyword = k;
    },
  },
  actions: {
    searchKeyword: ({ commit }, keyword) => {
      // 나중에 house.일련번호를 이용하여 API 호출
      commit("SET_KEYWORD", keyword);
    },
  },
};

export default mapStore;
