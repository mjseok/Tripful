import api from "./http";

function beforeSchedule() {
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
  }
export { beforeSchedule };
