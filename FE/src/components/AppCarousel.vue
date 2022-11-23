<template>
  <carousel :autoplay="true" :perPage="1">
    <slide class="slide slide1"> </slide>
    <slide class="slide slide2"> </slide>
    <slide class="slide slide3"> </slide>
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
}
.slide1 {
  background-image: url("http://localguide.co.kr/wp-content/uploads/2021/01/20190124-x1d-0047.jpeg");
}
.slide2 {
  background-image: url("http://contents.verygoodtour.com/Images/pc/package/submain/dubai3.jpg");
}
.slide3 {
  background-image: url("http://www.gallery.jejupask.com/data/gallery/20200922_50.jpg");
}
</style>
