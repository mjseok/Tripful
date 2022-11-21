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
                <large>회원 정보 수정</large>
              </div>
            </template>
            <template>
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
                  class="mb-3"
                  placeholder="name"
                  addonLeftIcon="person-badge-fill"
                  v-model="user.name"
                >
                </app-input>
                <app-input
                  alternative
                  placeholder="email"
                  addonLeftIcon="key-fill"
                  v-model="user.email"
                >
                </app-input>
                <app-input
                  alternative
                  placeholder="Password"
                  addonLeftIcon="key-fill"
                  v-model="user.pwd"
                >
                </app-input>
                <app-input
                  alternative
                  placeholder="Password"
                  addonLeftIcon="key-fill"
                  v-model="user.pwdCheck"
                >
                </app-input>

                <div class="text-center">
                  <app-button type="theme" class="my-4" @click="modify">회원정보 수정</app-button>
                  <app-button type="theme" class="my-4" @click="resign">회원 탈퇴</app-button>
                </div>
              </form>
            </template>
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
  name: "MyPageView",
  components: { AppInput, AppButton, AppCard },
  data() {
    return {
      user: {
        id: 3,
        pwd: null,
        pwdCheck: null,
        name: null,
        email: null,
      },
    };
  },
  mounted: {},
  computed: {
    ...mapState(userStore, ["isLogin", "isLoginError", "userInfo"]),
  },
  methods: {
    ...mapActions(userStore, ["userConfirm", "getUserInfo", "userResign"]),
    onSubmit() {
      // this will be called only after form is valid. You can do api call here to login
    },
    async modify() {
      await this.userConfirm(this.user);
      let token = sessionStorage.getItem("access-token");
      // console.log("1. confirm() token >> " + token);
      if (this.isLogin) {
        await this.getUserInfo(token);
        console.log("4. confirm() userInfo :: ", this.userInfo);
        this.$router.push({ name: "index" });
      }
    },
    async resign() {
      await this.userResign(this.user);
      // this.$router.push({ name: "index" });
    },
  },
};
// library.add();
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
