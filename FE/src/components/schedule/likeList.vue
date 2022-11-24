<template>
  <div>
    <p class="schedule-container">내가 찜한 장소</p>
    <b-container
      v-if="likes && likes.length != 0"
      class="draggable-container row"
      id="before-schedule"
      @dragover="dragOver"
    >
      <like-item v-for="(like, index) in likes" :key="index" :like="like" />
    </b-container>
    <b-container v-else class="draggable-container row" id="before-schedule">
      찜하기 정보가 없습니다.
    </b-container>

    <!-- end of grid -->
    <!-- end of filter -->
  </div>
</template>

<script>
import LikeItem from "@/components/schedule/likeListItem";
import api from "@/api/http";
import { mapGetters, mapState, mapActions } from "vuex";
const userStore = "userStore";
export default {
  name: "LikeList",
  components: { LikeItem },
  data() {
    return {};
  },
  mounted() {
    console.log(this.checkUserInfo.uid);
    api
      .get(`/social/getLikedSpots/${this.checkUserInfo.uid}`)
      .then((data) => {
        console.log("data 는 : " + JSON.stringify(data));
        this.userLikesInit(data.data);
        // this.selectLikesInfo = data.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  computed: {
    ...mapState(userStore, ["userInfo", "likes"]),
    ...mapGetters(userStore, ["checkUserInfo", "selectLikesInfo"]),
  },
  methods: {
    ...mapActions(userStore, ["userLikesInit"]),
    getDragAfterElement(container, x) {
      const draggableElements = [
        ...container.querySelectorAll(".draggable:not(.dragging)"),
      ];
      return draggableElements.reduce(
        (closest, child) => {
          const box = child.getBoundingClientRect();
          const offset = x - box.left - box.width / 2;
          if (offset < 0 && offset > closest.offset) {
            return { offset: offset, element: child };
          } else {
            return closest;
          }
        },
        { offset: Number.NEGATIVE_INFINITY }
      ).element;
    },
    dragOver(e, container) {
      const afterElement = this.getDragAfterElement(container, e.clientX);
      const draggable = document.querySelector(".dragging");
      if (afterElement === undefined) {
        container.appendChild(draggable);
      } else {
        container.insertBefore(draggable, afterElement);
      }
    },
  },
};
</script>

<style lang="scss">
@import "@/assets/styles/schedule/_likeList.scss";
</style>
