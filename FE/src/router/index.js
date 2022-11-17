import Vue from "vue";
import VueRouter from "vue-router";

import ScheduleView from "@/views/ScheduleView";
import IndexView from "@/views/IndexView";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "index",
    component: IndexView,
  },
  {
    path: "/schedule",
    name: "schedule",
    component: ScheduleView,
  },
  {
    path: "/spot",
    name: "spot",
    component: () => import("@/views/LocationView"),
  },
  {
    path: "/map",
    name: "map",
    component: () => import("@/views/MapView"),
  },
  {
    path: "/login",
    name: "login",
    component: () => import("@/views/LoginView"),
  },
  {
    path: "/mypage",
    name: "mypage",
    component: () => import("@/views/MyPageView"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
