<template>
  <div>
    <div class="container contents">
      <h2 class="mb-4">여행 스케줄</h2>
      <kakao-map> </kakao-map>
      <div class="mb-4 col-4" id="likeList" style="width: 100%"></div>
      <em>원하는 순서대로 장소를 옮겨보세요!</em><br />
      <em style="font-size: smaller">최대 8개까지 등록 가능합니다.</em>
      <!-- <p class="schedule-container">내가 찜한 장소</p> -->
      <like-list></like-list>
      <!-- <spot-like-list></spot-like-list> -->
      <!-- <div class="draggable-container row" id="before-schedule"></div> -->
      <!-- <div class="row">
        <p class="schedule-container col">나의 스케줄</p>
        <div class="col schedule">
          <button
            class="btn btn-solid-sm"
            id="register-schedule"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
          >
            스케줄 등록
          </button>
        </div>
      </div> -->
      <!-- Details Modal -->
      <div
        id="staticBackdrop"
        class="modal fade"
        tabindex="-1"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-schedule">
          <div class="modal-content content-sm">
            <div class="row">
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
                id="btn-close-form"
              ></button>
              <!-- end of col -->
              <div class="container">
                <h3>나의 스케줄</h3>
                <div class="row">
                  <p class="col-8"></p>
                  <p class="col-4">작성자: ${user.name}</p>
                </div>

                <form method="POST" id="register-form">
                  <input type="hidden" name="act" value="register" />
                  <div class="row">
                    <div class="col-10">
                      제목 :
                      <input
                        type="text"
                        id="title"
                        name="title"
                        style="width: 90%"
                      />
                    </div>
                    <div class="col">
                      <select
                        class="form-select"
                        form="register-form"
                        name="theme"
                      >
                        <option value="food">먹방</option>
                        <option value="activity">액티비티</option>
                        <option value="healing">힐링</option>
                      </select>
                    </div>
                  </div>
                  <div class="module-spots row"></div>
                </form>
                <button
                  type="button"
                  class="btn-solid-sm p-4"
                  id="btn-register"
                >
                  등록하기
                </button>
              </div>
              <!-- end of col -->
            </div>
            <!-- end of row -->
          </div>
          <!-- end of modal-content -->
        </div>
        <!-- end of modal-dialog -->
      </div>
      <!-- <div class="draggable-container row" id="after-schedule"></div> -->
    </div>
  </div>
</template>

<script>
import KakaoMap from "@/components/common/KakaoMap";
// import likeList from "@/components/schedule/likeList";
import likeList from "@/components/schedule/likeList";

import api from "@/api/http";
import { mapState, mapActions } from "vuex";

const locationStore = "locationStore";
const userStore = "userStore";

export default {
  name: "ScheduleView",
  components: { KakaoMap, likeList },
  computed: {
    ...mapState(userStore, ["userInfo", "likes"]),
    ...mapState(locationStore, ["location"]),
  },
  methods: {
    ...mapActions(userStore, ["userSetLikes"]),
    deleteLike() {
      console.log("info : " + this.userInfo.uid);
      let params = {
        spotid: this.like.spotid,
        uid: this.userInfo.uid,
      };

      api
        .post(`/social/deleteLikeSpot`, JSON.stringify(params))
        .then((data) => {
          console.log("data 는 : " + data);
          this.isHearted = false;
        })
        .catch((error) => {
          console.log(error);
        });

      this.userSetLikes({
        likes: this.likes,
        spotid: this.like.spotid,
      });
    },
  },
};
</script>

<style lang="scss">
@import "@/assets/styles/schedule/_likeList.scss";
// .contents {
//   margin-top: 130px;
//   text-align: center;
//   margin-bottom: 100px;
// }
// .draggable-container {
//   padding: 10px;
//   background-color: #b5c1dc57;
//   border-radius: 8px;
//   cursor: move;
//   min-height: 200px;
// }

// #after-schedule button {
//   display: none;
// }

// .draggable-container .card {
//   margin: 5px;
//   padding: 10px;
// }

// .draggable.dragging {
//   opacity: 0.5;
// }

// .draggable-container button {
//   width: 100%;
//   border: none;
//   border-radius: 8px;
//   font-size: 10px;
//   margin-bottom: 10px;
//   background-color: #ff5574;
// }
// .schedule-container {
//   text-align: left;
//   margin: 10px 0px;
// }

// .schedule {
//   display: flex;
//   align-items: center;
//   justify-content: flex-end;
// }
// .schedule-header {
//   padding-top: 8rem;
//   padding-bottom: 5rem;
//   text-align: center;
// }
// .modal-schedule {
//   margin-right: 1rem;
//   margin-left: 1rem;
//   pointer-events: all;
// }

// /**************************/
// /*     Projects-schedule  */
// /**************************/

// .filter .schedule-item {
//   display: inline-block;
//   width: 351px;
//   margin-right: 0.625rem;
//   margin-left: 0.625rem;
//   vertical-align: top;
// }
// .schedule-item {
//   width: 30%;
//   margin-bottom: 3rem;
// }

// .schedule-item a {
//   text-decoration: none;
// }

// .schedule-item img {
//   margin-bottom: 1.125rem;
//   border-radius: 8px;
//   border: 1px solid #5e6576;
// }

// .schedule-item p {
//   text-align: left;
// }
// .schedule-item p button {
//   float: right;
// }
// .schedule-item p strong {
//   font-weight: bold;
//   color: #222222;
//   font-size: xx-large;
// }
// .btn-solid-sm-init {
//   border: 1px solid #ff5574;
//   border-radius: 30px;
//   background-color: #ff5574;
//   color: #ffffff;
//   font-weight: 600;
//   font-size: 0.875rem;
//   line-height: 0;
//   text-decoration: none;
//   transition: all 0.2s;
//   height: 30px;
//   width: 30px;
// }
// .btn-solid-sm-init > i {
//   font-style: normal;
// }
// .btn-solid-sm-init:hover {
//   background-color: transparent;
//   color: #ff5574;
//   /* needs to stay here because of the color property of a tag */
//   text-decoration: none;
// }
</style>
