<template>
  <div>
    <b-carousel
      id="carousel-fade"
      style="text-shadow: 0px 0px 2px #000"
      fade
      indicators
      img-width="1024"
      img-height="480"
    >
      <b-carousel-slide
        caption="First Slide"
        :img-src="require(`@/assets/img1.jpg`)"
        style="height: 800px"
      ></b-carousel-slide>
      <b-carousel-slide
        caption="Second Slide"
        img-src="https://picsum.photos/1024/480/?image=12"
        style="height: 800px"
      ></b-carousel-slide>
      <b-carousel-slide
        caption="Third Slide"
        img-src="https://picsum.photos/1024/480/?image=22"
        style="height: 800px"
      ></b-carousel-slide>
    </b-carousel>
  </div>
</template>

<script>
export default {};
</script>

<style></style>
