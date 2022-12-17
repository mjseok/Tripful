<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>글수정</h3></b-alert>
      </b-col>
    </b-row>
    <board-input-item type="modify" :boardType="boardType" />
  </b-container>
</template>

<script>
import BoardInputItem from "@/components/board/item/BoardInputItem";

export default {
  name: "BoardModify",
  components: {
    BoardInputItem,
  },
  data() {
    return {
      boardType: "",
    };
  },
  created() {
    this.boardType = this.$route.params.boardType;
    console.log("modify vue : " + this.boardType);
  },
};
</script>

<style></style>
