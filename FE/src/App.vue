<template>
  <div id="app">
    <the-nav-bar></the-nav-bar>
    <router-view />
  </div>
</template>

<script>
import TheNavBar from "@/layout/TheNavBar";

export default {
  components: {
    TheNavBar,
  },
};
</script>

<style>
@font-face {
  font-family: "BMHANNAAir_ttf";
  src: url("@/assets/fonts/BMHANNAAir_ttf.ttf") format("truetype");
}

#app {
  font-family: "BMHANNAAir_ttf";
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #294c60;
}
</style>
