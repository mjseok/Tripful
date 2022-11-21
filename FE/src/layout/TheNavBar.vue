<template>
  <div>
    <b-navbar
      toggleable="lg"
      type="transparent"
      variant="transparent"
      class="nav justify-content-center"
    >
      <b-navbar-brand href="#">
        <router-link to="/"> </router-link>
      </b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-navbar-nav>
        <b-nav-item href="#">
          <router-link :to="{ name: 'index' }" class="link">
            <b-icon icon="house" font-scale="1.5"></b-icon> 홈
          </router-link>
        </b-nav-item>
        <b-nav-item href="#"
          ><router-link :to="{ name: 'schedule' }" class="link"
            ><b-icon icon="house" font-scale="1.5"></b-icon> 스케줄</router-link
          ></b-nav-item
        >
        <b-nav-item-dropdown right>
          <template #button-content>
            <b-icon icon="people" font-scale="2"></b-icon>
          </template>
          <b-nav-item href="#"
            ><router-link :to="{ name: 'spot' }" class="link"
              ><b-icon icon="calendar-range" font-scale="1.5"></b-icon> 지역별
              조회</router-link
            ></b-nav-item
          >
          <b-nav-item href="#"
            ><router-link :to="{ name: 'map' }" class="link"
              ><b-icon icon="pin-map-fill" font-scale="1.5"></b-icon> 지도로
              조회</router-link
            ></b-nav-item
          >
        </b-nav-item-dropdown>

        <!-- <b-nav-item href="#"
          ><router-link :to="{ name: 'house' }" class="link"
            ><b-icon icon="house-fill" font-scale="1.5"></b-icon>
            게시판</router-link
          ></b-nav-item
        >
        <b-nav-item-dropdown right>
          <template #button-content>
            <b-icon icon="people" font-scale="2"></b-icon>
          </template>
          <b-dropdown-item href="#"
            ><router-link :to="{ name: 'signUp' }" class="link"
              ><b-icon icon="person-circle"></b-icon> 회원가입</router-link
            ></b-dropdown-item
          > -->
        <!-- after login -->
        <b-navbar-nav class="ml-auto" v-if="userInfo">
          <b-nav-item class="align-self-center">
            <!-- <b-avatar
              variant="primary"
              v-text="userInfo.id.charAt(0).toUpperCase()"
            ></b-avatar> -->
            {{ userInfo.name }}({{ userInfo.id }})님 환영합니다.
          </b-nav-item>
          <b-nav-item class="align-self-center">
            <router-link :to="{ name: 'mypage' }" class="link align-self-center"
              >내정보보기</router-link
            >
          </b-nav-item>
          <b-nav-item
            class="align-self-center link"
            @click.prevent="onClickLogout"
            >로그아웃</b-nav-item
          >
        </b-navbar-nav>
        <!-- before login -->
        <b-navbar-nav class="ml-auto" v-else>
          <b-dropdown-item href="#"
            ><router-link :to="{ name: 'login' }" class="link"
              ><b-icon icon="key"></b-icon> 로그인</router-link
            ></b-dropdown-item
          >
        </b-navbar-nav>
        <!-- </b-nav-item-dropdown> -->
      </b-navbar-nav>
    </b-navbar>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";

const userStore = "userStore";
export default {
  name: "TheNavBar",
  data() {
    return {};
  },
  computed: {
    ...mapState(userStore, ["isLogin", "userInfo"]),
    ...mapGetters(["checkUserInfo"]),
  },
  methods: {
    ...mapActions(userStore, ["userLogout"]),
    // ...mapMutations(memberStore, ["SET_IS_LOGIN", "SET_USER_INFO"]),
    onClickLogout() {
      // this.SET_IS_LOGIN(false);
      // this.SET_USER_INFO(null);
      // sessionStorage.removeItem("access-token");
      // if (this.$route.path != "/") this.$router.push({ name: "main" });
      console.log(this.userInfo.id);
      //vuex actions에서 userLogout 실행(Backend에 저장 된 리프레시 토큰 없애기
      //+ satate에 isLogin, userInfo 정보 변경)
      // this.$store.dispatch("userLogout", this.userInfo.userid);
      this.userLogout(this.userInfo.id);
      sessionStorage.removeItem("access-token"); //저장된 토큰 없애기
      sessionStorage.removeItem("refresh-token"); //저장된 토큰 없애기
      if (this.$route.path != "/") this.$router.push({ name: "index" });
    },
  },
};
</script>

<style></style>
