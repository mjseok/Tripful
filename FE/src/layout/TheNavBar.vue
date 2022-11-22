<template>
  <div>
    <b-navbar
      toggleable="lg"
      type="transparent"
      variant="transparent"
      class="nav justify-content-center"
    >
      <b-navbar-brand href="#">
        <router-link to="/">Tripful</router-link>
      </b-navbar-brand>
      <b-nav-item href="#">
        <app-input></app-input>
      </b-nav-item>
      <b-nav-item href="#">
        <router-link :to="{ name: 'map' }" class="link">
          <button>검색!</button>
        </router-link>
      </b-nav-item>
      <b-navbar-toggle target="nav-collapse">햄버거</b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="ml-auto">
          <b-nav-item href="#">
            <router-link :to="{ name: 'index' }" class="link">홈</router-link>
          </b-nav-item>

          <b-nav-item-dropdown right>
            <template #button-content> 관광지 조회 </template>
            <b-nav-item href="#">
              <router-link :to="{ name: 'spot' }" class="link"
                >지역별조회</router-link
              >
            </b-nav-item>
            <b-nav-item href="#"
              ><router-link :to="{ name: 'map' }" class="link">
                지도로 조회</router-link
              ></b-nav-item
            >
          </b-nav-item-dropdown>

          <b-nav-item href="#"
            ><router-link :to="{ name: 'schedule' }" class="link"
              >스케줄</router-link
            ></b-nav-item
          >

          <b-nav-item-dropdown right>
            <template #button-content> 커뮤니티 </template>
            <b-nav-item href="#"
              ><router-link :to="{ name: 'test1' }" class="link"
                >test1
              </router-link></b-nav-item
            >
            <b-nav-item href="#"
              ><router-link :to="{ name: 'test2' }" class="link"
                >test2 조회</router-link
              ></b-nav-item
            >
          </b-nav-item-dropdown>

          <!-- after login -->
          <b-navbar-nav class="ml-auto" v-if="userInfo">
            <b-nav-item class="align-self-center">
              {{ userInfo.name }}({{ userInfo.id }})님 환영합니다.
            </b-nav-item>
            <b-nav-item class="align-self-center">
              <router-link
                :to="{ name: 'mypage' }"
                class="link align-self-center"
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
            <b-nav-item href="#">
              <router-link :to="{ name: 'login' }" class="link">
                로그인</router-link
              >
            </b-nav-item>
          </b-navbar-nav>
          <!-- </b-nav-item-dropdown> -->
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";

const userStore = "userStore";
import AppInput from "@/components/common/AppInput";
export default {
  name: "TheNavBar",
  components: {
    AppInput,
  },
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
