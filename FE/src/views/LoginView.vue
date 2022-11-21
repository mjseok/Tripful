<template>
  <div>
    <div class="container pt-lg-md mt-5">
      <div class="row justify-content-center">
        <div class="col-lg-5">
          <app-card
            shadow
            type="light"
            header-classes="bg-white pb-5"
            body-classes="px-lg-5 py-lg-5"
            class="border-0"
          >
            <template>
              <div class="text-muted text-center mb-2">
                <large>Sign in with</large>
              </div>
              <div class="btn-wrapper text-center mb-4">
                <app-button type="neutral">
                  <b-icon-github />
                  Github
                </app-button>
              </div>
            </template>
            <template>
              <div class="text-center text-muted mb-4">Or sign in with credentials</div>
              <form role="form">
                <app-input
                  alternative
                  class="mb-3"
                  placeholder="Id"
                  addonLeftIcon="person-badge-fill"
                  v-model="user.id"
                >
                </app-input>
                <app-input
                  alternative
                  type="password"
                  placeholder="Password"
                  addonLeftIcon="key-fill"
                  v-model="user.pwd"
                >
                </app-input>

                <div class="text-center">
                  <app-button type="theme" class="my-4" @click="confirm">Sign In</app-button>
                  <app-button type="theme" class="my-4" @click="movePage">Sign Up</app-button>
                </div>
              </form>
            </template>
            <div class="row mt-3">
              <div class="col-6">
                <app-button type="theme">아이디 찾기</app-button>
              </div>
              <div class="col-6">
                <app-button type="theme">비밀번호 찾기</app-button>
              </div>
            </div>
          </app-card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";

const userStore = "userStore";
import AppInput from "@/components/user/AppInput";
import AppButton from "@/components/user/AppButton";
import AppCard from "@/components/common/AppCard";

export default {
  name: "LoginView",
  components: { AppInput, AppButton, AppCard },
  data() {
    return {
      user: {
        id: null,
        pwd: null,
      },
    };
  },
  computed: {
    ...mapState(userStore, ["isLogin", "isLoginError", "userInfo"]),
  },
  methods: {
    ...mapActions(userStore, ["userConfirm", "getUserInfo"]),
    onSubmit() {
      // this will be called only after form is valid. You can do api call here to login
    },
    async confirm() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      // console.log("1. confirm() token >> " + token);
      if (this.isLogin) {
        await this.getUserInfo(token);
        console.log("4. confirm() userInfo :: ", this.userInfo);
        this.$router.push({ name: "index" });
      }
    },
    movePage() {
      this.$router.push({ name: "signup" });
    },
    gitHubLogin() {},
  },
};
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
