<template>
  <b-row
    class="m-2"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <b-col cols="2" class="text-center align-self-center">
      <!-- <b-img thumbnail :src="location.image" alt="No Image"></b-img> -->
    </b-col>
    <b-col cols="8" class="align-self-center"> {{ like.title }} </b-col>
    <b-col cols="2" class="align-self-center">
      <app-button type="theme" class="button" data-filter=".food" value="39" @click="deleteLike">
        x
      </app-button>
    </b-col>
  </b-row>
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
    // detailViewLocation() {
    //   // console.log("listRow : ", this.house);
    //   // this.$store.dispatch("getHouse", this.house);
    //   this.detailLocation(this.location);
    //   // 잠깐 페이지 이동 막아두기(지도에 마커 표시 먼저!!)
    //   this.$router.push("detail");
    // },
    colorChange(flag) {
      this.isColor = flag;
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
