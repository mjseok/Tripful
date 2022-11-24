<template>
  <carousel :autoplay="true" :perPage="1">
    <slide class="slide slide1">
      <div class="text1">
        <h1>Trip + -ful</h1>
        <br />
        <p>여행 가기 전날의 설렘 가득한 기분을 선사한다.</p>
      </div>
    </slide>
    <slide class="slide slide2">
      <div class="text2">
        <h1>Trip + -ful</h1>
        <br />
        <p>여행 가기 전날의 설렘 가득한 기분을 선사한다.</p>
      </div>
    </slide>
    <slide class="slide slide3">
      <div class="text3">
        <h1>Trip + -ful</h1>
        <br />
        <p>여행 가기 전날의 설렘 가득한 기분을 선사한다.</p>
      </div>
    </slide>
  </carousel>
</template>

<script>
export default {};
</script>

<style>
.slide {
  width: 100%;
  height: 700px;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}
.slide1 {
  background-image: url("http://localguide.co.kr/wp-content/uploads/2021/01/20190124-x1d-0047.jpeg");
}
.text1 {
  top: 30%;
  left: 15%;
  text-align: left;
  background-color: rgba(255, 255, 255, 0.5);
  position: absolute;
  border-radius: 10px;
  padding: 25px;
}
.slide2 {
  background-image: url("http://contents.verygoodtour.com/Images/pc/package/submain/dubai3.jpg");
  display: flex;
  justify-content: center;
}
.text2 {
  top: 30%;
  text-align: center;
  background-color: rgba(255, 255, 255, 0.5);
  position: absolute;
  border-radius: 10px;
  padding: 25px;
}
.slide3 {
  background-image: url("http://www.gallery.jejupask.com/data/gallery/20200922_50.jpg");
  display: flex;
  justify-content: center;
}
.text3 {
  top: 30%;
  text-align: center;
  background-color: rgba(255, 255, 255, 0.5);
  position: absolute;
  border-radius: 10px;
  padding: 25px;
}
</style>
