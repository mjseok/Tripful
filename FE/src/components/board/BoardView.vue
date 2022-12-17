<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>글보기</h3></b-alert>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button variant="outline-primary" @click="moveList">목록</b-button>
      </b-col>
      <b-col class="text-right" v-if="userInfo && userInfo.uid === board.uid">
        <b-button variant="outline-info" size="sm" @click="moveModifyArticle" class="mr-2"
          >글수정</b-button
        >
        <b-button variant="outline-danger" size="sm" @click="deleteArticle">글삭제</b-button>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col>
        <b-card
          v-if="board.boardid == undefined"
          :header-html="`<h3>${board.noticeid}.
          ${board.title} [${board.hit}]</h3><div><h6>${board.name}</div><div>${board.date}</h6></div>`"
          class="mb-2"
          border-variant="dark"
          no-body
        >
          <b-card-body class="text-left">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>

        <b-card
          v-else
          :header-html="`<h3>${board.boardid}.
          ${board.title} [${board.hit}]</h3><div><h6>${board.name}</div><div>${board.date}</h6></div>`"
          class="mb-2"
          border-variant="dark"
          no-body
        >
          <b-card-body class="text-left">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
// import moment from "moment";
import { getBoard, deleteBoard, getNotice, deleteNotice } from "@/api/board";
import { mapState } from "vuex";

const userStore = "userStore";

export default {
  name: "BoardDetail",
  data() {
    return {
      board: {},
    };
  },
  computed: {
    ...mapState(userStore, ["userInfo"]),
    message() {
      if (this.board.content) return this.board.content.split("\n").join("<br>");
      return "";
    },
  },
  created() {
    let boardType = this.$route.params.boardType;
    if (boardType == "community") {
      let param = this.$route.params.boardid;
      console.log("param : " + param);
      getBoard(
        param,
        ({ data }) => {
          console.log(data);
          this.board = data;
        },
        (error) => {
          console.log(error);
        }
      );
    } else {
      let param = this.$route.params.noticeid;
      console.log("param : " + param);
      getNotice(
        param,
        ({ data }) => {
          console.log(data);
          this.board = data;
        },
        (error) => {
          console.log(error);
        }
      );
    }
  },
  methods: {
    moveModifyArticle() {
      let boardType = this.$route.params.boardType;
      if (boardType == "community") {
        this.$router.replace({
          name: "boardModify",
          params: { boardid: this.board.boardid, boardType: "community" },
        });
      } else {
        this.$router.replace({
          name: "boardModify",
          params: { boardid: this.board.noticeid, boardType: "notice" },
        });
      }

      //   this.$router.push({ path: `/board/modify/${this.article.articleno}` });
    },

    deleteArticle() {
      let boardType = this.$route.params.boardType;
      if (confirm("정말로 삭제?")) {
        if (boardType == "community") {
          deleteBoard(
            this.board.boardid,
            ({ data }) => {
              console.log("data : " + data);
              // let msg = "삭제 처리시 문제가 발생했습니다.";
              // if (data === "success") {
              //   msg = "삭제가 완료되었습니다.";
              // }

              // let msg = "삭제 처리시 문제가 발생했습니다.";
              // alert(msg);
              this.moveList();
            },
            (error) => {
              console.log(error);
            }
          );

          this.$router.replace({
            name: "boardList",
            params: { boardid: this.board.boardid, boardType: "community" },
          });
        } else {
          deleteNotice(
            this.board.noticeid,
            ({ data }) => {
              console.log("data : " + data);
              // let msg = "삭제 처리시 문제가 발생했습니다.";
              // if (data === "success") {
              //   msg = "삭제가 완료되었습니다.";
              // }

              // let msg = "삭제 처리시 문제가 발생했습니다.";
              // alert(msg);
              this.moveList();
            },
            (error) => {
              console.log(error);
            }
          );

          this.$router.replace({
            name: "boardList",
            params: { boardid: this.board.boardid, boardType: "notice" },
          });
        }
      }
    },
    moveList() {
      let boardType = this.$route.params.boardType;
      if (boardType == "community") {
        this.$router.push({ name: "community" });
      } else {
        this.$router.push({ name: "notice" });
      }
    },
  },
  // filters: {
  //   dateFormat(regtime) {
  //     return moment(new Date(regtime)).format("YY.MM.DD hh:mm:ss");
  //   },
  // },
};
</script>

<style></style>
