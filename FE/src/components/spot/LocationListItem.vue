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
    <b-col cols="8" class="align-self-center">
      [{{ location.title }}] {{ location.address }}
    </b-col>
    <b-col cols="2" class="align-self-center">
      <app-button
        type="theme"
        class="button"
        data-filter=".food"
        value="39"
        @click="detailViewLocation"
      >
        자세히보기
      </app-button>
    </b-col>
  </b-row>
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
