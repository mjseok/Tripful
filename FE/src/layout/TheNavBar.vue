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
        <b-nav-item href="#"
          ><router-link :to="{ name: 'home' }" class="link"
            ><b-icon icon="house" font-scale="1.5"></b-icon> 홈</router-link
          ></b-nav-item
        >
        <b-nav-item href="#"
          ><router-link :to="{ name: 'board' }" class="link"
            ><b-icon icon="calendar-range" font-scale="1.5"></b-icon>
            일정</router-link
          ></b-nav-item
        >
        <b-nav-item href="#"
          ><router-link :to="{ name: 'instagram' }" class="link"
            ><b-icon icon="pin-map-fill" font-scale="1.5"></b-icon>
            관광지</router-link
          ></b-nav-item
        >
        <b-nav-item href="#"
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
          >
          <b-dropdown-item href="#"
            ><router-link :to="{ name: 'signIn' }" class="link"
              ><b-icon icon="key"></b-icon> 로그인</router-link
            ></b-dropdown-item
          >
        </b-nav-item-dropdown>
      </b-navbar-nav>
    </b-navbar>
  </div>
</template>

<script>
export default {
  name: "TheNavBar",
};
</script>

<style></style>
