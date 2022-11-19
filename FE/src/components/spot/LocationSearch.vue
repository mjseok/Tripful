<template>
  <div class="container">
    <h2 class="text-center mt-3 mb-3">지역별 관광지 조회</h2>
    <div class="row col-md-12 justify-content-center mb-2">
      <div class="form-group col-md-2">
        <b-form-select v-model="sidoCode" :options="sidos" @change="gugunList"></b-form-select>
      </div>

      <div class="form-group col-md-2">
        <b-form-select
          v-model="gugunCode"
          :options="guguns"
          @change="searchLocation"
        ></b-form-select>
      </div>

      <div class="form-group col-md-12 text-center">
        <span>지금 가고 싶은 여행지를 선택해주세요</span>
      </div>
      <div class="button-group filters-button-group" id="filters-button-group">
        <button
          id="btn-select-all"
          class="button is-checked"
          data-filter="*"
          value="0"
          @click="test($event)"
        >
          전체
        </button>
        <button
          id="btn-select-hotspot"
          class="button"
          data-filter=".hotspot"
          value="12"
          @click="test($event)"
        >
          관광지
        </button>
        <button class="button" data-filter=".culture" value="14" @click="test($event)">
          문화시설
        </button>
        <button class="button" data-filter=".festival" value="15" @click="test($event)">
          행사/공연
        </button>
        <button class="button" data-filter=".course" value="25" @click="test($event)">
          여행코스
        </button>
        <button class="button" data-filter=".sports" value="28" @click="test($event)">
          레포츠
        </button>
        <button class="button" data-filter=".hotel" value="32" @click="test($event)">숙박</button>
        <button class="button" data-filter=".shopping" value="38" @click="test($event)">
          쇼핑
        </button>
        <button class="button" data-filter=".food" value="39" @click="test($event)">음식점</button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";

const locationStore = "locationStore";

export default {
  name: "LocationSearch",
  data() {
    return {
      sidoCode: null,
      gugunCode: null,
      themeCode: null,
    };
  },
  computed: {
    ...mapState(locationStore, ["sidos", "guguns", "locations"]),
  },
  created() {
    this.CLEAR_SIDO_LIST();
    this.CLEAR_LOCATION_LIST();
    this.getSido();
  },

  methods: {
    ...mapActions(locationStore, ["getSido", "getGugun", "getLocationList"]),
    ...mapMutations(locationStore, ["CLEAR_SIDO_LIST", "CLEAR_GUGUN_LIST", "CLEAR_LOCATION_LIST"]),
    // sidoList() {
    //   this.getSido();
    // },
    gugunList() {
      // console.log(this.sidoCode);
      this.CLEAR_GUGUN_LIST();
      this.gugunCode = null;
      if (this.sidoCode) this.getGugun(this.sidoCode);
    },
    searchLocation() {
      console.log(this.sidoCode);
      console.log(this.gugunCode);
      if (this.gugunCode)
        this.getLocationList({ sidoCode: this.sidoCode, gugunCode: this.gugunCode, themeCode: 0 });
    },
    test(event) {
      // console.log("this :", event.target.value);
      this.themeCode = event.target.value;
      if (this.gugunCode)
        this.getLocationList({
          sidoCode: this.sidoCode,
          gugunCode: this.gugunCode,
          themeCode: this.themeCode,
        });
    },
  },
};
</script>

<style></style>
