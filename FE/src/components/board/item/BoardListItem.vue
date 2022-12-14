<template>
  <b-tr>
    <b-td v-if="type === 'community'">{{ boardid }}</b-td>
    <b-td v-if="type === 'notice'">{{ noticeid }}</b-td>
    <b-th class="text-left" v-if="type === 'community'">
      <router-link :to="{ name: 'boardView', params: { boardid: boardid } }">{{
        title
      }}</router-link>
    </b-th>
    <b-th class="text-left" v-if="type === 'notice'">
      <router-link :to="{ name: 'boardView', params: { noticeid: noticeid } }">{{
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
    noticeid: Number,
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
