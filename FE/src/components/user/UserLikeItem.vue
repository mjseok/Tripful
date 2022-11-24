<template>
  <div
    class="card"
    style="width: 180px"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <img
      thumbnail
      :src="like.image"
      class="card-img-top"
      style="height: 160.3px"
      alt="No Image"
      @error="NoImg"
    />
    <div class="card-body">
      <p class="card-title">{{ like.title }}</p>
    </div>
    <app-button type="theme" class="button" @click="deleteLike"> x </app-button>
  </div>
</template>

<script>
import api from "@/api/http";
import { mapState, mapActions } from "vuex";
import AppButton from "@/components/user/AppButton";

const locationStore = "locationStore";
const userStore = "userStore";

export default {
  name: "UserLikeItem",
  components: { AppButton },
  data() {
    return {
      isColor: false,
    };
  },
  props: {
    like: Object,
  },
  computed: {
    ...mapState(userStore, ["userInfo", "likes"]),
    ...mapState(locationStore, ["location"]),
  },
  methods: {
    ...mapActions(userStore, ["userSetLikes"]),
    deleteLike() {
      console.log("info : " + this.userInfo.uid);
      let params = {
        spotid: this.like.spotid,
        uid: this.userInfo.uid,
      };

      api
        .post(`/social/deleteLikeSpot`, JSON.stringify(params))
        .then((data) => {
          console.log("data 는 : " + data);
          this.isHearted = false;
        })
        .catch((error) => {
          console.log(error);
        });

      this.userSetLikes({
        likes: this.likes,
        spotid: this.like.spotid,
      });
    },
    colorChange(flag) {
      this.isColor = flag;
    },
    NoImg(e) {
      e.target.src = require("@/assets/img/noImg.jpg");
    },
  },
};
</script>

<style scoped>
.apt {
  width: 50px;
}
.mouse-over-bgcolor {
  background-color: lightblue;
}
</style>
