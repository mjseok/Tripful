<template>
  <app-card
    shadow
    type="light"
    header-classes="bg-white pb-5"
    body-classes="px-lg-5 py-lg-5"
    class="border-0"
  >
    <template>
      <div class="text-muted text-center mb-2">비밀번호 찾기</div>
    </template>
    <template>
      <form role="form">
        <app-input
          alternative
          text="아이디"
          class="mb-3"
          placeholder="id"
          v-model="user.id"
        >
        </app-input>

        <app-input
          alternative
          text="이메일"
          class="mb-3"
          placeholder="email"
          v-model="user.email"
        >
        </app-input>

        <div class="text-center" v-if="user.pwd">
          임시 비밀번호는 {{ user.pwd }} 입니다.
        </div>

        <div class="text-center">
          <app-button type="theme" class="my-4" @click="find"
            >비밀번호 찾기</app-button
          >
          <app-button type="theme" class="my-4" @click="login"
            >로그인</app-button
          >
        </div>
      </form>
    </template>
  </app-card>
</template>

<script>
import { pwdfind } from "@/api/user";

import AppInput from "@/components/user/AppInput";
import AppButton from "@/components/user/AppButton";
import AppCard from "@/components/common/AppCard";
export default {
  name: "UserPwdFind",
  components: { AppInput, AppButton, AppCard },
  data() {
    return {
      user: {
        id: null,
        name: null,
        pwd: null,
      },
    };
  },
  computed: {},
  methods: {
    async find() {
      await pwdfind(
        this.user,
        ({ data }) => {
          console.log(data);
          this.user.pwd = data;
          // this.user.id = data.id;
          // if (data.message === "success") {
          //   alert("아이디 찾기 성공");
          //   console.log(data);
          // }
        },
        (error) => {
          console.log(error);
        }
      );

      // this.$router.push({ name: "findresult" });
    },
    login() {
      this.$router.push({ name: "login" });
    },
  },
};
// library.add();
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
