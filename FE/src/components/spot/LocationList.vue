<template>
  <div>
    <div class="row filter">
      <div class="col-lg-12">
        <!-- Filter -->

        <!-- style="display: none" -->

        <!-- end of button group -->
        <div class="grid" id="element-grid"></div>

        <b-container
          v-if="locations && locations.length != 0"
          class="bv-example-row mt-3"
        >
          <location-list-item
            v-for="(location, index) in locations"
            :key="index"
            :location="location"
          />
        </b-container>
        <b-container v-else class="bv-example-row mt-3">
          <b-row>
            <b-col><b-alert show>관광지 정보가 없습니다.</b-alert></b-col>
          </b-row>
        </b-container>

        <!-- end of grid -->
        <!-- end of filter -->
      </div>
      <!-- end of col -->
    </div>
    <div
      class="row"
      id="pagination-div"
      v-if="locations && locations.length != 0"
    >
      <ul class="pagination justify-content-center" id="pagination-contents">
        <li class="page-item"><a class="page-link" href="#">이전</a></li>
        <li class="page-item active first-item">
          <a class="page-link page-num" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" href="#">4</a>
        </li>
        <li class="page-item">
          <a class="page-link page-num" href="#">5</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">다음</a></li>
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
    return {};
  },
  computed: {
    ...mapState(locationStore, ["sidos", "guguns", "locations"]),
    // houses() {
    //   return this.$store.state.houses;
    // },
  },
  methods: {
    ...mapActions(locationStore, ["getLocationList"]),
  },
};
</script>

<style>
#pagination-div {
  display: flex;
  justify-content: center;
}
</style>
