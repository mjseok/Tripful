import Vue from 'vue'
import Vuex from 'vuex'
import locationStore from "@/store/modules/locationStore";
import mapStore from "@/store/modules/mapStore";

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    locationStore,
    mapStore
  }
})
