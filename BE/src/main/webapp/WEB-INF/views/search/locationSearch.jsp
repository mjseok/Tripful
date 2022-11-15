<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/views/include/header.jsp"%>
  </head>
  <body data-bs-spy="scroll" data-bs-target="#navbarExample">
    <%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <!-- Header -->

    <div class="container" style="min-height: 800px; min-width: 1400px !important">
      <div style="height: 70px"></div>
      <h2 class="text-center mt-5 mb-3">지역별 관광지 조회</h2>
      <div class="row col-md-12 justify-content-center mb-2">
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="sido">
            <option value="">시도선택</option>
            <c:forEach var="sido" items="${sidos}">
              <option value="${sido.sidoid}">${sido.name}</option>
            </c:forEach>
          </select>
        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="gugun">
            <option value="">구군선택</option>
            <!-- 
					<c:forEach var="gugun" items="${guguns}">
						<option value="${gugun}">${gugun}</option>
					</c:forEach>
					 -->
          </select>
        </div>
        <div class="form-group col-md-2">
          <button type="button" id="list-btn" class="btn btn-solid-lg">조회하기</button>
        </div>
        <div class="form-group col-md-12 text-center">
          <span>지금 가고 싶은 여행지를 선택해주세요</span>
        </div>
      </div>
      <div class="row filter" style="padding-top: 40px">
        <div class="col-lg-12">
          <!-- Filter -->
          <div
            class="button-group filters-button-group"
            id="filters-button-group"
            style="display: none"
          >
            <button id="btn-select-all" class="button is-checked" data-filter="*">전체</button>
            <button id="btn-select-hotspot" class="button" data-filter=".hotspot">관광지</button>
            <button class="button" data-filter=".culture">문화시설</button>
            <button class="button" data-filter=".festival">행사/공연</button>
            <button class="button" data-filter=".course">여행코스</button>
            <button class="button" data-filter=".sports">레포츠</button>
            <button class="button" data-filter=".hotel">숙박</button>
            <button class="button" data-filter=".shopping">쇼핑</button>
            <button class="button" data-filter=".food">음식점</button>
          </div>
          <!-- end of button group -->
          <div class="grid" id="element-grid"></div>
          <!-- end of grid -->
          <!-- end of filter -->
        </div>
        <!-- end of col -->
      </div>
      <!-- end of row -->
    </div>
    <div class="row" id="pagination-div" style="display: none">
      <ul class="pagination justify-content-center" id="pagination-contents">
        <li class="page-item"><a class="page-link" href="#">이전</a></li>
        <li class="page-item active first-item"><a class="page-link page-num" href="#">1</a></li>
        <li class="page-item"><a class="page-link page-num" href="#">2</a></li>
        <li class="page-item"><a class="page-link page-num" href="#">3</a></li>
        <li class="page-item"><a class="page-link page-num" href="#">4</a></li>
        <li class="page-item"><a class="page-link page-num" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">다음</a></li>
      </ul>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    <script>
      let categories = {
        12: "hotspot",
        14: "culture",
        15: "festival",
        25: "course",
        28: "sports",
        32: "hotel",
        38: "shopping",
        39: "food",
      };
      let sidoid;
      document.querySelector("#sido").addEventListener("change", function () {
        sidoid = this[this.selectedIndex].value;
        console.log("정상"+sidoid);
        fetch("${root}/spot/gugunList/"+sidoid)
          .then((response) => response.json())
          .then((data) => {
            let options = `<option value="">구군선택</option>`;
            data.guguns.forEach((data) => {
              options += `
              <option value=\${data.gugunid}>\${data.name}</option>
              	    		`;
            });
            document.querySelector("#gugun").innerHTML = options;
          });
      });
      //gugun,sido,pageno
      document.querySelector("#list-btn").addEventListener("click", function () {
        document.querySelector("#filters-button-group").style.display = "";
        document.querySelector("#pagination-div").style.display = "";
        let gugunid = document.querySelector("#gugun").selectedIndex;
        let pageno = 0;
        document.querySelectorAll(".page-item").forEach((data) => {
          if (data.classList[1] == "active") {
            pageno = data.innerText;
          }
        });
        let url = `${root}/spot/list/\${sidoid}/\${gugunid}/\${pageno}`;

        fetch(url)
          .then((response) => response.json())
          .then((data) => {
        	console.log("data122 : "+JSON.stringify(data));
            let opt = ``;
            data.spots.forEach((data) => {
            	console.log("data title : "+data.title);
              let theme = categories[data.theme];
              opt += `
              <div class="element-item \${theme}">
              <a href="${root}/spot/detail/\${data.spotid}" class="spot-detail link-dark" style="text-decoration: none" data-lat="${data.lat}" data-lang="${data.lang}" data-spotid="${spotid}">
                  <img src="\${data.image}"  onerror="this.src='${root}/assets/img/noImg.jpg'" height=200px width=351px/>
                  <p>
                    <strong>\${data.title}</strong><br />\${data.address}
                  </p>
               </a>
              </div>
                `;
            });

            document.querySelector("#element-grid").innerHTML = opt;
            const gridCheck = document.querySelector(".grid");

            if (gridCheck !== null) {
              // init Isotope
              var iso = new Isotope(".grid", {
                itemSelector: ".element-item",
                layoutMode: "fitRows",
              });

              // bind filter button click
              var filtersElem = document.querySelector(".filters-button-group");
              filtersElem.addEventListener("click", function (event) {
                // only work with buttons
                if (!matchesSelector(event.target, "button")) {
                  return;
                }
                var filterValue = event.target.getAttribute("data-filter");
                // use matching filter function
                iso.arrange({ filter: filterValue });
              });

              // change is-checked class on buttons
              var buttonGroups = document.querySelectorAll(".button-group");
              for (var i = 0, len = buttonGroups.length; i < len; i++) {
                var buttonGroup = buttonGroups[i];
                radioButtonGroup(buttonGroup);
              }

              function radioButtonGroup(buttonGroup) {
                buttonGroup.addEventListener("click", function (event) {
                  // only work with buttons
                  if (!matchesSelector(event.target, "button")) {
                    return;
                  }
                  buttonGroup.querySelector(".is-checked").classList.remove("is-checked");
                  event.target.classList.add("is-checked");
                });
              }
            }
          });
      });
      function getSpots(sidoid, gugunid, pageno) {
        let url = `${root}/spot/list/\${sidoid}/\${gugunid}/\${pageno}`;
        fetch(url)
          .then((response) => response.json())
          .then((data) => {
            let opt = ``;
            data.spots.forEach((data) => {
              console.log("Data2 : "+data);
              let theme = categories[data.theme];
              opt += `
                  <div class="element-item \${theme}">
                  <a href="${root}/spot/detail/\${data.spotid}" class="spot-detail link-dark" style="text-decoration: none" data-lat="${data.lat}" data-lang="${data.lang}" data-spotid="${spotid}">
                      <img src="\${data.image}"  onerror="this.src='${root}/assets/img/noImg.jpg'" height=200px width=351px/>
                      <p>
                        <strong>\${data.title}</strong><br />\${data.address}
                      </p>
                   </a>
                  </div>

                    `;
            });
            document.querySelector("#element-grid").innerHTML = opt;

            const gridCheck = document.querySelector(".grid");

            if (gridCheck !== null) {
              // init Isotope
              var iso = new Isotope(".grid", {
                itemSelector: ".element-item",
                layoutMode: "fitRows",
              });

              // bind filter button click
              var filtersElem = document.querySelector(".filters-button-group");
              filtersElem.addEventListener("click", function (event) {
                // only work with buttons
                if (!matchesSelector(event.target, "button")) {
                  return;
                }
                var filterValue = event.target.getAttribute("data-filter");
                // use matching filter function
                iso.arrange({ filter: filterValue });
              });

              // change is-checked class on buttons
              var buttonGroups = document.querySelectorAll(".button-group");
              for (var i = 0, len = buttonGroups.length; i < len; i++) {
                var buttonGroup = buttonGroups[i];
                radioButtonGroup(buttonGroup);
              }

              function radioButtonGroup(buttonGroup) {
                buttonGroup.addEventListener("click", function (event) {
                  // only work with buttons
                  if (!matchesSelector(event.target, "button")) {
                    return;
                  }
                  buttonGroup.querySelector(".is-checked").classList.remove("is-checked");
                  event.target.classList.add("is-checked");
                });
              }
            }
          });
      }

      let pageItems = document.querySelectorAll(".page-item");
      pageItems.forEach((pageItem) => {
        pageItem.addEventListener("click", function () {
          //누르면
          pageItems.forEach((activedData) => {
            activedData.classList.remove("active");
          });
          pageItem.classList.add("active");

          let sidoid = document.querySelector("#sido").selectedIndex;
          let gugunid = document.querySelector("#gugun").selectedIndex;
          var pageno = pageItem.innerText;
          if (pageno == "다음") {
            pageno = document.querySelector(".first-item").innerText;
            if (pageno != `${(spotNum / 12) % 5}`) {
              pageno = pageno * 1 + 5;
           
            getSpots(sidoid, gugunid, pageno);
            document.querySelectorAll(".page-num").forEach((contents) => {
              contents.innerText = contents.innerText * 1 + 5;
            });
            pageItems.forEach((activedData) => {
              activedData.classList.remove("active");
            });
            document.querySelector(".first-item").classList.add("active");
            } else {
                alert("다음 페이지 없음");
                pageItems.forEach((activedData) => {
                    activedData.classList.remove("active");
                  });
                  document.querySelector(".first-item").classList.add("active");
              }
          }
          if (pageno == "이전") {
            pageno = document.querySelector(".first-item").innerText;
            if (pageno != 1) {
            	pageno = pageno * 1 - 5;
            	 getSpots(sidoid, gugunid, pageno);
                 document.querySelectorAll(".page-num").forEach((contents) => {
                   contents.innerText = contents.innerText * 1 - 5;
                 });
                 pageItems.forEach((activedData) => {
                   activedData.classList.remove("active");
                 });
                 document.querySelector(".first-item").classList.add("active");
            }
            else {
            	alert("이전 페이지 없음");
            	 pageItems.forEach((activedData) => {
                     activedData.classList.remove("active");
                   });
                   document.querySelector(".first-item").classList.add("active");
            }
          }

          getSpots(sidoid, gugunid, pageno);
        });
      });

      let navs = document.querySelectorAll(".nav-link");
      navs[1].classList.add("active");
    </script>
  </body>
</html>
