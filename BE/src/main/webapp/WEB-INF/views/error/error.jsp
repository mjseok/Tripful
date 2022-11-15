<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/include/header.jsp"%>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbarExample">
	<%@ include file="/include/nav.jsp"%>

	<div class="container" style="min-height: 750px">
		<div style="height: 70px"></div>
		<h1 class="text-center mt-5 mb-3">요청하신 페이지를 불러 올 수 없습니다!!!</h1>
		<div class="text-center">
			<button class="btn btn-solid-reg mt-5 w-20" id="btn-home">메인
				페이지 이동</button>
		</div>
	</div>

	<%@ include file="/include/footer.jsp"%>
	<script>
		document.querySelector("#btn-home").addEventListener("click",
				function() {
					location.href = "${root}";
				});
	</script>
</body>
</html>
