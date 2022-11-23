import Vue from "vue";
import VueRouter from "vue-router";

import ScheduleView from "@/views/ScheduleView";
import IndexView from "@/views/IndexView";
import LocationDetail from "@/components/spot/LocationDetail";

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
    path: "/signup",
    name: "signup",
    component: () => import("@/views/SignUpView"),
  },
  {
    path: "/mypage",
    name: "mypage",
    component: () => import("@/views/MyPageView"),
  },
  {
    path: "/detail",
    name: "detail",
    component: LocationDetail,
  },
  {
    path: "/board",
    name: "board",
    component: () => import("@/views/BoardView"),
    children: [
      {
        path: "notice",
        name: "notice",
        component: () => import("@/views/NoticeView"),
      },
      {
        path: "community",
        name: "community",
        component: () => import("@/views/CommunityView"),
        children: [
          {
            path: "write",
            name: "boardWrite",
          },
        ],
      },
    ],
  },
  {
    path: "/user",
    name: "user",
    component: () => import("@/views/UserView"),
    children: [
      {
        path: "idfind",
        name: "idfind",
        component: () => import("@/components/user/UserIdFind"),
      },
      {
        path: "pwdfind",
        name: "pwdfind",
        component: () => import("@/components/user/UserPwdFind"),
      },
    ],
  },
  // {
  //   path: '/',
  //   name: 'home',
  //   component: HomeView
  // },
  // {
  //   path: '/about',
  //   name: 'about',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  // }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
