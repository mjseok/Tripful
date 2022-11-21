<template>
  <div>
    <map-search></map-search>
    <kakao-map></kakao-map>
  </div>
</template>

<script>
import MapSearch from "@/components/spot/MapSearch";
import KakaoMap from "@/components/common/KakaoMap";

export default {
  name: "MapView",
  components: {
    MapSearch,
    KakaoMap,
  },
};
</script>

<style></style>
