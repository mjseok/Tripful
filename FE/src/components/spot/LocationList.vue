<template>
  <div>
    <div class="row filter">
      <div class="col-lg-12 mt-3">
        <!-- Filter -->

        <!-- style="display: none" -->

        <!-- end of button group -->
        <div class="grid" id="element-grid">
          <b-container v-if="locations && locations.length != 0" class="bv-example mt-3 row">
            <location-list-item
              v-for="(location, index) in locations"
              :key="index"
              :location="location"
            />
          </b-container>
          <b-container v-else class="bv-example-row mt-2">
            <b-row>
              <b-col><b-alert show>관광지 정보가 없습니다.</b-alert></b-col>
            </b-row>
          </b-container>
        </div>
        <!-- end of grid -->
        <!-- end of filter -->
      </div>
      <!-- end of col -->
    </div>
    <div class="row" id="pagination-div" v-if="locations && locations.length != 0">
      <ul class="pagination justify-content-center" id="pagination-contents">
        <li class="page-item"><a class="page-link" @click="pagination($event)">이전</a></li>
        <li class="page-item active first-item">
          <a class="page-link page-num" @click="pagination">1</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" @click="pagination">2</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" @click="pagination">3</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" @click="pagination">4</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" @click="pagination">5</a>
        </li>
        <li class="page-item"><a class="page-link" @click="pagination">다음</a></li>
      </ul>
    </div>
    <!-- end of row -->
  </div>
</template>

<script>
import LocationListItem from "@/components/spot/LocationListItem";
import { mapState, mapActions } from "vuex";

const locationStore = "locationStore";

export default {
  name: "LocationList",
  components: {
    LocationListItem,
  },
  data() {
    return {
      num: "",
    };
  },
  computed: {
    ...mapState(locationStore, ["sidos", "guguns", "locations", "sidoId", "gugunId"]),
    // houses() {
    //   return this.$store.state.houses;
    // },
  },
  methods: {
    ...mapActions(locationStore, ["getLocationList"]),
    pagination(event) {
      console.log("this는 :" + event.target.textContent);
      let pageno = event.target.textContent;
      console.log(this.sidoId + " , " + this.gugunId);
      this.getLocationList({
        sidoCode: this.sidoId,
        gugunCode: this.gugunId,
        themeCode: 0,
        pageno: pageno,
      });
      console.log("권태윤 바보");
    },
  },
};
</script>

<style>
#pagination-div {
  display: flex;
  justify-content: center;
}
</style>
