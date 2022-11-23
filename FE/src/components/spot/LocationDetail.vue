<template>
  <div class="container contents">
    <h2 class="mb-5">{{ location.title }}</h2>
    <div class="row">
      <div class="col-6">
        <img :src="location.image" style="width: 100%" />
        <!-- onerror="this.src='${root}/assets/img/noImg.jpg'" -->
      </div>
      <div class="mb-4 col-6 d-flex align-items-center" id="info">
        <p class="text-start" style="color: black">
          ☎ TEL : {{ location.tel }}<br />
          <i class="bi bi-building"></i> ADDRESS : {{ location.address }}<br />
          <br />
          <i class="bi bi-info-circle-fill"></i> Details<br />
          {{ loc.desc }}
        </p>
      </div>
    </div>
    <!-- <c:if test="${!empty user}"> -->
    <p class="map-btn mt-4 mb-4">
      <app-button
        type="theme"
        class="btn-solid-sm-point"
        id="btn-like-spot"
        @click="addLike"
        v-if="!isHearted"
      >
        <i class="bi bi-suit-heart-fill" style="color: inherit"></i>
        &nbsp; 찜 추가하기
      </app-button>

      <app-button
        type="theme"
        class="btn-solid-sm-point"
        id="btn-unlike-spot"
        v-else
        @click="deleteLike"
      >
        <i class="bi bi-x-lg" style="color: inherit"></i>&nbsp; 찜 취소하기
      </app-button>

      <app-button
        type="theme"
        cclass="btn-solid-sm"
        data-bs-toggle="modal"
        data-bs-target="#writeReview"
        id="btn-write-review"
      >
        <i class="bi bi-chat-square-quote" style="color: inherit"></i>
        &nbsp; 리뷰 남기기
      </app-button>
    </p>
    <!-- </c:if> -->
    <div class="mb-4 mt-4 col" id="map" style="width: 100%; height: 400px"></div>
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import api from "@/api/http";
import AppButton from "@/components/user/AppButton";

const locationStore = "locationStore";
const userStore = "userStore";

export default {
  name: "LocationDetail",
  components: { AppButton },
  data() {
    return {
      loc: {
        desc: null,
      },
      isHearted: false,
    };
  },
  computed: {
    ...mapState(userStore, ["userInfo", "likes"]),
    ...mapState(locationStore, ["location"]),
    ...mapGetters(userStore, [
      "checkUserInfo",
      // ...
    ]),
  },
  mounted() {
    api
      .get(`/spot/${this.location.spotid}`)
      .then((data) => {
        console.log("data 는 : " + JSON.stringify(data.data));
        this.loc.desc = data.data.desc;
      })
      .catch((error) => {
        console.log(error);
      });

    let params = {
      spotid: this.location.spotid,
      uid: this.checkUserInfo.uid,
    };
    console.log(params);
    api
      .post(`/social/checkLikeSpot`, JSON.stringify(params))
      .then((data) => {
        console.log("check data 는 : " + JSON.stringify(data));
        if (data.data > 0) {
          this.isHearted = true;
        }
        console.log("이미 처리된적 있어~ " + data.data);
      })
      .catch((error) => {
        console.log(error);
      });
  },

  methods: {
    addLike() {
      console.log("info : " + this.userInfo.uid);
      let params = {
        spotid: this.location.spotid,
        uid: this.userInfo.uid,
      };

      api
        .post(`/social/addLikeSpot`, JSON.stringify(params))
        .then((data) => {
          console.log("data 는 : " + data);
          this.isHearted = true;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    deleteLike() {
      console.log("info : " + this.userInfo.uid);
      let params = {
        spotid: this.location.spotid,
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

      this.userSetLikes(this.likes, params.uid);
    },
  },
};
</script>

<style></style>
