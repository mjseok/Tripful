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
              <div class="text-center text-muted mb-4">Sign Up</div>
              <form role="form">
                <app-input
                  ref="userid"
                  alternative
                  class="mb-3"
                  placeholder="Id"
                  addonLeftIcon="person-badge-fill"
                  v-model="user.id"
                  @input="idcheck"
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
                <app-input
                  ref="username"
                  alternative
                  class="mb-3"
                  placeholder="Name"
                  addonLeftIcon="person-fill"
                  v-model="user.name"
                >
                </app-input>
                <app-input
                  ref="useremail"
                  alternative
                  class="mb-3"
                  placeholder="Email"
                  addonLeftIcon="envelope"
                  v-model="user.email"
                >
                </app-input>
                <div class="text-center">
                  <app-button type="primary" class="my-4" @click="signUp"
                    >Sign Up</app-button
                  >
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

import AppInput from "@/components/user/AppInput";
import AppButton from "@/components/user/AppButton";
import AppCard from "@/components/common/AppCard";
const userStore = "userStore";
export default {
  name: "SignUpView",
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
    async signUp() {
      let err = true;
      let msg = "";

      // ??? ?????? ??????
      !this.user.id && ((msg = "???????????? ??????????????????"), (err = false));
      err && !this.user.pwd && ((msg = "????????? ??????????????????"), (err = false));
      err && !this.user.name && ((msg = "????????? ??????????????????"), (err = false));
      err && !this.user.email && ((msg = "????????? ??????????????????"), (err = false));

      if (!err) {
        alert(msg);
        return;
      }
      // ????????? ?????? ??????
      if (this.isExist) {
        alert(this.errMessage);
        return;
      }

      await this.userSignUp(this.user);
    },
    idcheck() {
      console.log("????????? ?????????");
      console.log(this.user.id.length);
      //?????? ??????
      if (this.user.id.length < 6 || this.user.id.length > 16) {
        this.userIdWrongLength(true);
        this.errMessage = "???????????? 6??? ?????? 16??? ?????? ?????????.";
        return;
      } else {
        this.userIdWrongLength(false);
      }

      // ????????? ?????? ??????
      this.userIdcheck(this.user);
      this.errMessage = "?????? ???????????? ????????? ?????????.";
    },
  },
};
// library.add();
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
