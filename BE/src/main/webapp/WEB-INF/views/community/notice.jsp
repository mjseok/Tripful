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
		<h2>공지사항</h2>
		<c:if test="${user.isadmin eq 1}">
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
							aria-label="Close" id="btn-close-write"></button>
						<!-- end of col -->
						<div class="container">
							<h3>공지사항 작성</h3>
							<div class="row">
								<p class="col-8"></p>
								<p class="col-2">작성자: ${user.name}</p>
								<p class="col-2">날짜: ${today}</p>
							</div>
							<form method="POST" id="write-notice-form">
								<input type="hidden" name="act" value="writeNotice"> 제목
								: <input
									style="width: 95%; margin-bottom: 10px; margin-left: 6px; padding-left: 5px;"
									type="text" name="title" id="title" />
								<textarea class="p-2"
									style="width: 100%; min-height: 500px; margin-bottom: 10px"
									name="content" id="content"></textarea>
							</form>
							<button type="button" class="btn-outline-sm p-4"
								id="btn-write-notice">작성하기</button>
						</div>
						<!-- end of col -->
					</div>
					<!-- end of row -->
				</div>
				<!-- end of modal-content -->
			</div>
			<!-- end of modal-dialog -->
		</div>
		<!-- end of modal -->
		<!-- end of details modal -->
		<table class="table table-hover">
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="notice" items="${notices}">
				<tr data-bs-toggle="modal" data-bs-target="#noticeDetail"
					class="notice-item">
					<td>${notice.boardid}</td>
					<td>${notice.title}</td>
					<td>${notice.author}</td>
					<td>${notice.date}</td>
					<td>${notice.hit}</td>
				</tr>
			</c:forEach>
		</table>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center mt-5">
				<c:forEach var="i" begin="1" end="${noticeNum/15+1}" step="1">
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
	<div id="noticeDetail" class="modal fade" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content content-sm">
				<div class="row">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
					<!-- end of col -->
					<div class="container" id="notice-info">
						<h3 id="detail-title"></h3>
						<div class="row sharing-row">
							작성자: <span class="col-1" id="detail-author"></span> &ensp; 날짜: <span
								class="col-2" id="detail-date"></span>
							<form method="POST" id="delete-form">
								<input type="hidden" name="act" value="deleteNotice"> <input
									type="hidden" id="detail-noticeid" name="noticeid" value="">
							</form>
							<c:if test="${user.isadmin eq 1}">
								<button class="bi bi-pencil-square col-1 btn btn-sharing-edit"
									id="btn-modify-notice"></button>
								<button class="bi bi-trash-fill col-1 btn btn-sharing-trash"
									id="btn-delete-notice"></button>
							</c:if>
						</div>
						<div class="row notice_detail">
							<p id="detail-content"></p>
						</div>
					</div>

					<div class="container" id="notice-modify" style="display: none;">
						<h3>공지사항 수정하기</h3>
						<form method="POST" id="modify-notice-form">
							<input type="hidden" name="act" value="modifyNotice"> <input
								type="hidden" id="modify-noticeid" name="noticeid" value="">
							<div class="row sharing-row">
								작성자: <span class="col-1" id="modify-author"></span> &ensp; 날짜: <span
									class="col-2" id="modify-date">${today}</span>
							</div>
							<input class="form-control mb-3" type="text" name="title"
								id="modify-title">
							<div class="row notice_detail">
								<textarea class="form-control"
									style="width: 100%; min-height: 250px" id="modify-content"
									name="content"></textarea>
							</div>
							<div class="row mt-4">
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

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		let pageItems = document.querySelectorAll(".page-item");
		pageItems.forEach(pageItem => {
			pageItem.addEventListener("click", function(){
				let pgno = pageItem.innerText;
				location.href = "${root}/board?act=listNotice&pgno="+pgno;
			});
		});
	
		let noticeItems = document.querySelectorAll(".notice-item");
		noticeItems.forEach(noticeItem => {
			noticeItem.addEventListener("click", function(){
				let noticeid = noticeItem.querySelector("td").innerText;
				
				fetch("${root}/board?act=updateNoticeHit&noticeid="+noticeid)
					.then(response => response.json())
					.then(data => {
						let hit = noticeItem.querySelectorAll("td")[4];
						hit.innerText = data.hit;
					})
				
				fetch("${root}/board?act=getNotice&noticeid="+noticeid)
					.then(response => response.json())
					.then(data => {
						document.querySelector("#detail-noticeid").value = data.boardid;
						document.querySelector("#detail-title").innerText = data.title;
						document.querySelector("#detail-author").innerText = data.author;
						document.querySelector("#detail-date").innerText = data.date;
						document.querySelector("#detail-content").innerText = data.content;
					})
			});
		});
	
		document.querySelector("#btn-close-write").addEventListener("click",
				function() {
					document.querySelector("#write-notice-form").reset();
				});
		
		document.querySelector("#btn-write-notice").addEventListener("click",
				function() {
					if (!document.querySelector("#title").value) {
						alert("공지사항 제목을 입력해주세요!!!");
						return;
					} else if (!document.querySelector("#content").value) {
						alert("공지사항 내용을 입력해주세요!!!");
						return;
					} else {
						let form = document.querySelector("#write-notice-form");
						form.setAttribute("action", "${root}/board");
						form.submit();
					}
				});
		<c:if test="${user.isadmin eq 1}">
			document.querySelector("#btn-modify-notice").addEventListener("click",
					function() {
						document.querySelector("#notice-info").style.display = "none";
						document.querySelector("#notice-modify").style.display = "";
						document.querySelector("#modify-noticeid").value = document.querySelector("#detail-noticeid").value;
						document.querySelector("#modify-title").value = document.querySelector("#detail-title").innerText;
						document.querySelector("#modify-author").innerText = document.querySelector("#detail-author").innerText;
						document.querySelector("#modify-content").value = document.querySelector("#detail-content").innerText;
					});
			

			document.querySelector("#btn-delete-notice").addEventListener("click",
					function() {
						let confirmDelete = confirm("해당 공지사항을 삭제하시겠습니까?");
				        if(confirmDelete){
							let form = document.querySelector("#delete-form");
							form.setAttribute("action", "${root}/board");
							form.submit();
				        }
					});
		</c:if>
		document.querySelector("#btn-modify").addEventListener("click",
				function() {
					let form = document.querySelector("#modify-notice-form");
					form.setAttribute("action", "${root}/board");
					form.submit();
				});
		
		document.querySelector("#btn-modify-cancel").addEventListener("click",
				function() {
					document.querySelector("#modify-notice-form").reset();
					document.querySelector("#notice-info").style.display = "";
					document.querySelector("#notice-modify").style.display = "none";
				});

        let navs = document.querySelectorAll(".nav-link");
        navs[3].classList.add("active");
	</script>
</body>
</html>
