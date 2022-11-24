<template>
  <div class="container contents">
    <b-row class="mb-1">
      <b-col class="text-right" v-if="isAdmin || type === 'community'">
        <b-button variant="outline-primary" @click="moveWrite()"
          >글쓰기</b-button
        >
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <b-table
          hover
          :items="boards"
          :fields="fields"
          @row-clicked="viewBoard"
        >
        </b-table>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import { boardList, noticeList } from "@/api/board";
import { mapState } from "vuex";

const userStore = "userStore";
export default {
  name: "BoardList",
  props: {
    type: {
      type: String,
      description: "community인지 notice인지",
    },
  },
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
    if (this.type === "community") {
      boardList(
        pgno,
        ({ data }) => {
          console.log(data);
          this.boards = data;
        },
        (error) => {
          console.log(error);
        }
      );
    } else {
      noticeList(
        pgno,
        ({ data }) => {
          console.log(data);
          this.boards = data;
        },
        (error) => {
          console.log(error);
        }
      );
    }
  },
  methods: {
    moveWrite() {
      this.$router.push({ name: "boardWrite" });
    },
    viewBoard(board) {
      this.$router.push({
        name: "boardView",
        params: { boardid: board.boardid },
      });
    },
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
