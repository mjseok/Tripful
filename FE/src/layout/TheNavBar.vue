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

          <b-nav-item href="#">
            <router-link :to="{ name: 'mypage' }" class="link">
              마이페이지
            </router-link>
          </b-nav-item>

          <b-nav-item href="#">
            <!-- v-if="userInfo" -->
            <router-link :to="{ name: 'login' }" class="link">
              로그인/로그아웃
            </router-link>
          </b-nav-item>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
import AppInput from "@/components/common/AppInput";
export default {
  name: "TheNavBar",
  components: {
    AppInput,
  },
};
</script>

<style></style>
