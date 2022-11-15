<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/views/include/header.jsp"%>
    <c:set var="now" value="<%=new java.util.Date()%>" />
    <c:set var="today">
      <fmt:formatDate value="${now}" pattern="yyyy.MM.dd" />
    </c:set>
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
      <h2 class="mb-5">${spotDetail.title}</h2>
      <div class="row">
        <div class="col-6">
          <img
            src="${spotDetail.image}"
            onerror="this.src='${root}/assets/img/noImg.jpg'"
            style="width: 100%"
          />
        </div>
        <div class="mb-4 col-6 d-flex align-items-center" id="info">
          <p class="text-start" style="color: black">
            ☎ TEL : ${spotDetail.tel}<br />
            <i class="bi bi-building"></i> ADDRESS : ${spotDetail.address}<br />
            <br />
            <i class="bi bi-info-circle-fill"></i> Details<br />
            ${spotDetail.desc}
          </p>
        </div>
      </div>
      <c:if test="${!empty user}">
        <p class="map-btn mt-4 mb-4">
          <button class="btn-solid-sm-point" id="btn-like-spot">
            <i class="bi bi-suit-heart-fill" style="color: inherit"></i>
            &nbsp; 찜 추가하기
          </button>
          <button class="btn-solid-sm-point" style="display: none" id="btn-unlike-spot">
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
      </c:if>
      <div class="mb-4 mt-4 col" id="map" style="width: 100%; height: 400px"></div>
    </div>

    <div id="writeReview" class="modal fade" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content content-sm">
          <div class="row">
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
              id="btn-close-review"
            ></button>
            <!-- end of col -->
            <div class="container" id="review-add">
              <h3>리뷰 작성하기</h3>
              <form method="POST" id="write-review-form">
                <div class="row sharing-row">
                  작성자: <span class="col-1" id="author">${user.name}</span> &ensp; 날짜:
                  <span class="col-2" id="write-date">${today}</span>
                </div>
                <input type="hidden" name="spotid" id="write-spotid" value="${spotDetail.spotid}" />
                <div class="stars w-40 mb-3">
                  <input class="star star-5" id="star-5" type="radio" name="star" value="5" />
                  <label class="star star-5" for="star-5"></label>
                  <input class="star star-4" id="star-4" type="radio" name="star" value="4" />
                  <label class="star star-4" for="star-4"></label>
                  <input class="star star-3" id="star-3" type="radio" name="star" value="3" />
                  <label class="star star-3" for="star-3"></label>
                  <input class="star star-2" id="star-2" type="radio" name="star" value="2" />
                  <label class="star star-2" for="star-2"></label>
                  <input class="star star-1" id="star-1" type="radio" name="star" value="1" />
                  <label class="star star-1" for="star-1"></label>
                </div>
                <div class="row review_detail">
                  <textarea
                    class="form-control"
                    style="width: 100%; min-height: 250px"
                    id="write-review-content"
                    name="content"
                    placeholder="여행지에 대한 리뷰를 자유롭게 남겨주세요."
                  ></textarea>
                </div>
                <div class="row mt-4">
                  <div class="col-3"></div>
                  <div class="col-6">
                    <button type="submit" class="btn-outline-sm p-4 me-2" id="btn-write">
                      작성하기
                    </button>
                  </div>
                </div>
              </form>
            </div>
            <!-- end of col -->
          </div>
          <!-- end of row -->
        </div>
        <!-- end of modal-content -->
      </div>
      <!-- end of modal-dialog -->
    </div>
    <script>
       	<c:if test="${!empty user}">
        	window.onload = function(){
          		checkLiked();
          	}

          	function checkLiked(){
           	fetch("${root}/social/checkLikeSpot/"+${spotDetail.spotid})
      		.then(response => response.text())
      		.then(data => {
      			if(data == 0){
      				document.querySelector("#btn-like-spot").style.display = "";
      				document.querySelector("#btn-unlike-spot").style.display = "none";
      			}else{
      				document.querySelector("#btn-like-spot").style.display = "none";
      				document.querySelector("#btn-unlike-spot").style.display = "";
      			}
      		})
          	}

          	document.querySelector("#btn-like-spot").addEventListener("click", function(){
          		fetch("${root}/social/addLikeSpot/"+${spotDetail.spotid})
      		.then(response => response.text())
      		.then(data => {
      			if(data == 1){
      				alert("해당 관광지가 찜 목록에 추가 되었습니다.");
      		      	checkLiked();
      			}
      		})
          	});

          	document.querySelector("#btn-unlike-spot").addEventListener("click", function(){
          		fetch("${root}/social/deleteLikeSpot/"+${spotDetail.spotid})
      		.then(response => response.text())
      		.then(data => {
      			if(data == 1){
      				alert("해당 관광지가 찜 목록에서 제거 되었습니다.");
      		      	checkLiked();
      			}
      		})
          	});

	      document.querySelector("#btn-close-review").addEventListener("click", function() {
	      			document.querySelector("#write-review-form").reset();
	      		});
	
	      document.querySelector("#btn-write").addEventListener("click", function() {
				  	bootstrap.Modal.getInstance("#writeReview").hide();
	      		});
	      
	      document.querySelector("#write-review-form").addEventListener("submit", function(e){
			  e.preventDefault();
			  
			  let spotid = document.querySelector("#write-spotid").value;
			  let score = document.querySelector("input[name='star']:checked").value;
			  let content = document.querySelector("#write-review-content").value;
			  
			  fetch("${root}/social/addReview", {
					  method: 'POST',
					  headers: {'Content-type': 'application/x-www-form-urlencoded'},
					  body: 'spotid='+spotid+'&score='+score+'&content='+content
					  })
				.then(response => response.text())
				.then(data => {
					if (data == 1) {
						alert("리뷰가 작성 되었습니다!!");
					}
				})
			  });
       	</c:if>

           //lat lang디비에 바뀌어서 저장되어있는듯
           var myLat = ${spotDetail.lat};
           var myLang = ${spotDetail.lang};

           // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
           var markers = [];


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
           

           let navs = document.querySelectorAll(".nav-link");
           navs[1].classList.add("active");
    </script>
  </body>
  <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</html>
