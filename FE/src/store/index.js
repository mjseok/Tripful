import Vue from "vue";
import Vuex from "vuex";
import locationStore from "@/store/modules/locationStore";
import mapStore from "@/store/modules/mapStore";
import scheduleStore from "@/store/modules/scheduleStore";
import userStore from "@/store/modules/userStore";
// import {createVuexPersistedState} from "vuex-persistedstate";
Vue.use(Vuex);

export default new Vuex.Store({
  // plugins:[createVuexPersistedState()],
  state: {},
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    locationStore,
    mapStore,
    userStore,
    scheduleStore
  },
});
