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
		<h2 class="text-center mt-5 mb-3">회원가입</h2>

		<div class="d-flex p-3 m-3 justify-content-center align-items-center">
			<form class="text-center" id="signup-form" method="POST"
				style="width: 40%">
				 <input
					type="text"
					class="login-form-item form-control border rounded-5 p-3"
					id="signup-form-id" name="id" placeholder="아이디" />
				<div id="idcheck-result"></div>
				<input type="text"
					class="login-form-item form-control border rounded-5 p-3"
					id="signup-form-name" name="name" placeholder="이름" /> <input
					type="email"
					class="login-form-item form-control border rounded-5 p-3"
					id="signup-form-email" name="email" placeholder="E-mail" />
				<div id="emailcheck-result"></div>
				<input type="password"
					class="login-form-item form-control border rounded-5 p-3"
					id="signup-form-pwd" name="pwd" placeholder="비밀번호" /><input
					type="password"
					class="login-form-item form-control border rounded-5 p-3"
					id="signup-form-pwd-confirm" placeholder="비밀번호 확인" />
				<div id="pwdcheck-result"></div>

				<button type="button" class="btn btn-solid-lg ms-2 mt-4 mb-4"
					id="btn-signup">회원가입</button>
			</form>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	 <script>
	/* let isUseId = false;
	document.querySelector("#signup-form-id").addEventListener("keyup", function () {
	   	 let userid = this.value;
	   	 let resultDiv = document.querySelector("#idcheck-result");
	   	 
	   	 if(!userid) {
	  		 resultDiv.textContent = "";
	  		 isUseId = false;
	  	 } else if(userid.length < 5 || userid.length > 16) {
	   		 resultDiv.setAttribute("class", "text-danger");
	   		 resultDiv.textContent = "아이디는 5자 이상 16자 이하 입니다";
	   		 isUseId = false;
	   	 } else {
				fetch("${root}/user?act=idcheck&id="+userid)
					.then(response => response.text())
					.then(data => {
		    			 if(data == 0) {
		    			   resultDiv.setAttribute("class", "mb-3 text-primary");
		    		       resultDiv.textContent = userid + "는 사용할 수 있습니다.";
		    		       isUseId = true;
		    			 } else {
		    			   resultDiv.setAttribute("class", "mb-3 text-danger");
		      		       resultDiv.textContent = userid + "는 사용할 수 없습니다.";
		      		       isUseId = false;
		    			 }					
					});
	   	 }
     });

    let isEmail = false;
	document.querySelector("#signup-form-email").addEventListener("keyup", function () {
	   	 let email = this.value;
	   	 let emailDiv = document.querySelector("#emailcheck-result");
	   	 let emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	   	 
	   	 if(!email) {
	   		emailDiv.textContent = "";
	   		isEmail = false;
	  	 } else if(!emailReg.test(email)) {
	  		emailDiv.setAttribute("class", "text-danger");
	  		emailDiv.textContent = "올바른 이메일 형식이 아닙니다.";
	  		isEmail = false;
	   	 } else{
	   		emailDiv.textContent = "";
	   		isEmail = true;
	   	 }
	});
	
	let pwdConfirm = false;
	document.querySelector("#signup-form-pwd").addEventListener("keyup", function () {
	   	 let confirm = this.value;
	   	 let pwd = document.querySelector("#signup-form-pwd-confirm").value;
	   	 let confirmDiv = document.querySelector("#pwdcheck-result");
	   	 
	   	 if(!confirm) {
	   		confirmDiv.textContent = "";
	   		pwdConfirm = false;
	  	 } else if(confirm != pwd) {
	  		confirmDiv.setAttribute("class", "text-danger");
	  		confirmDiv.textContent = "비밀번호가 일치하지 않습니다.";
	  		pwdConfirm = false;
	   	 } else{
	   		confirmDiv.textContent = "";
	   		pwdConfirm = true;
	   	 }
	});
	document.querySelector("#signup-form-pwd-confirm").addEventListener("keyup", function () {
	   	 let confirm = this.value;
	   	 let pwd = document.querySelector("#signup-form-pwd").value;
	   	 let confirmDiv = document.querySelector("#pwdcheck-result");
	   	 
	   	 if(!confirm) {
	   		confirmDiv.textContent = "";
	   		pwdConfirm = false;
	  	 } else if(confirm != pwd) {
	  		confirmDiv.setAttribute("class", "text-danger");
	  		confirmDiv.textContent = "비밀번호가 일치하지 않습니다.";
	  		pwdConfirm = false;
	   	 } else{
	   		confirmDiv.textContent = "";
	   		pwdConfirm = true;
	   	 }
	}); */
	
	document.querySelector("#btn-signup").addEventListener("click", function () {
        if (!document.querySelector("#signup-form-id").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#signup-form-name").value) {
          alert("이름 입력!!");
          return;
        } else if (!document.querySelector("#signup-form-email").value) {
          alert("E-mail 입력!!");
          return;
        } else if (!document.querySelector("#signup-form-pwd").value) {
          alert("비밀번호 입력!!");
          return;
        } else if (!document.querySelector("#signup-form-pwd-confirm").value) {
            alert("비밀번호 확인 입력!!");
            return;
        /* } else if (!isUseId) {
            alert("이미 사용중인 아이디입니다!!");
            return;
        } else if (!isEmail) {
            alert("올바른 이메일 형식이 아닙니다!!");
            return;
        } else if (!pwdConfirm) {
          alert("비밀번호가 일치하지 않습니다!!");
          return; */
        } else {
          console.log("회원 가입 중~~");
          let form = document.querySelector("#signup-form");
          form.setAttribute("action", "${root}/user/signUp");
          form.submit();
        }
      });
	</script>
</body>
</html>
