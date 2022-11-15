<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
  </head>
<body data-bs-spy="scroll" data-bs-target="#navbarExample">
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="container" style="min-height: 750px">
		<div style="height: 70px"></div>

		<c:if test="${kind eq 'id'}">
			<h2 class="text-center mt-5 mb-3">아이디 찾기</h2>

			<div class="d-flex p-3 m-3 justify-content-center align-items-center"
				id="find-id">
				<!-- 
				<div class="mt-5">
					<h3>xxx님의 아이디는 xxx입니다.</h3>
				</div>
				 -->
				<form class="text-center" id="find-id-form" method="POST"
					style="width: 45%">
					<input type="text"
						class="login-form-item form-control border rounded-5 p-3"
						id="findid-form-name" name="name" placeholder="이름" /> <input
						type="email"
						class="login-form-item form-control border rounded-5 p-3"
						id="findid-form-email" name="email" placeholder="E-mail" />
					<button type="button" class="btn btn-solid-lg me-2 mt-3 mb-4 w-100"
						id="btn-find-id">아이디 찾기</button>
					<br />
					<div class="mt-3">
						<a class="login-options" href="${root}/user/login">로그인 </a>
						| <a class="login-options" href="${root}/user/signup">회원
							가입</a><br />
					</div>
				</form>
			</div>
		</c:if>

		<c:if test="${kind eq 'pwd'}">
			<h2 class="text-center mt-5 mb-3">비밀번호 찾기</h2>

			<div class="d-flex p-3 m-3 justify-content-center align-items-center"
				id="find-pwd">
				<form class="text-center" id="find-pwd-form" method="POST"
					style="width: 45%">
					<input type="text"
						class="login-form-item form-control border rounded-5 p-3"
						id="findpwd-form-id" name="id" placeholder="아이디" /> <input
						type="email"
						class="login-form-item form-control border rounded-5 p-3"
						id="findpwd-form-email" name="email" placeholder="E-mail" />
					<button type="button" class="btn btn-solid-lg me-2 mt-3 mb-4 w-100"
						id="btn-find-pwd">비밀번호 찾기</button>
					<br />
					<div class="mt-3">
						<a class="login-options" href="${root}/user/login">로그인 </a>
						| <a class="login-options" href="${root}/user/signup">회원
							가입</a><br />
					</div>
				</form>
			</div>
		</c:if>

	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		<c:if test="${kind eq 'id'}">
		document.querySelector("#btn-find-id").addEventListener("click",
				function() {
					let name = document.querySelector("#findid-form-name").value;
					let email = document.querySelector("#findid-form-email").value;
					if (!name) {
						alert("이름 입력!!");
						return;
					} else if (!email) {
						alert("이메일 입력!!");
						return;
					} else {
						fetch("${root}/user/findId/"+name + "/" + email)
							.then(response => response.json())
							.then(data => {
								let resultDiv = document.querySelector("#find-id");
								if(data != null){
									resultDiv.innerHTML = `
										<div class="mt-5 text-center">
											<h3>\${data.name}님의 아이디는 \${data.id}입니다.</h3>
											<button class="btn btn-solid-lg mt-4" id="btn-login">로그인</button>
										</div>
									`;									
									document.querySelector("#btn-login").addEventListener("click", function(){
										location.href= "${root}/user/login";
									});
								} else {
									resultDiv.innerHTML = `
										<div class="mt-5 text-center">
											<h3>등록된 계정이 없습니다. </br>회원가입 후 이용해주세요.</h3>
											<button class="btn btn-solid-lg mt-4" id="btn-singup">회원가입</button>
										</div>
									`;
									document.querySelector("#btn-singup").addEventListener("click", function(){
										location.href= "${root}/user/signup";
									});
								}
							})
					}
				});
		</c:if>
		
		<c:if test="${kind eq 'pwd'}">
		document.querySelector("#btn-find-pwd").addEventListener("click",
				function() {
					let id = document.querySelector("#findpwd-form-id").value;
					let email = document.querySelector("#findpwd-form-email").value;
					if (!id) {
						alert("아이디 입력!!");
						return;
					} else if (!email) {
						alert("이메일 입력!!");
						return;
					} else {
						fetch("${root}/user/findPwd/"+id + "/" + email)
							.then(response => response.text())
							.then(data => {
								console.log("변경된 비밀번호는 "+data);
								let resultDiv = document.querySelector("#find-pwd");
								if(data != ""){
									resultDiv.innerHTML = `
										<div class="mt-5 text-center">
											<h3>\${id}님의 임시 비밀번호는 \${data}입니다.</br>로그인 후 비밀번호를 수정해주세요.</h3>
											<button class="btn btn-solid-lg mt-4" id="btn-login">로그인</button>
										</div>
									`;									
									document.querySelector("#btn-login").addEventListener("click", function(){
										location.href= "${root}/user/login";
									});
								} else {
									resultDiv.innerHTML = `
										<div class="mt-5 text-center">
											<h3>등록된 계정이 없습니다. </br>회원가입 후 이용해주세요.</h3>
											<button class="btn btn-solid-lg mt-4" id="btn-singup">회원가입</button>
										</div>
									`;
									document.querySelector("#btn-singup").addEventListener("click", function(){
										location.href= "${root}/user/signup";
										
									});
								}
							})
					}
				});
		</c:if>
	</script>
</body>
</html>
