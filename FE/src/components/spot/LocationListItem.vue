<template>
  <b-row
    class="m-2"
    @click="selectLocation"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
  >
    <b-col cols="2" class="text-center align-self-center">
      <b-img thumbnail :src="location.image" alt="No Image"></b-img>
    </b-col>
    <b-col cols="10" class="align-self-center">
      [{{ location.title }}] {{ location.address }}
    </b-col>
    <b-col cols="2" class="align-self-center">
      <button @click="detailViewLocation">자세히보기</button>
    </b-col>
  </b-row>
</template>

<script>
import { mapActions } from "vuex";

const locationStore = "locationStore";

export default {
  name: "LocationListItem",
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
