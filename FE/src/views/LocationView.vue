<template>
  <div>
    <location-search></location-search>
    <b-row>
      <b-col lg="6">
        <kakao-map></kakao-map>
      </b-col>
      <b-col lg="6">
        <location-list></location-list>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import LocationList from "@/components/spot/LocationList";
import LocationSearch from "@/components/spot/LocationSearch";
import KakaoMap from "@/components/common/KakaoMap";

export default {
  name: "LocationSearchView",
  components: {
    LocationList,
    LocationSearch,
    KakaoMap,
  },
};
</script>

<style></style>
