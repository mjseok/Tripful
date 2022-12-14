<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>글작성</h3></b-alert>
      </b-col>
    </b-row>
    <board-input-item type="register" :boardType="this.boardType" />
  </b-container>
</template>

<script>
import BoardInputItem from "@/components/board/item/BoardInputItem";

export default {
  name: "BoardWrite",
  components: {
    BoardInputItem,
  },
  created() {
    this.boardType = this.$route.params.boardType;
    console.log("보드타입은 : " + this.boardType);
  },
};
</script>

<style></style>
