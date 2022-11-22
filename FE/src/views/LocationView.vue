<template>
  <div>
    <location-search></location-search>
    <div style="width: 50%; float: left">
      <kakao-map></kakao-map>
    </div>
    <div style="width: 50%; float: right">
      <location-list></location-list>
    </div>
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
