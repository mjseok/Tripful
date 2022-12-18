<template>
  <div>
    <div
      class="drop-zone draggable-container row"
      @drop="onDrop($event, 'before')"
      @dragenter.prevent
      @dragover.prevent
    >
      <div
        v-for="(item, index) in getList('before')"
        :key="item.spot.spotid"
        class="card draggable col"
        style="max-width: 150px"
        draggable="true"
        @dragstart="startDrag($event, item, index)"
      >
        <input type="hidden" class="lat" :value="item.spot.lat" />
        <input type="hidden" class="lang" :value="item.spot.lang" />
        <input type="hidden" class="id" :value="item.spot.spotid" />
        <input type="hidden" class="image" :value="item.spot.image" />
        <input type="hidden" class="title" :value="item.spot.title" />
        <img
          :src="item.spot.image"
          class="card-img-top"
          alt="2"
          style="height: 100px"
        />
        <div class="card-body">
          <p class="card-title">{{ item.spot.title }}</p>
        </div>
        <button
          class="btn btn-danger remove-spot"
          :value="item.spot.spotid"
          display=""
          @click="deleteLike"
        >
          찜 취소
        </button>
      </div>
    </div>
    <div class="row">
      <p class="schedule-container col">나의 스케줄</p>
      <div class="col schedule">
        <button
          class="btn btn-solid-sm"
          id="register-schedule"
          @click="showModal = true"
        >
          스케줄 등록
        </button>
        <modal v-if="showModal" @close="showModal = false">
          <app-modal v-bind:scheduleSpot="getList('after')"></app-modal>
        </modal>
      </div>
    </div>

    <div
      class="drop-zone draggable-container row"
      @drop="onDrop($event, 'after')"
      @dragenter.prevent
      @dragover.prevent
    >
      <div
        v-for="(item, index) in getList('after')"
        :key="item.spot.spotid"
        class="card draggable col"
        style="max-width: 150px"
        draggable="true"
        @dragstart="startDrag($event, item, index)"
      >
        <input type="hidden" class="lat" :value="item.spot.lat" />
        <input type="hidden" class="lang" :value="item.spot.lang" />
        <input type="hidden" class="id" :value="item.spot.spotid" />
        <input type="hidden" class="image" :value="item.spot.image" />
        <input type="hidden" class="title" :value="item.spot.title" />
        <img
          :src="item.spot.image"
          class="card-img-top"
          alt="2"
          style="height: 100px"
        />
        <div class="card-body">
          <p class="card-title">{{ item.spot.title }}</p>
        </div>
        <button
          class="btn btn-danger remove-spot"
          :value="item.spot.spotid"
          display=""
          @click="deleteLike"
        >
          찜 취소
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue"; //onMounted
import api from "@/api/http";
import { mapGetters } from "vuex";
import AppModal from "@/components/common/AppModal";
const userStore = "userStore";
const spotList = ref([]);

export default {
  components: { AppModal },
  data() {
    return { showModal: false };
  },
  computed: {
    ...mapGetters(userStore, ["checkUserInfo"]),
  },
  mounted() {
    let uid = this.checkUserInfo.uid;
    async function getLikedList() {
      // console.log(this.checkUserInfo.uid);
      await api
        .get(`/social/getLikedSpots/${uid}`)
        .then((spots) => {
          // console.log("data 는 : " + data);
          spots.data.forEach((element) => {
            console.log(element);
            spotList.value.push({
              spot: element,
              state: "before",
            });
          });

          // this.selectLikesInfo = data.data;
        })
        .catch((error) => {
          console.log(error);
        });
    }
    getLikedList();
  },
  setup() {
    //id: 0, state: "before"
    // console.log(this.checkUserInfo);

    // console.log(this.checkUserInfo.uid);

    // onMounted(() => {
    //   // console.log(checkUserInfo.uid);
    //   getLikedList();
    // });

    const getList = (state) => {
      return spotList.value.filter((item) => item.state == state);
    };
    const startDrag = (event, item, index) => {
      console.log(item, index);
      event.dataTransfer.dropEffect = "move";
      event.dataTransfer.effectAllowd = "move";
      event.dataTransfer.setData("spotID", item.spot.spotid);
    };
    const onDrop = (event, state) => {
      const spotID = event.dataTransfer.getData("spotID");
      const items = spotList.value.find((item) => item.spot.spotid == spotID);
      items.state = state;
    };
    return {
      getList,
      startDrag,
      onDrop,
    };
  },
  methods: {
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
    },
  },
};
</script>

<style lang="scss">
@import "@/assets/styles/schedule/_likeList.scss";
// .drop-zone {
//   width: 50%;
//   margin: 50px auto;
//   background-color: aliceblue;
//   padding: 10px;
//   min-height: 10px;
// }
.drag-el {
  background-color: palevioletred;
  color: white;
  padding: 5px;
  margin-bottom: 10px;
  max-width: 150px;
}
.drag-el:nth-last-of-type(1) {
  margin-bottom: 0;
}
</style>
