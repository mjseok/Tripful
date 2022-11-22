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
              <div class="text-muted text-center mb-2">회원 정보 수정</div>
            </template>
            <template>
              <form role="form">
                <app-input
                  alternative
                  text="아이디"
                  class="mb-3"
                  placeholder="Id"
                  v-model="user.id"
                  v-bind:isReadOnly="true"
                >
                </app-input>
                <app-input
                  alternative
                  class="mb-3"
                  text="이름"
                  placeholder="name"
                  v-model="user.name"
                  v-bind:isReadOnly="flag"
                >
                </app-input>
                <app-input
                  alternative
                  text="이메일"
                  placeholder="email"
                  v-model="user.email"
                  v-bind:isReadOnly="flag"
                >
                </app-input>
                <app-input
                  alternative
                  text="비밀번호"
                  placeholder="Password"
                  v-bind:value="pwd"
                  v-on:input="updatePwd"
                  v-bind:isReadOnly="flag"
                  @change="change"
                >
                </app-input>
                <app-input
                  v-if="!flag"
                  alternative
                  text="비밀번호 확인"
                  placeholder="Password"
                  v-model="pwdCheck"
                  v-bind:isReadOnly="flag"
                  v-bind:notSame="password"
                  error="비밀번호가 일치하지 않습니다."
                  @change="change"
                >
                </app-input>
                <div class="text-center">
                  <app-button
                    v-if="flag"
                    type="theme"
                    class="my-4"
                    @click="modify"
                    >회원정보 수정</app-button
                  >
                  <app-button type="theme" class="my-4" v-else @click="save"
                    >회원정보 저장</app-button
                  >
                  <app-button type="theme" class="my-4" @click="resign"
                    >회원 탈퇴</app-button
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
        name: null,
        id: null,
        // pwd: null,
        email: null,
      },
      pwd: "",
      pwdCheck: "",
      flag: true,
      password: true,
    };
  },
  computed: {
    ...mapState(userStore, ["userInfo"]),
  },
  watch: {
    pwd: {
      handler() {
        if (this.pwdCheck == this.pwd) {
          this.password = false;
        } else {
          this.password = true;
        }
        // console.log(this.pwdCheck);
      },
    },
    pwdCheck: {
      handler() {
        if (this.pwdCheck == this.pwd) {
          this.password = false;
        } else {
          this.password = true;
        }
        // console.log(this.pwdCheck);
      },
    },
  },
  methods: {
    ...mapActions(userStore, ["userResign", "userLogout", "userUpdate"]),
    modify() {
      this.flag = !this.flag;
    },
    save() {
      // 서버에 정보 전달
      if (!this.password) {
        // alert(this.password);
        this.userUpdate(this.userInfo);
        alert("저장되었다!");
        this.flag = !this.flag;
      } else {
        alert("새로운 비밀번호가 일치하지 않습니다.");
      }
    },
    resign() {
      this.$bvModal
        .msgBoxConfirm("정말로 회원 탈퇴하실 건가요?")
        .then((flag) => {
          if (flag) {
            this.userLogout(this.userInfo.id);
            sessionStorage.removeItem("access-token"); //저장된 토큰 없애기
            sessionStorage.removeItem("refresh-token"); //저장된 토큰 없애기
            this.userResign(this.userInfo);
            this.$router.push({ name: "index" });
          }
        })
        .catch(() => {
          console.log("취소");
        });
    },
    updatePwd() {
      console.log("기존 : " + this.pwd + " 확인 : " + this.pwdCheck);
    },
    // change() {
    //   console.log("기존 : " + this.user.pwd + " 확인 : " + this.pwdCheck);
    //   if (this.pwdCheck == this.user.pwd) {
    //     this.password = false;
    //   } else {
    //     this.password = true;
    //   }
    // },
  },
};
// library.add();
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
