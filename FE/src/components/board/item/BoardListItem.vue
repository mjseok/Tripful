<template>
  <b-tr>
    <b-td>{{ boardid }}</b-td>
    <b-th class="text-left">
      <router-link :to="{ name: 'boardView', params: { boardid: boardid } }">{{
        title
      }}</router-link>
    </b-th>
    <b-td>{{ hit }}</b-td>
    <b-td>{{ name }}</b-td>
    <b-td>{{ date | dateFormat }}</b-td>
  </b-tr>
</template>

<script>
import moment from "moment";

export default {
  name: "BoardListItem",
  props: {
    boardid: Number,
    name: String,
    title: String,
    hit: Number,
    date: String,
  },
  filters: {
    dateFormat(date) {
      return moment(new Date(date)).format("YY.MM.DD");
    },
  },
};
</script>

<style></style>
