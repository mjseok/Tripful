import { sidoList, gugunList, locationList } from "@/api/location.js";

const locationStore = {
  namespaced: true,
  state: {
    sidos: [{ value: null, text: "선택하세요" }],
    guguns: [{ value: null, text: "선택하세요" }],
    locations: [],
    location: null,
  },
  getters: {},
  mutations: {
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_LOCATION_LIST(state) {
      state.locations = [];
      state.location = null;
    },
    SET_SIDO_LIST(state, sidos) {
      sidos.forEach((sido) => {
        // console.log(sido);
        state.sidos.push({ value: sido.sidoid, text: sido.name });
      });
    },
    SET_GUGUN_LIST(state, guguns) {
      guguns.forEach((gugun) => {
        state.guguns.push({ value: gugun.gugunid, text: gugun.name });
      });
    },
    SET_LOCATION_LIST(state, locations) {
      state.locations = locations;
    },
    SET_DETAIL_LOCATION(state, location) {
      console.log("location : "+location);
      state.location = location;
    },
  },
  actions: {
    getSido: ({ commit }) => {
      sidoList(
        ({ data }) => {
          commit("SET_SIDO_LIST", data);
          // console.log("getSido : " + data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    getGugun: ({ commit }, sidoCode) => {
      const params = { sidoid: sidoCode };
      console.log("gugun param : " + params);
      gugunList(
        params,
        ({ data }) => {
          console.log("Gugun : " + data);
          commit("SET_GUGUN_LIST", data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    getLocationList: ({ commit }, { sidoCode, gugunCode,themeCode }) => {
      console.log("list sidoCode : " + sidoCode + " gugunCode : " + gugunCode);
      const params = {
        sidoid: sidoCode,
        gugunid: gugunCode,
        theme:themeCode,
        pageno: 1,
      };
      locationList(
        params,
        ({ data }) => {
          console.log("list 는 : " + data);
          commit("SET_LOCATION_LIST", data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    detailLocation: ({ commit }, location) => {
      // 나중에 house.일련번호를 이용하여 API 호출
      commit("SET_DETAIL_LOCATION", location);

    },
  },
};

export default locationStore;
