<template>
  <div class="container contents">
    <b-row class="mb-1">
      <b-col class="text-right" v-if="isAdmin || type === 'community'">
        <b-button variant="outline-primary" @click="moveWrite()">글쓰기</b-button>
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <b-table
          v-if="this.type === 'community'"
          hover
          :items="boards"
          :fields="boardFields"
          @row-clicked="viewBoard"
          :type="type"
        >
        </b-table>
        <b-table
          v-if="this.type === 'notice'"
          hover
          :items="notices"
          :fields="noticeFields"
          :type="type"
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
      boardFields: [
        { key: "boardid", label: "글번호", tdClass: "tdClass" },
        { key: "title", label: "제목", tdClass: "tdSubject" },
        { key: "name", label: "작성자", tdClass: "tdClass" },
        { key: "date", label: "작성일", tdClass: "tdClass" },
        { key: "hit", label: "조회수", tdClass: "tdClass" },
      ],
      notices: [],
      noticeFields: [
        { key: "noticeid", label: "글번호", tdClass: "tdClass" },
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
          this.notices = data;
          console.log("notices : " + this.notices);
        },
        (error) => {
          console.log(error);
        }
      );
    }
  },
  methods: {
    moveWrite() {
      this.$router.push({ name: "boardWrite", params: { boardType: this.type } });
    },
    viewBoard(data) {
      this.$router.push({
        name: "boardView",
        params: { boardid: data.boardid, noticeid: data.noticeid, boardType: this.type },
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
