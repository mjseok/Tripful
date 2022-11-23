<template>
  <div class="container contents">
    <h2 class="mb-5">{{ location.title }}</h2>
    <div class="row">
      <div class="col-6">
        <img :src="location.image" @error="NoImg" style="width: 100%" />
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
      <button class="btn-solid-sm-point" id="btn-like-spot">
        <i class="bi bi-suit-heart-fill" style="color: inherit"></i>
        &nbsp; 찜 추가하기
      </button>
      <button
        class="btn-solid-sm-point"
        style="display: none"
        id="btn-unlike-spot"
      >
        <i class="bi bi-x-lg" style="color: inherit"></i>&nbsp; 찜 취소하기
      </button>
      <button
        class="btn-solid-sm"
        data-bs-toggle="modal"
        data-bs-target="#writeReview"
        id="btn-write-review"
      >
        <i class="bi bi-chat-square-quote" style="color: inherit"></i>
        &nbsp; 리뷰 남기기
      </button>
    </p>
    <!-- </c:if> -->
    <div
      class="mb-4 mt-4 col"
      id="map"
      style="width: 100%; height: 400px"
    ></div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import api from "@/api/http";

const locationStore = "locationStore";

export default {
  name: "LocationDetail",
  data() {
    return {
      loc: {
        desc: null,
      },
    };
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
  },

  computed: {
    ...mapState(locationStore, ["location"]),
    // house() {
    //   return this.$store.state.house;
    // },
  },
  methods:{
    NoImg(e){
      e.target.src=require("@/assets/img/noImg.jpg");
    }
  }
};
</script>

<style></style>
