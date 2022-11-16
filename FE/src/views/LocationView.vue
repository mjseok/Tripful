<template>
  <div>
    <location-search></location-search>
    <location-list></location-list>
  </div>
</template>

<script>
import LocationList from "@/components/spot/LocationList";
import LocationSearch from "@/components/spot/LocationSearch";

export default {
  name: "LocationSearchView",
  components: {
    LocationList,
    LocationSearch,
  },
};
</script>

<style></style>
