<template>
  <app-card
    shadow
    type="light"
    header-classes="bg-white pb-5"
    body-classes="px-lg-5 py-lg-5"
    class="border-0"
  >
    <template>
      <div class="text-center text-muted mb-4">아이디 찾기</div>
      <form role="form">
        <app-input
          ref="userid"
          alternative
          class="mb-3"
          placeholder="Id"
          addonLeftIcon="person-badge-fill"
          v-model="user.id"
          @change="idcheck"
          v-bind:notSame="isExist"
          v-bind:error="errMessage"
        >
        </app-input>
        <app-input
          ref="userpwd"
          alternative
          type="password"
          placeholder="Password"
          addonLeftIcon="key-fill"
          v-model="user.pwd"
        >
        </app-input>
        <div class="text-center">
          <app-button type="primary" class="my-4" @click="find"
            >아이디 찾기</app-button
          >
        </div>
      </form>
    </template>
  </app-card>
</template>

<script>
import { mapState, mapActions } from "vuex";

import AppInput from "@/components/user/AppInput";
import AppButton from "@/components/user/AppButton";
import AppCard from "@/components/common/AppCard";
const userStore = "userStore";
export default {
  name: "UserFindResult",
  components: { AppInput, AppButton, AppCard },
  data() {
    return {
      user: {
        name: null,
        id: null,
        pwd: null,
        email: null,
      },
      errMessage: "",
    };
  },
  computed: {
    ...mapState(userStore, ["isExist"]),
  },
  methods: {
    ...mapActions(userStore, [
      "userSignUp",
      "userIdcheck",
      "userIdWrongLength",
    ]),
    find() {
      this.$router.push({ name: "findresult" });
    },
  },
};
// library.add();
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
