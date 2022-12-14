<template>
  <b-row class="mb-1">
    <b-col style="text-align: left">
      <b-form @submit="onSubmit" @reset="onReset">
        <!-- <b-form-group id="userid-group" label="작성자:" label-for="userid">
          <b-form-input
            id="uid"
            :disabled="isUserid"
            v-model="board.uid"
            type="text"
            required
            placeholder="작성자 입력..."
          ></b-form-input>
        </b-form-group> -->

        <b-form-group id="subject-group" label="제목:" label-for="title">
          <b-form-input
            id="title"
            v-model="board.title"
            type="text"
            required
            placeholder="제목 입력..."
          ></b-form-input>
        </b-form-group>

        <b-form-group id="content-group" label="내용:" label-for="content">
          <b-form-textarea
            id="content"
            v-model="board.content"
            placeholder="내용 입력..."
            rows="10"
            max-rows="15"
          ></b-form-textarea>
        </b-form-group>

        <b-button type="submit" variant="primary" class="m-1" v-if="this.type === 'register'"
          >글작성</b-button
        >
        <b-button type="submit" variant="primary" class="m-1" v-else>글수정</b-button>
        <b-button type="reset" variant="danger" class="m-1">초기화</b-button>
      </b-form>
    </b-col>
  </b-row>
</template>

<script>
import { writeBoard, modifyBoard, getBoard, writeNotice } from "@/api/board";
import { mapState } from "vuex";

const userStore = "userStore";
export default {
  name: "BoardInputItem",
  data() {
    return {
      board: {
        boardid: 0,
        uid: 0,
        title: "",
        content: "",
      },
      isUserid: false,
    };
  },
  props: {
    type: { type: String },
    boardType: { boardType: String },
  },
  created() {
    console.log(" : " + this.boardType);
    if (this.type === "modify") {
      let param = this.$route.params.boardid;
      getBoard(
        param,
        ({ data }) => {
          console.log(data);
          // this.article.articleno = data.article.articleno;
          // this.article.userid = data.article.userid;
          // this.article.subject = data.article.subject;
          // this.article.content = data.article.content;
          this.board = data;
        },
        (error) => {
          console.log(error);
        }
      );
      this.isUserid = true;
    }
  },
  computed: {
    ...mapState(userStore, ["userInfo"]),
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();

      let err = true;
      let msg = "";
      err &&
        !this.board.title &&
        ((msg = "제목 입력해주세요"), (err = false), this.$refs.title.focus());
      err &&
        !this.board.content &&
        ((msg = "내용 입력해주세요"), (err = false), this.$refs.content.focus());

      if (!err) alert(msg);
      else this.type === "register" ? this.registBoard() : this.modifyBoard();
    },
    onReset(event) {
      event.preventDefault();
      this.board.boardid = 0;
      this.board.title = "";
      this.board.content = "";
      // this.moveList();
    },
    registBoard() {
      console.log("id : " + this.userInfo.uid);
      console.log("boardType   : " + this.boardType);
      let param = {
        uid: this.userInfo.uid,
        title: this.board.title,
        content: this.board.content,
      };
      if (this.boardType == "community") {
        writeBoard(
          param,
          ({ data }) => {
            let msg = "등록 처리시 문제가 발생했습니다.";
            if (data === "success") {
              msg = "등록이 완료되었습니다.";
            }
            alert(msg);
            this.moveList();
          },
          (error) => {
            console.log(error);
          }
        );
      } else {
        console.log("공지사항 아직 등록하면 안됨!!");
        writeNotice(
          param,
          ({ data }) => {
            let msg = "등록 처리시 문제가 발생했습니다.";
            if (data === "success") {
              msg = "등록이 완료되었습니다.";
            }
            alert(msg);
            this.moveList();
          },
          (error) => {
            console.log(error);
          }
        );
      }
    },
    modifyBoard() {
      let param = {
        boardid: this.board.boardid,
        // uid: this.board.uid,
        title: this.board.title,
        content: this.board.content,
      };
      modifyBoard(
        param,
        ({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          // 현재 route를 /list로 변경.
          this.moveList();
        },
        (error) => {
          console.log(error);
        }
      );
    },
    moveList() {
      
      if (this.boardType == "community") {
        this.$router.push({ name: "community" });
      }else{
        this.$router.push({ name: "notice" });
      }
    },
  },
};
</script>

<style></style>
