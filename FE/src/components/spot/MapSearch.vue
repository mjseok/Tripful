<template>
  <div>
    <div class="container contents">
      <h2 class="mb-4">지도로 검색하기</h2>
      <app-input></app-input>
      <!-- <div class="input-group mb-4" style="align-items: center">
        <input
          class="form-control border rounded-5"
          name="keyword"
          type="search"
          placeholder="원하는 장소를 검색해보세요"
          id="map-search"
          v-model="data"
          @change="search"
        />
        <span class="input-group-append">
          <button
            class="btn btn-outline-secondary bg-white border-start-0 border-top-0 border-end-0 border-bottom-0 border ms-n5 rounded-5"
            type="button"
            id="map-search-button"
          >
            <i class="fa fa-search"></i>
          </button>
        </span>
      </div> -->
    </div>
  </div>
</template>

<script>
// import { mapActions, mapMutations } from "vuex";
import AppInput from "@/components/common/AppInput";

// const mapStore = "mapStore";
export default {
  name: "MapSearch",
  components: {
    AppInput,
  },
  // data() {
  //   return {
  //     data: "",
  //   };
  // },
  // methods: {
  //   ...mapActions(mapStore, ["searchKeyword"]),
  //   ...mapMutations(mapStore, ["CLEAR_KEYWORD"]),
  //   search() {
  //     this.searchKeyword(this.data);
  //   },
  // },
};
</script>

<style></style>
