<template>
  <div >
  <div class="container pt-lg-md mt-5">
      <div class="row justify-content-center">
          <div class="col-lg-5">
                  <app-card shadow
                  type="light"
                      header-classes="bg-white pb-5"
                      body-classes="px-lg-5 py-lg-5"
                      class="border-0">
                  <template>
                      <div class="text-center text-muted mb-4">
                          Sign Up
                      </div>
                      <form role="form">
                           <app-input alternative
                                      class="mb-3"
                                      placeholder="Id"
                                      addonLeftIcon="person-badge-fill"
                                      v-model="user.id"
                                      >
                          </app-input>
                          <app-input alternative
                                      type="password"
                                      placeholder="Password"
                                      addonLeftIcon="key-fill"
                                      v-model="user.pwd"
                                      >
                          </app-input>
                          <app-input alternative
                                      class="mb-3"
                                      placeholder="Name"
                                      addonLeftIcon="person-fill"
                                      v-model="user.name"
                                      >
                          </app-input>
                          <app-input alternative
                                      class="mb-3"
                                      placeholder="Email"
                                      addonLeftIcon="envelope"
                                      v-model="user.email"
                                      >
                          </app-input>
                          <div class="text-center">
                              <app-button type="primary" class="my-4" @click="signUp">Sign Up</app-button>
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
import { mapActions } from "vuex";

import AppInput from "@/components/user/AppInput";
import AppButton from "@/components/user/AppButton";
import AppCard from "@/components/common/AppCard";
const userStore = "userStore";
export default {
  name: "SignUpView",
  components: { AppInput,AppButton,AppCard },
  data() {
    return {
      user: {
        name:null,
        id: null,
        pwd: null,
        email:null,
      },
    };
  },
  methods: {
    ...mapActions(userStore,["userSignUp"]),
      async signUp() {
        await this.userSignUp(this.user);
      },
  },
};
// library.add();
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss"; 
@import "@/assets/styles/User/_button.scss"; 

</style>
