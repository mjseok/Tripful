import Vue from "vue";
import VueRouter from "vue-router";

import ScheduleView from "@/views/ScheduleView";
import IndexView from "@/views/IndexView";
import LocationDetail from "@/components/spot/LocationDetail";
import store from "@/store";
Vue.use(VueRouter);

const onlyAuthUser = async (to, from, next) => {
  const checkUserInfo = store.getters["userStore/checkUserInfo"];
  const checkToken = store.getters["userStore/checkToken"];
  let token = sessionStorage.getItem("access-token");
  console.log("로그인 처리 전", checkUserInfo, token);

  if (checkUserInfo != null && token) {
    console.log("토큰 유효성 체크하러 가자!!!!");
    await store.dispatch("memberStore/getUserInfo", token);
  }
  if (!checkToken || checkUserInfo === null) {
    alert("로그인이 필요한 페이지입니다..");
    // next({ name: "login" });
    router.push({ name: "login" });
  } else {
    console.log("로그인 했다!!!!!!!!!!!!!.");
    next();
  }
};
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
    redirect : "info",
    children: [
      {
        path: "info",
        name: "info",
        component: () => import("@/components/user/UserInfo"),
      },
      {
        path: "like",
        name: "like",
        component: () => import("@/components/user/UserLikeList"),
      },
    ],
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
        //children으로 하는거 일단 보류
        // children: [
        //   {
        //     path: "write",
        //     name: "boardWrite",
        //   },
        //   {
        //     path: "view/:boardid",
        //     name: "boardView",
        //     component: () => import("@/components/board/BoardView"),
        //   },
        // ],
      },
      {
        path: "/view/:boardid",
        name: "boardView",
        component: () => import("@/components/board/BoardView"),
      },
      {
        path: "/modify",
        name: "boardModify",
        component: () => import("@/components/board/BoardModify"),
      },
      {
        path: "/write",
        name: "boardWrite",
        beforeEnter: onlyAuthUser,
        component: () => import("@/components/board/BoardWrite"),
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
