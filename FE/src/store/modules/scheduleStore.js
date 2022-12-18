// import { addLikeSpot } from "@/api/like";
// import {beforeSchedule} from "@/api/schedule"
const scheduleStore = {
    namespaced: true,
    state: {
        // beforeSchedule: {},
        afterSchedule:{},
    },
    getters: {
        // before: function (state) {
        //     return state.beforeSchedule;
        //   },
        after: function(state){
          return state.afterSchedule;
        }
    },
    mutations: {
        // SET_BEFORE_SCHEDULE(state, beforeSchedule) {
        //     state.beforeSchedule = beforeSchedule;
        //   },
          SET_AFTER_SCHEDULE(state, afterSchedule) {
            state.afterSchedule = afterSchedule;
      },
    },
    actions: {
      // setBeforeSchedule: ({ commit }, before) => {
      //     commit("SET_BEFORE_SCHEDULE",before);
      //     await beforeSchedule()
      //   },
        setAfterSchedule: ({ commit }, after) => {
          commit("SET_AFTER_SCHEDULE",after);
        },
    },
  };
  
  export default scheduleStore;
  