<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/views/include/header.jsp"%>
  </head>
  <body data-bs-spy="scroll" data-bs-target="#navbarExample">
   <script
    type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efa330ac5683d9992020711b21de6185&libraries=services"
  ></script>
  <script
    type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efa330ac5683d9992020711b21de6185"
  ></script>
    <%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <!-- Header -->
<div class="container contents">
      <h2 class="mb-4">지도로 검색하기</h2>

      <div class="input-group mb-4" style="align-items: center">
        <input
          class="form-control border rounded-5"
          name="keyword"
          type="search"
          value=""
          placeholder="원하는 장소를 검색해보세요"
          id="map-search"
          onchange="sendValue()"
        />
        <span class="input-group-append">
          <button
            class="btn btn-outline-secondary bg-white border-start-0 border-top-0 border-end-0 border-bottom-0 border ms-n5 rounded-5"
            type="button"
            id="map-search-button"
          >
            <i class="fa fa-search"></i>
          </button>
        </span>
      </div>
      <div class="mb-4" id="map" style="width: 100%; height: 600px"></div>
      <p class="map-btn position-absolute start-50 translate-middle-x">
        <button class="btn-solid-sm" onclick="hideMarkers()">마커 감추기</button>
        <button class="btn-solid-sm" onclick="showMarkers()">마커 보이기</button>
      </p>
      <script>
        // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
        var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
        var myLat = 37.566826;
        var myLang = 126.9786567;
        var keyword;
        var kewywordBySearch;
        // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
        var markers = [];
        var urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has("lat") && urlParams.has("lang")) {
          myLat = urlParams.get("lat");
          myLang = urlParams.get("lang");
        }
		
        keyword = "${keyword}";

        if (keyword != "") {
          sendValueKeyword(keyword);
        }

        function sendValueKeyword(keyword) {
          // 장소 검색 객체를 생성합니다
          var ps = new kakao.maps.services.Places();
          // 키워드로 장소를 검색합니다
          ps.keywordSearch(keyword, placesSearchCB);
        }

        function sendValue() {
          kewywordBySearch = document.getElementById("map-search").value;
          // 장소 검색 객체를 생성합니다
          var ps = new kakao.maps.services.Places();
          // 키워드로 장소를 검색합니다
          ps.keywordSearch(kewywordBySearch, placesSearchCB);
        }

        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(myLat, myLang), // 지도의 중심좌표
            level: 3, // 지도의 확대 레벨
          };

        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 마커가 표시될 위치입니다
        var markerPosition = new kakao.maps.LatLng(myLat, myLang);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
          position: markerPosition,
        });
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        // 생성된 마커를 배열에 추가합니다
        markers.push(marker);
        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
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
        }

        // 지도에 마커를 표시하는 함수입니다
        function displayMarker(place) {
          // 마커를 생성하고 지도에 표시합니다
          var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x),
          });
          // 마커가 지도 위에 표시되도록 설정합니다
          marker.setMap(map);

          // 생성된 마커를 배열에 추가합니다
          markers.push(marker);
          // 마커에 클릭이벤트를 등록합니다
          kakao.maps.event.addListener(marker, "click", function () {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            infowindow.setContent(
              '<div style="padding:5px;font-size:12px;">' + place.place_name + "</div>"
            );
            infowindow.open(map, marker);
          });
        }
        // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
        function setMarkers(map) {
          for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
          }
        }

        // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
        function showMarkers() {
          setMarkers(map);
        }

        // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
        function hideMarkers() {
          setMarkers(null);
        }

        let navs = document.querySelectorAll(".nav-link");
        navs[1].classList.add("active");
      </script>
    </div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>