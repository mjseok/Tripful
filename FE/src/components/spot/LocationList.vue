<template>
  <div>
    <p>리스트입니다</p>
    <div class="row filter" style="padding-top: 40px">
      <div class="col-lg-12">
        <!-- Filter -->

        <!-- style="display: none" -->
        <div
          class="button-group filters-button-group"
          id="filters-button-group"
        >
          <button id="btn-select-all" class="button is-checked" data-filter="*">
            전체
          </button>
          <button id="btn-select-hotspot" class="button" data-filter=".hotspot">
            관광지
          </button>
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
    <div class="row" id="pagination-div" style="display: none">
      <ul class="pagination justify-content-center" id="pagination-contents">
        <li class="page-item"><a class="page-link" href="#">이전</a></li>
        <li class="page-item active first-item">
          <a class="page-link page-num" href="#">1</a>
        </li>
        <li class="page-item"><a class="page-link page-num" href="#">2</a></li>
        <li class="page-item"><a class="page-link page-num" href="#">3</a></li>
        <li class="page-item"><a class="page-link page-num" href="#">4</a></li>
        <li class="page-item"><a class="page-link page-num" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">다음</a></li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "LocationList",
};
</script>

<style></style>
