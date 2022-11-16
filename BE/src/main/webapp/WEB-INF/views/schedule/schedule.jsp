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
		<h2 class="mb-4">여행 스케줄</h2>

		<div class="mb-4" id="map" style="width: 100%; height: 500px"></div>

		<div class="mb-4 col-4" id="likeList" style="width: 100%;"></div>
		<em>원하는 순서대로 장소를 옮겨보세요!</em><br /> <em style="font-size: smaller">최대
			8개까지 등록 가능합니다.</em>
		<p class="schedule-container" >내가 찜한 장소</p>
		<div class="draggable-container row" id="before-schedule"></div>
		<div class="row"><p class="schedule-container col">나의 스케줄</p>
			<div class="col schedule"><button class="btn btn-solid-sm" id="register-schedule"  data-bs-toggle="modal" data-bs-target="#staticBackdrop">스케줄 등록</button></div></div>
					<!-- Details Modal -->
		<div id="staticBackdrop" class="modal fade" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog modal-schedule">
				<div class="modal-content content-sm">
					<div class="row">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" id="btn-close-form"></button>
						<!-- end of col -->
						<div class="container">
							<h3>나의 스케줄</h3>
							<div class="row">
								<p class="col-8"></p>
								<p class="col-4">작성자: ${user.name}</p>
							</div>
							
							<form method="POST" id="register-form">
								<div class="row">
								<div class="col-10">
								제목 :
								<input type="text" id="title" name="title" style="width:90%" />
								</div>
								<div class="col">
								<select class="form-select" form="register-form" name="theme">
								    <option value="food">먹방</option>
								    <option value="activity">액티비티</option>
								    <option value="healing">힐링</option>
								  </select>
								</div>
								</div> 
								<div class="module-spots row"></div>
					</form>
							<button type="button" class="btn-solid-sm p-4" id="btn-register">등록하기</button>
						</div>
						<!-- end of col -->
					</div>
					<!-- end of row -->
				</div>
				<!-- end of modal-content -->
			</div>
			<!-- end of modal-dialog -->
		</div>
			
		<div class="draggable-container row" id="after-schedule"></div>
		
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
	makeList(${likedSpots});
	makeMap(${likedSpots});
	if (document.querySelectorAll("#after-schedule > .card").length == 0) {
		  document.querySelector("#register-schedule").disabled = true;
		} else {
		  document.querySelector("#register-schedule").disabled = false;
		}


		function makeList(likedSpot) {
		  let opt = ``;
		  likedSpot.forEach((spot) => {
		    opt += `
					<div class="card draggable col" draggable="true"
						style="max-width: 150px;">
						<input type="hidden" class="lat" value="\${spot.lat}">
						<input type="hidden" class="lang" value="\${spot.lang}">
						<input type="hidden" class="id" value="\${spot.spotid}">
						<input type="hidden" class="image" value="\${spot.image}">
						<input type="hidden" class="title" value="\${spot.title}">
						<img src="\${spot.image}" class="card-img-top" alt="2" style="height:100px;" onerror="this.src='${root}/assets/img/noImg.jpg'"/>
						<div class="card-body">
							<p class="card-title">\${spot.title}</p>
						</div>
							<button class="btn btn-danger remove-spot" value="\${spot.spotid}" display="">찜 취소</button>
					</div>
					`;
		  });
		  document.querySelector("#before-schedule").innerHTML += opt;
		  const draggables = document.querySelectorAll(".draggable");
		  const containers = document.querySelectorAll(".draggable-container");
		  var status;
		  draggables.forEach((draggable) => {
		    draggable.addEventListener("dragstart", () => {
		      draggable.classList.add("dragging");
		      status = draggable.parentNode.id;
		      if (document.querySelectorAll("#after-schedule > .card").length == 0) {
		        document.querySelector("#register-schedule").disabled = true;
		      } else {
		        document.querySelector("#register-schedule").disabled = false;
		      }
		    });

		    draggable.addEventListener("dragend", () => {
		      if (document.querySelectorAll("#after-schedule > .card").length == 0) {
		        document.querySelector("#register-schedule").disabled = true;
		      } else {
		        document.querySelector("#register-schedule").disabled = false;
		      }
		      draggable.classList.remove("dragging");
		      if (draggable.parentNode.id == "after-schedule" && status != "after-schedule") {
		        var addLat = draggable.querySelector(".lat").value;
		        var addLang = draggable.querySelector(".lang").value;
		        var title = draggable.querySelector(".card-title").innerText;
		        var addPosition = new kakao.maps.LatLng(addLat, addLang);
		        addMarker(addPosition, title);
		        addLinePath();
		      }
		      if (draggable.parentNode.id == "before-schedule" && status != "before-schedule") {
		        var removeLat = draggable.querySelector(".lat").value;
		        var removeLang = draggable.querySelector(".lang").value;
		        var position = new kakao.maps.LatLng(removeLat, removeLang);
		        markers.forEach((marker) => {
		          if (marker["position"].equals(position)) {
		            var idx = markers.indexOf(marker);
		            markers.splice(idx, 1);
		            marker["marker"].setMap(null);
		            marker["info"].setMap(null);
		          }
		        });
		      }
		      addLinePath();
		    });
		  });

		  containers.forEach((container) => {
		    container.addEventListener("dragover", (e) => {
		      e.preventDefault();
		      const afterElement = getDragAfterElement(container, e.clientX);
		      const draggable = document.querySelector(".dragging");
		      if (afterElement === undefined) {
		        container.appendChild(draggable);
		      } else {
		        container.insertBefore(draggable, afterElement);
		      }
		    });
		  });

		  function getDragAfterElement(container, x) {
		    const draggableElements = [...container.querySelectorAll(".draggable:not(.dragging)")];

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
		  }
		  document.querySelectorAll(".remove-spot").forEach((button) => {
		    button.addEventListener("click", () => {
		      button.parentNode.remove();
		      fetch(`${root}/social/deleteLikeSpot/\${button.value}`)
		        .then((response) => response.text())
		        .then((data) => {
		          if (data == 1) {
		            alert("해당 관광지가 찜 목록에서 제거 되었습니다.");
		            checkLiked();
		          }
		        });
		    });
		  });
		}
		var mapContainer;
		var map;
		var markers;
		var linePath;
		var polylines;
		var distanceOverlay;
		function makeMap(likedSpot) {
		  (mapContainer = document.getElementById("map")), // 지도를 표시할 div
		    (mapOption = {
		      center: new kakao.maps.LatLng(37.5852, 126.9769), // 지도의 중심좌표
		      level: 10, // 지도의 확대 레벨
		    });

		  map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		  // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		  markers = [];
		  polylines = [];
		}
		function addLinePath() {
		  polylines.forEach((line) => {
		    line.setMap(null);
		  });
		  if (distanceOverlay) {
		    distanceOverlay.setMap(null);
		    distanceOverlay = null;
		  }
		  linePath = [];
		  document.querySelectorAll("#after-schedule .card").forEach((schedule) => {
		    var lineLat = schedule.querySelector(".lat").value;
		    var lineLang = schedule.querySelector(".lang").value;
		    linePath.push(new kakao.maps.LatLng(lineLat, lineLang));
		  });
		  // 지도에 표시할 선을 생성합니다
		  var polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 7, // 선의 두께 입니다
		    strokeColor: "#6168ff", // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: "solid", // 선의 스타일입니다
		  });
		  polyline.setMap(map);
		  polylines.push(polyline);
		  if (linePath.length > 1) {
		    var distance = Math.round(polyline.getLength()),
		      content = getTimeHTML(distance);
		    showDistance(content, linePath[linePath.length - 1]);
		  }
		}

		// 마커에 마우스오버 이벤트를 등록합니다

		// 마커를 생성하고 지도위에 표시하는 함수입니다
		function addMarker(position, title) {
		  //선 좌표 배열

		  // 마커를 생성합니다
		  var marker = new kakao.maps.Marker({
		    position: position,
		  });
		  map.setCenter(position);
		  var content = `<div class ="label"><span class="left"></span><span class="center">\${title}</span><span class="right"></span></div>`;

		  var customOverlay = new kakao.maps.CustomOverlay({
		    position: position,
		    content: content,
		  });

		  customOverlay.setMap(map);

		  // 마커가 지도 위에 표시되도록 설정합니다
		  marker.setMap(map);

		  markers.push({ position: position, marker: marker, info: customOverlay });
		}

		var schedulespots = [];
		document.querySelector("#register-schedule").addEventListener("click", function () {
		  schedulespots = [];
		  let opt = ``;

		  document.querySelectorAll("#after-schedule > .card").forEach((spot) => {
		    let id = spot.querySelector(".id").value;
		    let title = spot.querySelector(".title").value;
		    let img = spot.querySelector(".image").value;
		    schedulespots.push(id);
		    opt += `<div class="card col" style="max-width: 150px; margin:0px 3px;">
							<input type="hidden" class="id" value="\${id}" name="id">
							<img src="\${img}" class="card-img-top" alt="2" style="height:100px;"/>
							<div class="card-body">
								<p class="card-title">\${title}</p>
							</div>
						</div>`;
		  });
		  opt += `<input type="hidden" name="schedulespots" value=\${schedulespots}>`;
		  document.querySelector(".module-spots").innerHTML = opt;
		});
		document.querySelector("#btn-register").addEventListener("click", function () {
		  //등록하기
		  if (!document.querySelector("#title").value) {
		    alert("스케줄 제목을 입력해주세요!!!");
		    return;
		  } else {
		    let form = document.querySelector("#register-form");
		    form.setAttribute("action", "${root}/schedule/register");
		    form.submit();
		    alert("스케줄 등록완료!");
		  }
		});

		let navs = document.querySelectorAll(".nav-link");
		navs[2].classList.add("active");
		// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {
		  // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		  var walkkTime = (distance / 67) | 0;
		  var walkHour = "",
		    walkMin = "";

		  // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		  if (walkkTime > 60) {
		    walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + "</span>시간 ";
		  }
		  walkMin = '<span class="number">' + (walkkTime % 60) + "</span>분";
		  //자동차 평균 시속 24km/h(https://data.si.re.kr/data/%EC%84%9C%EC%9A%B8%EA%B3%BC-%EC%84%B8%EA%B3%84%EB%8C%80%EB%8F%84%EC%8B%9C/50)
		  // 자동차 평균 시속은 24km/h 이고 이것을 기준으로 자동차 분속은 400m/min입니다
		  var carTime = (distance / 400) | 0;
		  var carHour = "",
		    carMin = "";

		  // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		  if (carTime > 60) {
		    carHour = '<span class="number">' + Math.floor(carTime / 60) + "</span>시간 ";
		  }
		  carMin = '<span class="number">' + (carTime % 60) + "</span>분";

		  // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		  var content = '<ul class="dotOverlay distanceInfo">';
		  content += "    <li>";
		  content +=
		    '        <span class="label">총거리</span><span class="number">' +
		    (distance / 1000).toFixed(2) +
		    "</span>km";
		  content += "    </li>";
		  content += "    <li>";
		  content += '        <span class="label">도보</span>' + walkHour + walkMin;
		  content += "    </li>";
		  content += "    <li>";
		  content += '        <span class="label">자동차</span>' + carHour + carMin;
		  content += "    </li>";
		  content += "</ul>";

		  return content;
		}
		function showDistance(content, position) {
		  // 커스텀 오버레이를 생성하고 지도에 표시합니다
		  distanceOverlay = new kakao.maps.CustomOverlay({
		    map: map, // 커스텀오버레이를 표시할 지도입니다
		    content: content, // 커스텀오버레이에 표시할 내용입니다
		    position: position, // 커스텀오버레이를 표시할 위치입니다.
		    xAnchor: 0,
		    yAnchor: 0,
		    zIndex: 3,
		  });
		}

	</script>
	
</html>