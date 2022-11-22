<template>
  <b-container class="bv-example-row mt-3">
    <b-row class="mb-1">
      <b-col class="text-right" v-if="isAdmin">
        <b-button variant="outline-primary" @click="moveWrite()"
          >글쓰기</b-button
        >
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <b-table hover :items="boards" :fields="fields"> </b-table>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { boardLists } from "@/api/board";
import api from "@/api/http";

import { mapState } from "vuex";
const userStore = "userStore";
export default {
  name: "BoardList",
  data() {
    return {
      boards: [],
      fields: [
        { key: "boardid", label: "글번호", tdClass: "tdClass" },
        { key: "title", label: "제목", tdClass: "tdSubject" },
        { key: "name", label: "작성자", tdClass: "tdClass" },
        { key: "date", label: "작성일", tdClass: "tdClass" },
        { key: "hit", label: "조회수", tdClass: "tdClass" },
      ],
    };
  },
  computed: {
    ...mapState(userStore, ["isAdmin"]),
  },
  created() {
    let pgno = 1;
    console.log(typeof boardLists);
    api
      .get(`board/community/list/${pgno}`)
      .then(({ data }) => console.log(data + "석민지짱"))
      .catch((e) => console.log(e));

    console.log("a");
    boardLists(
      pgno,
      ({ data }) => {
        console.log(data);
        // this.boards = data;
      },
      (error) => {
        console.log(error);
      }
    );
  },
  methods: {
    moveWrite() {
      this.$router.push({ name: "boardwrite" });
    },
    // viewBoard(board) {
    //   this.$router.push({
    //     name: "boardview",
    //     params: { boardid: board.boardid },
    //   });
    // },
  },
};
</script>

<style scope>
.tdClass {
  width: 50px;
  text-align: center;
}
.tdSubject {
  width: 300px;
  text-align: left;
}
</style>
