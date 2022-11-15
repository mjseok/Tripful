<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
 	 <%@ include file="/WEB-INF/views/include/header.jsp"%> 
  </head>
  <body data-bs-spy="scroll" data-bs-target="#navbarExample">
  <%@ include file="/WEB-INF/views/include/nav.jsp"%>
    <!-- Header -->
    <header id="header" class="header">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-xl-5">
            <div class="text-container">
              <div class="section-title">모든 여행의 시작</div>
              <h1 class="h1-large">우린, 지금 여행중</h1>
              <p class="p-large">내가 찾은 한국, 너가 찾은 한국, 우리가 찾은 한국</p>
              <div class="input-group" style="align-items: center">
                <form
                  style="width: 100%; display: flex; align-items: center"
                  id="header-search-form"
                >
                  <input
                    class="form-control border rounded-5"
                    type="search"
                    value=""
                    id="header-search"
                    name="keyword"
                    placeholder="어디로 떠나고 싶으신가요?"
                  />
                  <span class="input-group-append">
                    <button
                      class="btn btn-outline-secondary bg-white border-start-0 border-top-0 border-end-0 border-bottom-0 border ms-n5 rounded-5"
                      type="submit"
                      id="header-search-button"
                      form="header-search-form"
                    >
                      <i class="fa fa-search"></i>
                    </button>
                  </span>
                </form>
              </div>
            </div>
            <!-- end of text-container -->
          </div>
          <!-- end of col -->
          <div class="col-lg-6 col-xl-7">
            <div class="image-container">
              <img class="img-fluid" src="${root}/assets/img/header-image.png" alt="alternative" />
            </div>
            <!-- end of image-container -->
          </div>
          <!-- end of col -->
        </div>
        <!-- end of row -->
      </div>
      <!-- end of container -->
    </header>
    <!-- end of header -->

    <!-- Services -->
    <div id="services" class="cards-1" style="margin-top: 180px">
      <div class="container">
        <h2 class="text-center" style="margin-bottom: 70px">지금, 인기 관광지는?</h2>
        <div class="row">
          <div class="col-lg-4">
            <!-- Card -->
            <div class="flip-card">
              <div class="flip-card-inner">
                <div class="flip-card-front">
                  <div class="card" id="Busan_bg">
                    <div class="card-icon" id="Busan_icon"></div>
                    <div class="card-body">
                      <h5 class="card-title">부산 날씨</h5>
                      <div class="cur_info">
                        <div class="state" id="Busan_state"></div>
                        <i class="bi bi-thermometer-half" id="Busan_temperature"></i>
                        <i class="bi bi-moisture" id="Busan_humidity"></i>
                        <i class="bi bi-cloudy" id="Busan_clouds"></i>
                        <i class="bi bi-wind" id="Busan_windSpeed"></i>
                      </div>
                      <div id="Busan_week_day" class="week_day"></div>
                      <div id="Busan_week_icon"></div>
                    </div>
                  </div>
                </div>
                <div class="flip-card-back">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="card-title">부산 뉴스</h5>
                      <ul class="news-list Busan-news-list"></ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--col닫음-->
          <!-- end of card -->
          <div class="col-lg-4">
            <!-- Card -->
            <div class="flip-card">
              <div class="flip-card-inner">
                <div class="flip-card-front">
                  <div class="card" id="Jeju_bg">
                    <div class="card-icon" id="Jeju_icon"></div>
                    <div class="card-body">
                      <h5 class="card-title">제주도 날씨</h5>
                      <div class="cur_info">
                        <div class="state" id="Jeju_state"></div>
                        <i class="bi bi-thermometer-half" id="Jeju_temperature"></i>
                        <i class="bi bi-moisture" id="Jeju_humidity"></i>
                        <i class="bi bi-cloudy" id="Jeju_clouds"></i>
                        <i class="bi bi-wind" id="Jeju_windSpeed"></i>
                      </div>
                      <div id="Jeju_week_day" class="week_day"></div>
                      <div id="Jeju_week_icon"></div>
                    </div>
                  </div>
                </div>
                <div class="flip-card-back">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="card-title">제주도 뉴스</h5>
                      <ul class="news-list Jeju-news-list"></ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--col닫음-->
          <!-- Card -->
          <div class="col-lg-4">
            <!-- Card -->
            <div class="flip-card">
              <div class="flip-card-inner">
                <div class="flip-card-front">
                  <div class="card" id="Gangneung_bg">
                    <div class="card-icon" id="Gangneung_icon"></div>
                    <div class="card-body">
                      <h5 class="card-title">강릉 날씨</h5>
                      <div class="cur_info">
                        <div class="state" id="Gangneung_state"></div>
                        <i class="bi bi-thermometer-half" id="Gangneung_temperature"></i>
                        <i class="bi bi-moisture" id="Gangneung_humidity"></i>
                        <i class="bi bi-cloudy" id="Gangneung_clouds"></i>
                        <i class="bi bi-wind" id="Gangneung_windSpeed"></i>
                      </div>
                      <div id="Gangneung_week_day" class="week_day"></div>
                      <div id="Gangneung_week_icon"></div>
                    </div>
                  </div>
                </div>
                <div class="flip-card-back">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="card-title">강릉 뉴스</h5>
                      <ul class="news-list Gangneung-news-list"></ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--col닫음-->
          <!-- <div class="card" id="Gangneung_bg">
              <div class="card-icon" id="Gangneung_icon"></div>
              <div class="card-body">
                <h5 class="card-title">강릉 날씨</h5>
                <div class="cur_info">
                  <div class="state" id="Gangneung_state"></div>
                  <i class="bi bi-thermometer-half" id="Gangneung_temperature"></i>
                  <i class="bi bi-moisture" id="Gangneung_humidity"></i>
                  <i class="bi bi-cloudy" id="Gangneung_clouds"></i>
                  <i class="bi bi-wind" id="Gangneung_windSpeed"></i>
                </div>
                <div id="Gangneung_week_day" class="week_day"></div>
                <div id="Gangneung_week_icon"></div>
              </div>
            </div> -->
          <!-- end of card -->

          <!-- Card -->
          <!-- <div class="card" id="Jeju_bg">
              <div class="card-icon" id="Jeju_icon"></div>
              <div class="card-body">
                <h5 class="card-title">제주도 날씨</h5>
                <div class="cur_info">
                  <div class="state" id="Jeju_state"></div>
                  <i class="bi bi-thermometer-half" id="Jeju_temperature"></i>
                  <i class="bi bi-moisture" id="Jeju_humidity"></i>
                  <i class="bi bi-cloudy" id="Jeju_clouds"></i>
                  <i class="bi bi-wind" id="Jeju_windSpeed"></i>
                </div>
                <div id="Jeju_week_day" class="week_day"></div>
                <div id="Jeju_week_icon"></div>
              </div>
            </div> -->
          <!-- end of card -->
        </div>
        <!-- end of row -->
      </div>
      <!-- end of container -->
    </div>
    <!-- end of services -->
    <!-- Details 2 -->
    <div class="counter" style="margin-top: 100px">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-xl-5 d-flex align-items-center">
            <div class="text-container">
              <h2>
                <span>Enjoy Trip</span><br />
                Top 여행지, 제주도의 여행자 수
              </h2>
              <p>
                Enjoy Trip에서 제주도 여행 스케줄을 짜보세요!<br />
                스케줄을 짜기 어렵다면 추천 스케줄을 참고해도 좋습니다.
              </p>

              <!-- Counter -->
              <div class="counter-container">
                <div class="counter-cell">
                  <div
                    data-purecounter-start="0"
                    data-purecounter-end="5582"
                    data-purecounter-duration="2"
                    class="purecounter"
                  >
                    1
                  </div>
                  <div class="counter-info">Enjoy trip 누적 회원 수</div>
                </div>
                <!-- end of counter-cell -->
                <div class="counter-cell red">
                  <div
                    data-purecounter-start="0"
                    data-purecounter-end="3233"
                    data-purecounter-duration="2"
                    class="purecounter"
                  >
                    1
                  </div>
                  <div class="counter-info">제주도 방문자 수</div>
                </div>
                <!-- end of counter-cell -->
              </div>
              <!-- end of counter-container -->
              <!-- end of counter -->
            </div>
            <!-- end of text-container -->
          </div>
          <!-- end of col -->
          <div class="col-sm-6">
            <div class="card count-card">
              <img src="./assets/img/jeju.jpg" class="card-img-top" alt="..." />
              <div class="card-body">
                <p class="card-title">제주 여행 스케줄</p>
                <p class="card-text">제주 국제공항 -> 함덕해수욕장 -> 비자림 -> 월정리</p>
              </div>
            </div>

            <!-- end of image-container -->
          </div>
          <!-- end of col -->
        </div>
        <!-- end of row -->
      </div>
      <!-- end of container -->
    </div>
    <!-- end of counter -->
    <!-- end of details 2 -->
    <!-- Projects -->
    <div id="projects" class="filter bg-gray">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <h2 class="h2-heading">제주도 추천 여행지</h2>
          </div>
          <!-- end of col -->
        </div>
        <!-- end of row -->
        <div class="row">
          <div class="col-lg-12">
            <!-- Filter -->
            <div class="button-group filters-button-group">
              <button class="button is-checked" data-filter="*">전체</button>
              <button class="button" data-filter=".hotspot">관광지</button>
              <button class="button" data-filter=".sports">레포츠</button>
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
      <!-- end of container -->
    </div>
    <!-- end of filter -->
    <!-- end of projects -->
    <!-- Testimonials -->
    <div class="slider-1">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <!-- Card Slider -->
            <div class="slider-container">
              <div class="swiper-container card-slider">
                <div class="swiper-wrapper"></div>
                <!-- end of swiper-wrapper -->

                <!-- Add Arrows -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <!-- end of add arrows -->
              </div>
              <!-- end of swiper-container -->
            </div>
            <!-- end of slider-container -->
            <!-- end of card slider -->
          </div>
          <!-- end of col -->
        </div>
        <!-- end of row -->
      </div>
      <!-- end of container -->
    </div>
    <!-- end of slider-1 -->
    <!-- end of testimonials -->

    <!-- Projects -->
    <div id="themeSchedule" class="filter bg-gray">
      <div class="container" style="min-height: 590px">
        <div class="row">
          <div class="col-lg-12">
            <h2 class="h2-heading">테마별 스케줄 모아보기</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="schbutton-group filters-schbutton-group">
              <button class="button is-checked" data-schfilter="*">전체</button>
              <button class="button" data-schfilter=".food">먹방</button>
              <button class="button" data-schfilter=".activity">액티비티</button>
              <button class="button" data-schfilter=".healing">힐링</button>
            </div>
            <c:choose>
              <c:when test="${not empty user}">
                <div class="grid" id="schedule-grid"></div>
              </c:when>
              <c:when test="${empty user}">
                <div class="grid" id="schedule-grid-nouser"></div>
              </c:when>
            </c:choose>
          </div>
        </div>
      </div>
    </div>
    <!-- end of projects -->

   <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    <script>
      window.onload = () => {
        getCurWeather("Busan");
        getCurWeather("Gangneung");
        getCurWeather("Jeju");
        getWeekWeather("Busan");
        getWeekWeather("Gangneung");
        getWeekWeather("Jeju");
        getAttraction(12);
        getAttraction(28);
        getAttraction(39);
        getNews("Busan");
        getNews("Gangneung");
        getNews("Jeju");
        getAllSchedule();
      };
      function getNews(city) {
        let url = "https://cors-anywhere.herokuapp.com/";
        let newsList = document.querySelector("." + city + "-news-list");
        if (city == "Busan") {
          url +=
            "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EB%B6%80%EC%82%B0+%EC%97%AC%ED%96%89&nso=so%3Ar%2Cp%3Aall";
        } else if (city == "Gangneung") {
          url +=
            "https://search.naver.com/search.naver?where=news&sm=tab_jum&query=%EA%B0%95%EB%A6%89+%EC%97%AC%ED%96%89&nso=so%3Ar%2Cp%3Aall";
        } else if (city == "Jeju") {
          url +=
            "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%97%AC%ED%96%89";
        }
        fetch(url)
          .then((response) => response.text())
          .then((str) => new DOMParser().parseFromString(str, "text/html"))
          .then((res) => {
            let news = res.querySelector(".list_news");
            let newsItems = news.querySelectorAll(".bx");
            let lists = ``;
            for (let i = 0; i < 4; i++) {
              let newsItem = newsItems[i];
              let news_title = newsItem.querySelector(".news_tit").title;
              let news_url = newsItem.querySelector(".news_tit").href;
              lists += `
	                  <li class="news-item">
	                    <a href="\${news_url}">\${news_title}</a>
	                  </li>
	                `;
            }
            newsList.innerHTML = lists;
          });
      }

      function getCurWeather(city) {
        const apiUrl = `http://api.openweathermap.org/data/2.5/weather?q=\${city}&appid=672ac239bb48007f9a27b0159bb6976a&units=metric`;
        fetch(`\${apiUrl}`)
          .then((res) => res.json())
          .then((json) => {
            const weatherState = json.weather[0].main;
            const temperature = json.main.temp;
            const humidity = json.main.humidity;
            const clouds = json.clouds.all;
            const windSpeed = json.wind.speed;
            const icon = json.weather[0].icon;
            const current_info = [weatherState, temperature, humidity, clouds, windSpeed, icon];
            addCurWeather(city, current_info);
          });
      }
      function getWeekWeather(city) {
        const apiUrl = `http://api.openweathermap.org/data/2.5/forecast?q=\${city}&appid=672ac239bb48007f9a27b0159bb6976a&units=metric`;
        fetch(`\${apiUrl}`)
          .then((res) => res.json())
          .then((json) => {
            let today = new Date();
            let year = today.getFullYear(); // 년도
            let month = today.getMonth() + 1; // 월
            if (month < 10) month = "0" + month;
            let date = today.getDate(); // 날짜
            let day = today.getDay(); // 요일
            let day_txt = `${year}-${month}-${date} 12:00:00`;
            let idx = 0;
            for (var d in json.list) {
              if (json.list[d].dt_txt == day_txt) {
                idx = d * 1;
              }
            }
            let days = [idx + 8, idx + 16, idx + 24];
            let icons = [];
            for (var i = 0; i < 3; i++) {
              const icon = json.list[days[i]].weather[0].icon;
              icons.push(icon);
            }
            addWeekWeather(day, city, icons);
          });
      }
      function addCurWeather(name, info) {
        let icon_img = ``;
        // Backgrounds
        switch (info[0]) {
          case "Snow":
            document.getElementById(`\${name}_bg`).style.backgroundImage =
              "url('https://mdbgo.io/ascensus/mdb-advanced/img/snow.gif')";
            document.getElementById(`\${name}_icon`).style.color = "white";

            break;
          case "Clouds":
            document.getElementById(`\${name}_bg`).style.backgroundImage =
              "url('https://mdbgo.io/ascensus/mdb-advanced/img/clouds.gif')";
            document.getElementById(`\${name}_icon`).style.color = "white";

            break;
          case "Fog":
            document.getElementById(`\${name}_bg`).style.backgroundImage =
              "url('https://mdbgo.io/ascensus/mdb-advanced/img/fog.gif')";
            document.getElementById(`\${name}_icon`).style.color = "white;";

            break;
          case "Rain":
            document.getElementById(`\${name}_bg`).style.backgroundImage =
              "url('https://mdbgo.io/ascensus/mdb-advanced/img/rain.gif')";
            document.getElementById(`\${name}_icon`).style.color = "white;";

            break;
          case "Clear":
            document.getElementById(`\${name}_bg`).style.backgroundImage =
              "url('https://mdbgo.io/ascensus/mdb-advanced/img/clear.gif')";

            break;
          case "Thunderstorm":
            document.getElementById(`\${name}_bg`).style.backgroundImage =
              "url('https://mdbgo.io/ascensus/mdb-advanced/img/thunderstorm.gif')";
            document.getElementById(`\${name}_icon`).style.color = "white;";

            break;
          default:
            document.getElementById(`\${name}_bg`).style.backgroundImage =
              "url('https://mdbgo.io/ascensus/mdb-advanced/img/clear.gif')";
            break;
        }
        switch (info[5]) {
          case "01d":
            icon_img += `<i class="bi bi-brightness-high weather-icon"></i>`;
            break;
          case "01n":
            icon_img += `<i class="bi bi-moon-stars-fill weather-icon"></i>`;
            break;
          case "02d":
            icon_img += `<i class="bi bi-cloud-sun weather-icon"></i>`;
            break;
          case "02n":
            icon_img += `<i class="bi bi-cloud-moon-fill weather-icon"></i>`;
            break;
          case "03d":
            icon_img += `<i class="bi bi-cloud weather-icon"></i>`;
            break;
          case "03n":
            icon_img += `<i class="bi bi-cloud-moon-fill weather-icon"></i>`;
            break;
          case "04d":
            icon_img += `<i class="bi bi-clouds weather-icon"></i>`;
            break;
          case "04n":
            icon_img += `<i class="bi bi-clouds-fill weather-icon"></i>`;
            break;
          case "09d":
            icon_img += `<i class="bi bi-cloud-rain-heavy weather-icon"></i>`;
            break;
          case "09n":
            icon_img += `<i class="bi bi-cloud-rain-heavy-fill weather-icon"></i>`;
            break;
          case "10d":
            icon_img += `<i class="bi bi-cloud-drizzle weather-icon"></i>`;
            break;
          case "10n":
            icon_img += `<i class="bi bi-cloud-drizzle-fill weather-icon"></i>`;
            break;
          case "11d":
            icon_img += `<i class="bi bi-cloud-lightning weather-icon"></i>`;
            break;
          case "11n":
            icon_img += `<i class="bi bi-cloud-lightning-fill weather-icon"></i>`;
            break;
          case "13d":
          case "13n":
            icon_img += `<i class="bi bi-snow2 weather-icon"></i>`;
            break;
          case "50d":
          case "50n":
            icon_img += `<i class="bi bi-cloud-fog weather-icon"></i>`;
            break;
        }
        document.getElementById(`\${name}_icon`).innerHTML = icon_img;
        document.getElementById(`\${name}_state`).innerHTML = info[0];
        document.getElementById(`\${name}_temperature`).innerHTML = info[1] + `&deg`;
        document.getElementById(`\${name}_humidity`).innerHTML = info[2];
        document.getElementById(`\${name}_clouds`).innerHTML = info[3] + `&#37`;
        document.getElementById(`\${name}_windSpeed`).innerHTML = info[4];
      }
      function addWeekWeather(day, name, weathers) {
        let icon_img = ``;
        let weather;
        let dayName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
        document.getElementById(`\${name}_week_day`).innerText = `\${dayName[day]} ${
          dayName[(day + 1) % 7]
        } ${dayName[(day + 2) % 7]}`;
        for (var i = 0; i < 3; i++) {
          weather = weathers[i];

          switch (weather) {
            case "01d":
              icon_img += `<i class="bi bi-brightness-high week-icon"></i>`;
              break;
            case "01n":
              icon_img += `<i class="bi bi-moon-stars-fill week-icon"></i>`;
              break;
            case "02d":
              icon_img += `<i class="bi bi-cloud-sun week-icon"></i>`;
              break;
            case "02n":
              icon_img += `<i class="bi bi-cloud-moon-fill week-icon"></i>`;
              break;
            case "03d":
              icon_img += `<i class="bi bi-cloud week-icon"></i>`;
              break;
            case "03n":
              icon_img += `<i class="bi bi-cloud-moon-fill week-icon"></i>`;
              break;
            case "04d":
              icon_img += `<i class="bi bi-clouds week-icon"></i>`;
              break;
            case "04n":
              icon_img += `<i class="bi bi-clouds-fill week-icon"></i>`;
              break;
            case "09d":
              icon_img += `<i class="bi bi-cloud-rain-heavy week-icon"></i>`;
              break;
            case "09n":
              icon_img += `<i class="bi bi-cloud-rain-heavy-fill week-icon"></i>`;
              break;
            case "10d":
              icon_img += `<i class="bi bi-cloud-drizzle week-icon"></i>`;
              break;
            case "10n":
              icon_img += `<i class="bi bi-cloud-drizzle-fill week-icon"></i>`;
              break;
            case "11d":
              icon_img += `<i class="bi bi-cloud-lightning week-icon"></i>`;
              break;
            case "11n":
              icon_img += `<i class="bi bi-cloud-lightning-fill week-icon"></i>`;
              break;
            case "13d":
            case "13n":
              icon_img += `<i class="bi bi-snow2 week-icon"></i>`;
              break;
            case "50d":
            case "50n":
              icon_img += `<i class="bi bi-cloud-fog week-icon"></i>`;
              break;
          }
          document.getElementById(`\${name}_week_icon`).innerHTML = icon_img;
        }
      }
      document.querySelector("#header-search-form").addEventListener("submit", function (e) {
        let input = document.querySelector("#header-search");
        window.location.href = "${root}/spot?act=mvMapSearch&keyword=" + input.value;
        e.preventDefault();
      });
      /* Card Slider - Swiper */
      var cardSlider = new Swiper(".card-slider", {
        autoplay: {
          delay: 5000,
          disableOnInteraction: false,
        },
        loop: true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        slidesPerView: 2,
        spaceBetween: 70,
        breakpoints: {
          // when window is <= 991px
          991: {
            slidesPerView: 2,
          },
        },
      });
      function getAttraction(id) {
        const url = `${root}/spot/topSpotlist/\${id}/39`;//&sidoid=39
        fetch(url)
          .then((response) => response.json())
          .then((data) => makeList(data.topSpots));
      }
      function makeList(data) {
    	console.log("index화면 핫한 관광지 데이터 : "+data);
        let opt = ``;

        data.forEach((item) => {
          let theme = "";
          if (item.theme == 12) {
            theme += "hotspot";
          } else if (item.theme == 28) {
            theme += "sports";
          } else {
            theme += "food";
          }
          let imagePath = item.image == "" ? "${root}/assets/img/noImg.jpg" : item.image;
          opt += ` 
            <div class="element-item \${theme}">
            <a href="${root}/spot/detail/\${item.spotid}">
                  <img class="img-fluid" src=\${imagePath} alt="alternative" style="height:200px; width:100%;">
                  <p><strong>\${item.title}</strong><br />\${item.address}</p>
              </a>
            </div>
            `;
        });

        document.querySelector("#element-grid").innerHTML += opt;
        /* Filter - Isotope */
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
      }
      var imagePath;
      var spotTitles = "";

      fetch("${root}/social/getRecentReviews")
        .then((response) => response.json())
        .then((reviews) => {
          console.log("최근에 받아온 값은  : "+reviews);
          let myReviews = document.querySelector(".swiper-wrapper");
          let reviewItems = ``;
          let content = "";
          reviews.forEach((review) => {
            reviewItems += `<div class="swiper-slide">
			<div class="card">
				<div class="row">
					<div class="col review-star">`;
            for (var i = 0; i < review.score; i++) {
              reviewItems += `<i class="bi bi-star-fill"></i>`;
            }
            reviewItems += `</div>
				</div>
				<div class="card-body review-card" style="height:180px;">
					<p class="testimonial-text">`;
            if (review.content.length > 40) {
              content = review.content.substring(0, 40) + "...";
            } else content = review.content;
            reviewItems += `\${content}</p><div class="details">
						<img class="testimonial-image" src="\${review.image}"
							alt="alternative" onerror="this.src='${root}/assets/img/noImg.jpg'" style="height:60px; width:60px;"/>
						<div class="text">
							<div class="testimonial-author">\${review.name}</div>
							 <div class="occupation">\${review.title}</div>
						</div>
						<!-- end of text -->
					</div>
					<!-- end of testimonial-details -->
				</div>
			</div>
		</div>
			`;
          });
          myReviews.innerHTML = reviewItems;
        });
      let navs = document.querySelectorAll(".nav-link");
      navs[0].classList.add("active");
      function getAllSchedule() {
        fetch("${root}/schedule/allSchedule")
          .then((response) => response.json())
          .then((schedules) => {
            makeScheduleList(schedules);
          });
      }
      function makeScheduleList(data) {
        let opt = ``;
        let opt2 = ``;
        data.forEach((item) => {
          let theme = "";
          if (item.theme == "food") {
            theme += "food";
          } else if (item.theme == "activity") {
            theme += "activity";
          } else {
            theme += "healing";
          }
          
          opt += `
	            <div class="schedule-item \${theme}" id="\${item.scheduleid}">
	              <img class="img-fluid schedule-img" src="" onerror="this.src='${root}/assets/img/noImg.jpg'" style="height:200px; width:100%;">
	              <p><strong>\${item.title}</strong><button id="btn-like-\${item.scheduleid}" class="btn-solid-sm-init btn-like-schedule" id="\${item.scheduleid}" style="display: none" data-value="\${item.scheduleid}" onclick="addlikeSchedule(this,\${item.scheduleid})">
		            <i class="bi bi-suit-heart-fill" style="color: inherit"></i>
  		          </button><button id="btn-dislike-\${item.scheduleid}" class="btn-solid-sm-init btn-unlike-schedule" data-value="\${item.scheduleid}" style="display: none" onclick="deletelikeSchedule(this,\${item.scheduleid})">
		          <i class="bi bi-x-lg" style="color: inherit"></i></button></p>
	              <p class="schedule-card"></br></br></div>`;
          opt2 += `
	            <div class="schedule-item \${theme}" id="\${item.scheduleid}">
	              <img class="img-fluid schedule-img" src="" onerror="this.src='${root}/assets/img/noImg.jpg'" style="height:200px; width:100%;">
	              <p><strong>\${item.title}</strong></p>
	              <p class="schedule-card"></br></br></div>`;
		
	      getBtns(item.scheduleid);
          getSpots(item.scheduleid);
        });
        
		if(document.querySelector("#schedule-grid")==null){
			document.querySelector("#schedule-grid-nouser").innerHTML += opt2;
			 /* Filter - Isotope */
	        const gridCheck = document.querySelector("#schedule-grid-nouser");

	        if (gridCheck !== null) {
	          // init Isotope
	          var iso = new Isotope("#schedule-grid-nouser", {
	            itemSelector: ".schedule-item",
	            layoutMode: "fitRows",
	          });

	          // bind filter button click
	          var filtersElem = document.querySelector(".filters-schbutton-group");
	          filtersElem.addEventListener("click", function (event) {
	            // only work with buttons
	            if (!matchesSelector(event.target, "button")) {
	              return;
	            }
	            var filterValue = event.target.getAttribute("data-schfilter");
	            // use matching filter function
	            iso.arrange({ filter: filterValue });
	          });

	          // change is-checked class on buttons
	          var buttonGroups = document.querySelectorAll(".schbutton-group");
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
		}
		else{
        document.querySelector("#schedule-grid").innerHTML += opt;
        /* Filter - Isotope */
        const gridCheck = document.querySelector("#schedule-grid");

        if (gridCheck !== null) {
          // init Isotope
          var iso = new Isotope("#schedule-grid", {
            itemSelector: ".schedule-item",
            layoutMode: "fitRows",
          });

          // bind filter button click
          var filtersElem = document.querySelector(".filters-schbutton-group");
          filtersElem.addEventListener("click", function (event) {
            // only work with buttons
            if (!matchesSelector(event.target, "button")) {
              return;
            }
            var filterValue = event.target.getAttribute("data-schfilter");
            // use matching filter function
            iso.arrange({ filter: filterValue });
          });

          // change is-checked class on buttons
          var buttonGroups = document.querySelectorAll(".schbutton-group");
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
		}
       
      }
      
      function getBtns(scheduleid){
    	  fetch("${root}/social/checkLikeSchedule/"+scheduleid)
    		.then(response => response.text())
    		.then(data => {
    			if(data == 1){
    				document.querySelector("#btn-dislike-"+scheduleid).style.display = "";
    			}else{
    				document.querySelector("#btn-like-"+scheduleid).style.display = "";
    			}
    		})
      }
      
      function getSpots(scheduleid) {
        fetch("${root}/schedule/spotsInSchedule/" + scheduleid)
          .then((response) => response.json())
          .then((spots) => {
            spotTitles = "";
            imagePath = spots[0].image;
            for (var i = 0; i < spots.length - 1; i++) {
              spotTitles += spots[i].title + " -> ";
            }
            spotTitles += spots[spots.length - 1].title;
            document.getElementById(scheduleid).querySelector(".schedule-img").src = imagePath;
            document.getElementById(scheduleid).querySelector(".schedule-card").innerText =
              spotTitles;
          });
      }
      function addlikeSchedule(el, id) {
        fetch("${root}/social/addLikeSchedule/" + id).then(() => {
          alert("스케줄을 찜했습니다!");
          el.style.display = "none";
          el.nextSibling.style.display = "";
        });
      }
      function deletelikeSchedule(el, id) {
        fetch("${root}/social/deleteLikeSchedule/" + id).then(() => {
          alert("찜 취소 했습니다!");
          el.style.display = "none";
          el.previousSibling.style.display = "";
        });
      }
    </script>
  </body>
</html>
