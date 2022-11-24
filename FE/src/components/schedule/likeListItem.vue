<template>
  <div
    class="card draggable col"
    draggable="true"
    style="max-width: 150px"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }"
    @dragstart="dragStart"
    @dragend="dragEnd"
  >
    <input type="hidden" class="lat" :value="like.lat" />
    <input type="hidden" class="lang" :value="like.lang" />
    <input type="hidden" class="id" :value="like.spotid" />
    <input type="hidden" class="image" :value="like.image" />
    <input type="hidden" class="title" :value="like.title" />
    <img :src="like.image" class="card-img-top" alt="2" style="height: 100px" />
    <div class="card-body">
      <p class="card-title">{{ like.title }}</p>
    </div>
    <button
      class="btn btn-danger remove-spot"
      :value="like.spotid"
      display=""
      @click="deleteLike"
    >
      찜 취소
    </button>
  </div>
</template>

<script>
import api from "@/api/http";
import { mapState, mapActions } from "vuex";
// import AppButton from "@/components/user/AppButton";

const locationStore = "locationStore";
const userStore = "userStore";
// let status;

export default {
  name: "LikeItem",
  //   components: { AppButton },
  data() {
    return {
      isColor: false,
    };
  },
  props: {
    like: Object,
  },
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
    colorChange(flag) {
      this.isColor = flag;
    },
    dragStart(e) {
      e.classList.add("dragging");
      //       status = e.parentNode.id;
    },
    dragEnd(e) {
      e.classList.remove("dragging");
      //       if (
      //         e.parentNode.id == "after-schedule" &&
      //         status != "after-schedule"
      //       ) {
      //         var addLat = e.querySelector(".lat").value;
      //         var addLang = e.querySelector(".lang").value;
      //         var title = e.querySelector(".card-title").innerText;
      //         var addPosition = new kakao.maps.LatLng(addLat, addLang);
      //         addMarker(addPosition, title);
      //         addLinePath();
      //       }
      //       if (
      //         e.parentNode.id == "before-schedule" &&
      //         status != "before-schedule"
      //       ) {
      //         var removeLat = draggable.querySelector(".lat").value;
      //         var removeLang = draggable.querySelector(".lang").value;
      //         var position = new kakao.maps.LatLng(removeLat, removeLang);
      //         markers.forEach((marker) => {
      //           if (marker["position"].equals(position)) {
      //             var idx = markers.indexOf(marker);
      //             markers.splice(idx, 1);
      //             marker["marker"].setMap(null);
      //             marker["info"].setMap(null);
      //           }
      //         });
      //       }
      // addLinePath();
    },
  },
};
</script>
<style lang="scss">
@import "@/assets/styles/schedule/_likeList.scss";
</style>
