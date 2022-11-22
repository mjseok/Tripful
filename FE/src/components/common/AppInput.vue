<template>
  <div class="input-group mb-4" style="align-items: center">
    <input
      class="form-control border rounded-5"
      name="keyword"
      type="search"
      placeholder="원하는 장소를 검색해보세요"
      id="map-search"
      v-model="data"
      @change="search"
    />
  </div>
</template>

<script>
import { mapActions, mapMutations } from "vuex";

const mapStore = "mapStore";
export default {
  name: "MapSearch",
  data() {
    return {
      data: "",
    };
  },
  methods: {
    ...mapActions(mapStore, ["searchKeyword"]),
    ...mapMutations(mapStore, ["CLEAR_KEYWORD"]),
    search() {
      this.searchKeyword(this.data);
    },
  },
};
</script>

<style></style>
