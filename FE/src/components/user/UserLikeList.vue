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
              <div class="text-muted text-center mb-2">찜하기 목록</div>
            </template>
            <div class="col-lg-12">
              <!-- Filter -->

              <!-- style="display: none" -->

              <!-- end of button group -->
              <div class="grid" id="element-grid"></div>

              <b-container v-if="likes && likes.length != 0" class="bv-example-row mt-3">
                <user-like-item v-for="(like, index) in likes" :key="index" :like="like" />
              </b-container>
              <b-container v-else class="bv-example-row mt-3">
                <b-row>
                  <b-col><b-alert show>찜하기 정보가 없습니다.</b-alert></b-col>
                </b-row>
              </b-container>

              <!-- end of grid -->
              <!-- end of filter -->
            </div>
          </app-card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import UserLikeItem from "@/components/user/UserLikeItem";
import AppCard from "@/components/common/AppCard";
import api from "@/api/http";
import { mapGetters, mapState, mapActions } from "vuex";
const userStore = "userStore";
export default {
  name: "UserLikeList",
  components: { AppCard, UserLikeItem },
  data() {
    return {};
  },
  mounted() {
    console.log(this.checkUserInfo.uid);
    api
      .get(`/social/getLikedSpots/${this.checkUserInfo.uid}`)
      .then((data) => {
        console.log("data 는 : " + JSON.stringify(data));
        this.userLikesInit(data.data);
        // this.selectLikesInfo = data.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  computed: {
    ...mapState(userStore, ["userInfo", "likes"]),
    ...mapGetters(userStore, ["checkUserInfo", "selectLikesInfo"]),
  },
  methods: {
    ...mapActions(userStore, ["userLikesInit"]),
  },
};
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
</style>
