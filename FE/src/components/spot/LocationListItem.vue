<template>
  <div
    class="card draggable col-3.5 m-1"
    draggable="true"
    style="width: 180px"
    @click="selectLocation"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <img
      :src="location.image"
      class="card-img-top"
      style="height: 160.3px"
      alt="No Image"
      @error="NoImg"
    />
    <div class="card-body">
      <p class="card-title">{{ location.title }}</p>
    </div>
    <app-button
      type="theme"
      class="btn remove-spot m-1 mb-2"
      @click="detailViewLocation"
    >
      자세히보기
    </app-button>
  </div>
</template>

<script>
import { mapActions } from "vuex";
import AppButton from "@/components/user/AppButton";

const locationStore = "locationStore";

export default {
  name: "LocationListItem",
  components: { AppButton },
  data() {
    return {
      isColor: false,
    };
  },
  props: {
    location: Object,
  },
  methods: {
    ...mapActions(locationStore, ["detailLocation"]),
    selectLocation() {
      // console.log("listRow : ", this.house);
      // this.$store.dispatch("getHouse", this.house);
      this.detailLocation(this.location);

      console.log(this.location);

      // 잠깐 페이지 이동 막아두기(지도에 마커 표시 먼저!!)
      // this.$router.push("detail");
    },
    detailViewLocation() {
      // console.log("listRow : ", this.house);
      // this.$store.dispatch("getHouse", this.house);
      this.detailLocation(this.location);

      // 잠깐 페이지 이동 막아두기(지도에 마커 표시 먼저!!)
      this.$router.push("detail");
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
