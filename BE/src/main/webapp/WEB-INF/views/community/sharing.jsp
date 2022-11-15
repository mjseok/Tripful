<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="container contents" style="min-height: 500px">
		<h2>여행 정보 공유</h2>
		<c:if test="${!empty user}">
			<div class="write-btn">
				<a class="btn-solid-sm" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">작성하기</a>
			</div>
		</c:if>
		<!-- Details Modal -->
		<div id="staticBackdrop" class="modal fade" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="row">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" id="btn-close-form"></button>
						<!-- end of col -->
						<div class="container">
							<h3>여행 정보 작성</h3>
							<div class="row">
								<p class="col-8"></p>
								<p class="col-2">작성자: ${user.name}</p>
								<p class="col-2">날짜: ${today}</p>
							</div>
							<form method="POST" id="write-board-form">
								<input type="hidden" name="act" value="writeBoard"> 제목 :
								<input style="width: 95%; margin-bottom: 10px; margin-left: 6px"
									type="text" id="title" name="title" />
								<!-- 
							<p>여행 스케줄과 함께 정보를 작성해보세요!</p>
							<div class="row sharing-row3">
								<div class="card">
									<img src="../assets/img/gangneung.jpg" class="card-img-top"
										alt="..." />
									<div class="card-body">
										<p class="card-title">강릉 여행 스케줄</p>
										<p class="card-text">경포 해수욕장 -> 아르떼뮤지엄 강릉 -> 안목해변 카페거리</p>
									</div>
								</div>
								<div class="card">
									<img src="../assets/img/seoul.jpg" class="card-img-top"
										alt="..." />
									<div class="card-body">
										<p class="card-title">서울 여행 스케줄</p>
										<p class="card-text">해방촌 -> 경복궁 -> 광화문 -> 롯데타워 서울스카이</p>
									</div>
								</div>
								<div class="card">
									<img src="../assets/img/jeju.jpg" class="card-img-top"
										alt="..." />
									<div class="card-body">
										<p class="card-title">제주 여행 스케줄</p>
										<p class="card-text">제주 국제공항 -> 함덕해수욕장 -> 비자림 -> 월정리</p>
									</div>
								</div>
							</div>
							 -->
								<textarea class="form-control"
									style="width: 100%; min-height: 300px; margin: 20px 0px"
									id="content" name="content"
									placeholder="여행 스케줄을 고르고, 해당 스케줄과 관련하여 공유하고 싶은 정보를 작성해주세요."></textarea>
							</form>
							<button type="button" class="btn-outline-sm p-4" id="btn-write">작성하기</button>
						</div>
						<!-- end of col -->
					</div>
					<!-- end of row -->
				</div>
				<!-- end of modal-content -->
			</div>
			<!-- end of modal-dialog -->
		</div>

		<table class="table table-hover">
			<tr>
				<th style="width: 10%">순번</th>
				<th style="width: 50%">제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일</th>
				<th style="width: 10%">조회수</th>
			</tr>
			<tbody id="board-table-body">
				<c:forEach var="board" items="${boards}">
					<tr data-bs-toggle="modal" data-bs-target="#boardDetail"
						class="board-item">
						<td>${board.boardid}</td>
						<td>${board.title}</td>
						<td>${board.author}</td>
						<td>${board.date}</td>
						<td>${board.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- Details Modal -->
		<div id="boardDetail" class="modal fade" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="min-height: 800px;">
					<div class="row">
						<button type="button" class="btn-close me-2 mt-2"
							data-bs-dismiss="modal" aria-label="Close"
							id="btn-close-detail-board"></button>
						<div class="container" id="boardInfo">
							<h3 id="detail-title"></h3>
							<div class="row sharing-row">
								작성자: <span class="col-1" id="detail-author"></span> &ensp; 날짜: <span
									class="col-2" id="detail-date"></span>
								<form method="POST" id="delete-form">
									<input type="hidden" name="act" value="deleteBoard"> <input
										type="hidden" id="detail-boardid" name="boardid" value="">
								</form>
								<c:if test="${!empty user}">
									<button class="bi bi-pencil-square col-1 btn btn-sharing-edit"
										id="btn-modify-board"></button>
									<button class="bi bi-trash-fill col-1 btn btn-sharing-trash"
										id="btn-delete-board"></button>
								</c:if>
							</div>
							<div class="row sharing-row2">
								<p class="col-12 sharing-info" id="detail-content"></p>
							</div>
						</div>

						<div class="container" id="boardModify" style="display: none;">
							<h3 class="mb-3">게시글 수정하기</h3>
							<form method="POST" id="modify-board-form">
								<input type="hidden" name="act" value="modifyBoard"> <input
									type="hidden" id="modify-boardid" name="boardid" value="">
								<div class="row sharing-row">
									작성자: <span class="col-1" id="modify-author"></span> &ensp; 날짜:
									<span class="col-2" id="modify-date">${today}</span>
								</div>
								<input class="form-control mt-2 mb-1" type="text" name="title"
									id="modify-title">
								<div class="row sharing-row2">
									<textarea class="form-control"
										style="width: 100%; min-height: 450px; margin: 20px 0px"
										id="modify-content" name="content"></textarea>
								</div>
								<div class="row">
									<div class="col-3"></div>
									<div class="col-6">
										<button type="button" class="btn-outline-sm p-4 me-2"
											id="btn-modify">수정하기</button>
										<button type="button" class="btn-outline-reg p-4 ms-2"
											id="btn-modify-cancel">돌아가기</button>
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
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center mt-5">
				<c:forEach var="i" begin="1" end="${boardNum/15+1}" step="1">
					<c:choose>
						<c:when test="${i eq param.pgno}">
							<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="#">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</nav>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		let pageItems = document.querySelectorAll(".page-item");
		pageItems.forEach(pageItem => {
			pageItem.addEventListener("click", function(){
				let pgno = pageItem.innerText;
				location.href = "${root}/board?act=listBoard&pgno="+pgno;
			});
		});
	
		let boardItems = document.querySelectorAll(".board-item");
		boardItems.forEach(boardItem => {
			boardItem.addEventListener("click", function(){
				let boardid = boardItem.querySelector("td").innerText;
				fetch("${root}/board?act=updateBoardHit&boardid="+boardid)
					.then(response => response.json())
					.then(data => {
						let hit = boardItem.querySelectorAll("td")[4];
						hit.innerText = data.hit;
					})
					
				fetch("${root}/board?act=getBoard&boardid="+boardid)
					.then(response => response.json())
					.then(data => {
						document.querySelector("#detail-boardid").value = data.boardid;
						document.querySelector("#detail-title").innerText = data.title;
						document.querySelector("#detail-author").innerText = data.author;
						document.querySelector("#detail-date").innerText = data.date;
						document.querySelector("#detail-content").innerText = data.content;
						if("${user.uid}" != null && data.uid == "${user.uid}"){
							document.querySelector("#btn-modify-board").style.display = "";
							document.querySelector("#btn-delete-board").style.display = "";
						}else{
							document.querySelector("#btn-modify-board").style.display = "none";
							document.querySelector("#btn-delete-board").style.display = "none";
						}
					})
			});
		});
		<c:if test="${!empty user}">
			document.querySelector("#btn-modify-board").addEventListener("click",
					function() {
						document.querySelector("#boardInfo").style.display = "none";
						document.querySelector("#boardModify").style.display = "";
						document.querySelector("#modify-boardid").value = document.querySelector("#detail-boardid").value;
						document.querySelector("#modify-title").value = document.querySelector("#detail-title").innerText;
						document.querySelector("#modify-author").innerText = document.querySelector("#detail-author").innerText;
						document.querySelector("#modify-content").value = document.querySelector("#detail-content").innerText;
					});
			
			document.querySelector("#btn-delete-board").addEventListener("click",
					function() {
						let confirmDelete = confirm("해당 게시글을 삭제하시겠습니까?");
				        if(confirmDelete){
							let form = document.querySelector("#delete-form");
							form.setAttribute("action", "${root}/board");
							form.submit();
						}
					});
	
		</c:if>
		document.querySelector("#btn-modify").addEventListener("click",
				function() {
					let form = document.querySelector("#modify-board-form");
					form.setAttribute("action", "${root}/board");
					form.submit();
				});
		
		document.querySelector("#btn-modify-cancel").addEventListener("click",
				function() {
					document.querySelector("#modify-board-form").reset();
					document.querySelector("#boardInfo").style.display = "";
					document.querySelector("#boardModify").style.display = "none";
				});
		
		document.querySelector("#btn-close-detail-board").addEventListener("click",
				function() {
					document.querySelector("#modify-board-form").reset();
					document.querySelector("#boardInfo").style.display = "";
					document.querySelector("#boardModify").style.display = "none";
				});
		
		document.querySelector("#btn-close-form").addEventListener("click",
			function() {
				document.querySelector("#write-board-form").reset();
			});
	
		document.querySelector("#btn-write").addEventListener("click",
				function() {
					if (!document.querySelector("#title").value) {
						alert("게시글 제목을 입력해주세요!!!");
						return;
					} else if (!document.querySelector("#content").value) {
						alert("게시글 내용을 입력해주세요!!!");
						return;
					} else {
						let form = document.querySelector("#write-board-form");
						form.setAttribute("action", "${root}/board");
						form.submit();
					}
				});

        let navs = document.querySelectorAll(".nav-link");
        navs[3].classList.add("active");
	</script>
</body>
</html>
