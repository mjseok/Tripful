<template>
  <div class="container contents">
    <h2 class="mb-2">지역별 관광지 조회</h2>
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
        <app-button
          type="theme"
          id="btn-select-all"
          class="button is-checked"
          data-filter="*"
          value="0"
          @click="clickTheme($event)"
          >전체
        </app-button>
        <app-button
          type="theme"
          id="btn-select-hotspot"
          class="button"
          data-filter=".hotspot"
          value="12"
          @click="clickTheme($event)"
        >
          관광지
        </app-button>
        <app-button
          type="theme"
          class="button"
          data-filter=".culture"
          value="14"
          @click="clickTheme($event)"
        >
          문화시설
        </app-button>
        <app-button
          type="theme"
          class="button"
          data-filter=".festival"
          value="15"
          @click="clickTheme($event)"
        >
          행사/공연
        </app-button>
        <app-button
          type="theme"
          class="button"
          data-filter=".course"
          value="25"
          @click="clickTheme($event)"
        >
          여행코스
        </app-button>
        <app-button
          type="theme"
          class="button"
          data-filter=".sports"
          value="28"
          @click="clickTheme($event)"
        >
          레포츠
        </app-button>
        <app-button
          type="theme"
          class="button"
          data-filter=".hotel"
          value="32"
          @click="clickTheme($event)"
        >
          숙박
        </app-button>
        <app-button
          type="theme"
          class="button"
          data-filter=".shopping"
          value="38"
          @click="clickTheme($event)"
        >
          쇼핑
        </app-button>
        <app-button
          type="theme"
          class="button"
          data-filter=".food"
          value="39"
          @click="clickTheme($event)"
        >
          음식점
        </app-button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";

// import AppInput from "@/components/user/AppInput";
import AppButton from "@/components/user/AppButton";
// import AppCard from "@/components/common/AppCard";

const locationStore = "locationStore";

export default {
  name: "LocationSearch",
  components: { AppButton },
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
    ...mapMutations(locationStore, [
      "CLEAR_SIDO_LIST",
      "CLEAR_GUGUN_LIST",
      "CLEAR_LOCATION_LIST",
      "SET_SIDO_ID",
      "SET_GUGUN_ID",
    ]),
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
      this.SET_SIDO_ID(this.sidoCode);
      this.SET_GUGUN_ID(this.gugunCode);
      if (this.gugunCode) {
        this.getLocationList({
          sidoCode: this.sidoCode,
          gugunCode: this.gugunCode,
          themeCode: 0,
          pageno: 1,
        });
      }
    },
    clickTheme(event) {
      // console.log("this :", event.target.value);
      let btn = document.getElementsByClassName("button");
      console.log(btn);
      for (var i = 0; i < btn.length; i++) {
        btn[i].classList.remove("clicked");
      }
      event.target.classList.add("clicked");
      this.themeCode = event.target.value;
      if (this.gugunCode)
        this.getLocationList({
          sidoCode: this.sidoCode,
          gugunCode: this.gugunCode,
          themeCode: this.themeCode,
          pageno: 1,
        });
      console.log("EVENT", event.target);
    },
  },
};
</script>

<style lang="scss">
@import "@/assets/styles/User/_card.scss";
@import "@/assets/styles/User/_button.scss";
.clicked {
  background-color: #e4dccf;
  color: black;
}
.contents {
  margin-top: 0px;
  text-align: center;
  margin-bottom: 0px;
}
.button {
  width: 80px;
}
</style>
