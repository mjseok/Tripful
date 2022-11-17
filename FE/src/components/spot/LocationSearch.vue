<template>
  <div>
    <div
      class="container"
      style="min-height: 800px; min-width: 1400px !important"
    >
      <div style="height: 70px"></div>
      <h2 class="text-center mt-5 mb-3">지역별 관광지 조회</h2>
      <div class="row col-md-12 justify-content-center mb-2">
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="sido">
            <option value="">시도선택</option>
            <!-- <c:forEach var="sido" items="${sidos}">
              <option value="${sido.sidoid}">${sido.name}</option>
            </c:forEach> -->
          </select>
        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="gugun">
            <option value="">구군선택</option>
            <!-- <c:forEach var="gugun" items="${guguns}">
						<option value="${gugun}">${gugun}</option>
					</c:forEach>-->
          </select>
        </div>
        <div class="form-group col-md-2">
          <button type="button" id="list-btn" class="btn btn-solid-lg">
            조회하기
          </button>
        </div>
        <div class="form-group col-md-12 text-center">
          <span>지금 가고 싶은 여행지를 선택해주세요</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "LocationSearch",
};
</script>

<style></style>
