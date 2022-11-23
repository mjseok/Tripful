<template>
  <div>
    <div class="container pt-lg-md mt-5">
      <div class="row justify-content-center">
        <div class="col-lg-5">
          <router-view></router-view>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserView",
};
// library.add();
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
