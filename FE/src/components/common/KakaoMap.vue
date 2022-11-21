<template>
  <div>
    <div id="map"></div>
  </div>
</template>

<script>
import { mapState } from "vuex";

const locationStore = "locationStore";
const mapStore = "mapStore";

var markers = [];
var infowindow = null;
var infowindows = [];

export default {
  name: "KakaoMap",
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src = `//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=${process.env.VUE_APP_KAKAOAPI}&libraries=services,clusterer,drawing`;
      document.head.appendChild(script);
    }
  },
  data() {
    return {};
  },
  computed: {
    ...mapState(locationStore, ["location", "locations"]),
    ...mapState(mapStore, ["keyword"]),
  },
  watch: {
    location(a, b) {
      console.log(a, b);
      this.displayInfoWindow();
    },
    locations(a, b) {
      console.log(a, b);
      this.displayMarker();
    },
    keyword(a, b) {
      this.removeMarker();
      removeInfoWindow();

      console.log(a, b);

      // 키워드로 장소를 검색합니다
      this.ps.keywordSearch(this.keyword, placesSearchCB);
      // function내에서 this 사용이 안되서 밖에서 따로 빼줌...
      let map = this.map;
      // 키워드 검색 완료 시 호출되는 콜백함수 입니다.
      function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
          // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
          // LatLngBounds 객체에 좌표를 추가합니다
          var bounds = new kakao.maps.LatLngBounds();
          for (var i = 0; i < data.length; i++) {
            displayMarker(data[i]);
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
          }
          // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
          map.setBounds(bounds);
        }
        console.log("pagination" + pagination);
      }
      function removeInfoWindow() {
        if (infowindow && infowindow.getMap()) {
          //이미 생성한 인포윈도우가 있기 때문에 지도 중심좌표를 인포윈도우 좌표로 이동시킨다.
          // this.map.setCenter(infowindow.getPosition());
          // return;
          console.log(infowindow);
          // 이미 생성한 인포윈도우 닫기

          console.log("infoWindow 삭제");
        }
        for (var i = 0; i < infowindows.length; i++) {
          infowindows[i].close();
        }
      }
      // 지도에 마커를 표시하는 함수입니다
      function displayMarker(place) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(place.y, place.x),
        });
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        markers.push(marker);

        var iwContent = `<div style="padding:3px;">${place.place_name} <br><a href="https://map.kakao.com/link/map/${place.place_name},${place.y},${place.x}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${place.place_name},${place.y},${place.x}" style="color:blue" target="_blank">길찾기</a></div>`, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
          iwPosition = new kakao.maps.LatLng(place.y, place.x); //인포윈도우 표시 위치입니다

        // 인포윈도우를 생성합니다
        infowindow = new kakao.maps.InfoWindow({
          position: iwPosition,
          content: iwContent,
        });

        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
        infowindow.open(map, marker);
        infowindows.push(infowindow);
      }
    }, //----------------------------------------------------------------------------------------------------------------------------------------------
  },
  methods: {
    initMap() {
      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(37.573898277022, 126.9731314753),
        level: 5,
      };

      //지도 객체를 등록합니다.
      //지도 객체는 반응형 관리 대상이 아니므로 initMap에서 선언합니다.
      this.map = new kakao.maps.Map(container, options);

      // 장소 검색 객체를 생성합니다
      this.ps = new kakao.maps.services.Places();
    },
    displayMarker() {
      this.removeMarker();

      const positions = this.locations.map(
        (position) => new kakao.maps.LatLng(position.lat, position.lang)
      );

      console.log(positions);
      if (positions.length > 0) {
        markers = positions.map(
          (position) =>
            new kakao.maps.Marker({
              map: this.map,
              position,
            })
        );

        const bounds = positions.reduce(
          (bounds, latlng) => bounds.extend(latlng),
          new kakao.maps.LatLngBounds()
        );

        this.map.setBounds(bounds);
      }
    },
    displayInfoWindow() {
      this.removeInfoWindow();

      var iwContent = `<div style="padding:5px;">${this.location.title}</div>`, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

      if (this.location != null) {
        iwPosition = new kakao.maps.LatLng(
          this.location.lat,
          this.location.lang
        );
      }
      infowindow = new kakao.maps.InfoWindow({
        map: this.map, // 인포윈도우가 표시될 지도
        position: iwPosition,
        content: iwContent,
        removable: iwRemoveable,
      });

      this.map.setCenter(iwPosition);
    },
    removeMarker() {
      if (markers.length > 0) {
        markers.forEach((marker) => {
          marker.setMap(null);
        });
      }
    },
    removeInfoWindow() {
      if (infowindow && infowindow.getMap()) {
        //이미 생성한 인포윈도우가 있기 때문에 지도 중심좌표를 인포윈도우 좌표로 이동시킨다.
        // this.map.setCenter(infowindow.getPosition());
        // return;
        console.log(infowindow);
        // 이미 생성한 인포윈도우 닫기
        infowindow.close();
        console.log("infoWindow 삭제");
      }
    },
  },
};
</script>

<style>
#map {
  width: 80%;
  height: 700px;
  display: center;
  left: 10%;
}
</style>
