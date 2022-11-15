<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbarExample">
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<c:if test="${!empty user}">
		<div class="container" style="min-height: 700px">
			<div style="height: 70px"></div>
			<h2 class="text-center mt-5 mb-3">마이페이지</h2>
			<div class="section-button-group mt-4 d-flex justify-content-center">
				<button class="btn-change-section btn-outline-sm me-4"
					id="btn-favorite">즐겨찾기</button>
				<button class="btn-change-section btn-outline-sm me-4"
					id="btn-review">내 리뷰</button>
				<button class="btn-change-section btn-outline-sm me-4"
					id="btn-schedule">내 스케줄</button>
				<button class="btn-change-section btn-outline-sm me-4"
					id="btn-edit-profile">회원정보 수정</button>
			</div>

			<section class="section-mypage mt-4 mb-5 p-3 border" id="favorite"
				style="display: none">
				<div class="section-item-title border-bottom pb-2 mb-4">
					<i class="fas fa-regular fa-location-dot"></i> 즐겨 찾는 관광지
				</div>
				<div class="grid d-flex justify-content-start flex-wrap"
					id="my-hotspots" style="max-width: 90%"></div>

				<div class="section-item-title border-bottom pb-2 mb-4">
					<i class="fa-solid fa-route"></i> 즐겨 찾는 스케줄
				</div>
				<div class="row d-flex justify-content-start flex-wrap"
					id="liked-schedules"></div>
			</section>

			<section class="section-mypage mt-4 mb-5 p-3 border" id="review"
				style="display: none">
				<div class="section-item-title border-bottom pb-2 mb-4">
					<i class="bi bi-chat-square-quote"></i> 내가 남긴 리뷰
				</div>
				<ul class="list-unstyled" id="my-reviews">

				</ul>
			</section>

			<section class="section-mypage mt-4 mb-5 p-3 border" id="schedule"
				style="display: none">
				<div class="section-item-title border-bottom pb-2 mb-4">
					<i class="fa-solid fa-route"></i> 내가 작성한 스케줄
				</div>
				<div class="row d-flex justify-content-start flex-wrap"
					id="my-schedules"></div>
			</section>

			<section class="section-mypage mt-4 mb-5 p-3 border"
				id="edit-profile" style="display: none">
				<div class="section-item-title border-bottom pb-2 mb-4">
					<i class="fa-solid fa-user"></i> 회원정보 수정
				</div>
				<div class="row d-flex justify-content-center">
					<form class="text-center" id="edit-form" method="POST"
						style="width: 50%">
						<input type="hidden" name="uid" value="${user.uid}"> <input
							type="hidden" name="id" value="${user.id}">
						<div class="row w-100 d-flex flex-nowrap align-items-center m-0">
							<label class="col-md-2 text-start" for="edit-form-id">아이디
								: </label> <input type="text"
								class="edit-form-item form-control border rounded-5 col-md-10 w-75"
								id="edit-form-id" value="${user.id}" disabled />
						</div>
						<div class="row w-100 d-flex flex-nowrap align-items-center m-0">
							<label class="col-md-2 text-start" for="edit-form-name">이름
								: </label> <input type="text"
								class="edit-form-item form-control border rounded-5 col-md-10 w-75"
								id="edit-form-name" name="name" value="${user.name}" />
						</div>
						<div class="row w-100 d-flex flex-nowrap align-items-center m-0">
							<label class="col-md-2 text-start" for="edit-form-email">E-mail
								: </label> <input type="email"
								class="edit-form-item form-control border rounded-5 col-md-10 w-75"
								id="edit-form-email" name="email" value="${user.email}" />
						</div>
						<div id="emailcheck-result"></div>
						<div class="row w-100 d-flex flex-nowrap align-items-center m-0">
							<label class="col-md-2 text-start" for="edit-form-password"
								style="font-size: smaller">비밀번호 : </label> <input
								type="password"
								class="edit-form-item form-control border rounded-5 col-md-10 w-75"
								id="edit-form-pwd" name="pwd" value="${user.pwd}" />
						</div>
						<div class="row w-100 d-flex flex-nowrap align-items-center m-0">
							<label class="col-md-2 text-start" for="edit-form-password"
								style="font-size: smaller">비밀번호 확인: </label> <input
								type="password"
								class="edit-form-item form-control border rounded-5 col-md-10 w-75"
								id="edit-form-pwd-confirm" value="${user.pwd}" />
						</div>
						<div id="pwdcheck-result"></div>
						<div class="mt-3 mb-3">
							<button type="button" class="btn btn-solid-sm me-4"
								id="btn-update">
								<i class="fa-solid fa-user-pen" style="color: white"></i> 회원정보
								수정
							</button>
							<button type="button" class="btn btn-solid-sm-point"
								id="btn-remove">
								<i class="fa-solid fa-user-xmark" style="color: white"></i> 회원
								탈퇴
							</button>
						</div>
					</form>
				</div>
			</section>
		</div>
		<div id="editReview" class="modal fade" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content content-sm">
					<div class="row">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" id="btn-close-edit-review"></button>
						<!-- end of col -->
						<div class="container" id="edit-review">
							<h3>리뷰 수정하기</h3>
							<form method="POST" id="edit-review-form">
								<div class="row sharing-row">
									작성자: <span class="col-1" id="author">${user.name}</span>
								</div>
								<input type="hidden" name="reviewid" id="edit-reviewid" value="" />
								<div class="stars w-40 mb-3">
									<input class="star star-5" id="star-5" type="radio" name="star"
										value="5" /> <label class="star star-5" for="star-5"></label>
									<input class="star star-4" id="star-4" type="radio" name="star"
										value="4" /> <label class="star star-4" for="star-4"></label>
									<input class="star star-3" id="star-3" type="radio" name="star"
										value="3" /> <label class="star star-3" for="star-3"></label>
									<input class="star star-2" id="star-2" type="radio" name="star"
										value="2" /> <label class="star star-2" for="star-2"></label>
									<input class="star star-1" id="star-1" type="radio" name="star"
										value="1" /> <label class="star star-1" for="star-1"></label>
								</div>
								<div class="row review_detail">
									<textarea class="form-control"
										style="width: 100%; min-height: 250px"
										id="edit-review-content" name="content"></textarea>
								</div>
								<div class="row mt-4">
									<div class="col-3"></div>
									<div class="col-6">
										<button type="submit" class="btn-outline-sm p-4 me-2"
											id="btn-edit-review">수정하기</button>
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
	</c:if>
	<c:if test="${empty user}">
		<%
			request.setAttribute("msg", "로그인 후 사용해주세요!!!");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(request, response);
		%>
	</c:if>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
	let isEmail = true;
	document.querySelector("#edit-form-email").addEventListener("keyup", function () {
		 isEmail = false;
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
	
	let pwdConfirm = true;
	document.querySelector("#edit-form-pwd").addEventListener("keyup", function () {
		pwdConfirm = false;
	   	 let confirm = this.value;
	   	 let pwd = document.querySelector("#edit-form-pwd-confirm").value;
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
	
	document.querySelector("#edit-form-pwd-confirm").addEventListener("keyup", function () {
		 pwdConfirm = false;
	   	 let confirm = this.value;
	   	 let pwd = document.querySelector("#edit-form-pwd").value;
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
	
	document.querySelector("#btn-update").addEventListener("click", function () {
        if (!document.querySelector("#edit-form-name").value) {
          alert("이름 입력!!");
          return;
        } else if (!document.querySelector("#edit-form-email").value) {
          alert("E-mail 입력!!");
          return;
        } else if (!document.querySelector("#edit-form-pwd").value) {
          alert("비밀번호 입력!!");
          return;
        } else if (!document.querySelector("#edit-form-pwd-confirm").value) {
            alert("비밀번호 확인 입력!!");
            return;
        } else if (!isEmail) {
            alert("올바른 이메일 형식이 아닙니다!!");
            return;
        } else if (!pwdConfirm) {
          alert("비밀번호가 일치하지 않습니다!!");
          return;
        } else {
          let form = document.querySelector("#edit-form");
          form.setAttribute("action", "${root}/user/updateUser");
          form.submit();
        }
      });
	
	document.querySelector("#btn-remove").addEventListener("click", function () {
        let removeConfirm = confirm("당신의 회원정보가 삭제되며 다시 복구되지 않습니다.\n정말 탈퇴하시겠습니까?");
        if(removeConfirm){
        	location.href = "${root}/user?act=removeUser";
        }
      });
	
	document.querySelector("#btn-favorite").addEventListener("click", function () {
        let buttons = document.querySelectorAll(".btn-change-section");
        for (let i = 0; i < buttons.length; i++) {
          const button = buttons[i];
          button.setAttribute("class", "btn-change-section btn-outline-sm me-4");
        }
        this.setAttribute("class", "btn-change-section btn-solid-sm me-4");
        let sections = document.querySelectorAll(".section-mypage");
        for (let i = 0; i < sections.length; i++) {
          const section = sections[i];
          section.style.display = "none";
        }
        
        fetch("${root}/social/getLikedSpots")
        	.then(response => response.json())
        	.then(datas => {
        		let mySpots = document.querySelector("#my-hotspots");
        		let spotItem = ``;
        		datas.forEach(data => {
        			spotItem += `
        				<div class="element-item hotspot" style="position: relative; margin-right: 3%;">
	        				<button class="btn btn-danger"
	        					style="width: 25px; height: 25px; position: absolute; margin: 5px; top: -50; right: 0; border-radius: 100%; padding: 0;"
	        					onclick="removeDiv(this, \${data.spotid})">
	        					<i class="fa-solid fa-minus" style="color: white"></i>
	        				</button>
	        				<a
	        					href="${root}/spot/detail/\${data.spotid}">
	        					<img src="\${data.image}" alt="\${data.title}" onerror="this.src='${root}/assets/img/noImg.jpg'"
	        					height=200px width=292px/> <p>
	        					<strong>\${data.title}</strong><br /> \${data.address}
	        					</p>
	        				</a>
        				</div>
        			`;
        		});
        		mySpots.innerHTML = spotItem;
        	})
        
        var imagePath;
		var spotTitles="";
        function getSpots(scheduleid,scheduleItem){
				fetch("${root}/schedule/spotsInSchedule/"+scheduleid)
        			.then(response => response.json())
        			.then(spots => {
        				spotTitles="";
        				imagePath = spots[0].image;
        				for (var i = 0; i < spots.length - 1; i++) {
							spotTitles += spots[i].title + " -> ";
						}
        				spotTitles += spots[spots.length - 1].title;
        				document.getElementById(scheduleid).querySelector(".schedule-img").src = imagePath;
        				document.getElementById(scheduleid).querySelector(".schedule-card").innerText = spotTitles;
        			})
        }
        
        fetch("${root}/social/getLikedSchedules")
        	.then(response => response.json())
        	.then(schedules => {
        		let likedSchedules = document.querySelector("#liked-schedules");
        		let scheduleItems = ``;
        		schedules.forEach(schedule => {
        			let themeIcon = "";
					if(schedule.theme == "food"){
						themeIcon = `<span style="font-size: smaller;"><i class="fa-solid fa-utensils" style="color: inherit"></i></span>`;
					}else if (schedule.theme == "activity"){
						themeIcon = `<span style="font-size: smaller;"><i class="fa-solid fa-person-running" style="color: inherit"></i></span>`;
					}else if (schedule.theme == "healing"){
						themeIcon = `<span style="font-size: smaller;"><i class="fa-brands fa-gratipay" style="color: inherit"></i></span>`;						
					}
					
        			let scheduleItem = `
        				<div class="card ms-3 me-3 mb-3 pt-2" id="\${schedule.scheduleid}" style="width: 30%">
	        				<button class="btn btn-danger"
								style="width: 25px; height: 25px; position: absolute; margin: 5px; top: -50; right: 0; border-radius: 100%; padding: 0;"
								onclick="removeLikedSchedule(this, \${schedule.scheduleid})">
								<i class="fa-solid fa-minus" style="color: white"></i>
							</button>
	        				<img class="schedule-img" src="${imagePath}" class="card-img-top" alt="\${schedule.title}" 
	    					onerror="this.src='${root}/assets/img/noImg.jpg'" width=300px height=300px/>
	    					<div class="card-body">
								<p class="card-title">\${themeIcon}&ensp;\${schedule.title}</p>
								<p class="card-text schedule-card" id="spotTitles"></p>
							</div>
						</div>
        			`;        	
        			getSpots(schedule.scheduleid,scheduleItem);
        			scheduleItems += scheduleItem;
        		});
        		likedSchedules.innerHTML = scheduleItems;
        	})
        
        document.querySelector("#favorite").style.display = "";
      });
	
	  function removeLikedSchedule(ele, scheduleid) {
    	let confirmDelete = confirm("해당 스케줄을 즐겨찾기 목록에서 제거하시겠습니까?")
    	if(confirmDelete){
    		fetch("${root}/social/deleteLikeSchedule/"+scheduleid)
      		.then(response => response.text())
      		.then(data => {
      			if(data == 1){
      				ele.parentElement.style.display = "none";
      			}
  			})
    	}
      }
	
	  document.querySelector("#btn-review").addEventListener("click", function () {
        let buttons = document.querySelectorAll(".btn-change-section");
        for (let i = 0; i < buttons.length; i++) {
          const button = buttons[i];
          button.setAttribute("class", "btn-change-section btn-outline-sm me-4");
        }
        this.setAttribute("class", "btn-change-section btn-solid-sm me-4");
        let sections = document.querySelectorAll(".section-mypage");
        for (let i = 0; i < sections.length; i++) {
          const section = sections[i];
          section.style.display = "none";
        }
        
        fetch("${root}/social/getUserReviews")
        	.then(response => response.json())
        	.then(reviews => {
        		let myReviews = document.querySelector("#my-reviews");
        		let reviewItems = ``;
    
        		reviews.forEach(review => {
        			reviewItems += `
        				<li class="row mt-3 mb-3">
							<img class="mr-3 col-2" src="\${review.image}" onerror="this.src='${root}/assets/img/noImg.jpg'" alt="\${review.spotid}">
							<div class="media-body col-10">
								<div class="row">
									<div class="col-4 review-star">`
						for (var i = 0; i < review.score; i++) {
							reviewItems += `<i class="bi bi-star-fill"></i>`;
						}
						reviewItems+=`</div>
								<div class="col-4"></div>
								<div class="col-4 text-end pe-4">
									<button class="btn btn-solid-sm"  data-bs-toggle="modal" data-bs-target="#editReview" 
									onclick="showEditReview(\${review.reviewid}, \${review.score}, '\${review.content.trim()}')">
									<i class="fa-solid fa-pen-to-square" style="color: inherit" ></i> 수정</button>
									<button class="btn btn-solid-sm-point" onclick="deleteReview(\${review.reviewid})"><i class="fa-solid fa-trash" style="color: inherit"></i> 삭제</button>
								</div>				    	
							</div>
							<h5 class="mt-0 mb-1">\${review.title}</h5>
							\${review.content}
							</div>
    					</li>
        			`;
        		})
        		myReviews.innerHTML = reviewItems;
        	})
        
        document.querySelector("#review").style.display = "";
      });
	
	  function showEditReview(reviewid, score, content){
		  document.querySelector("#edit-reviewid").value = reviewid;
		  document.querySelector("#star-"+score).checked = true;
		  document.querySelector("#edit-review-content").value = content;
	  }
	  
	  function deleteReview(reviewid){
		  let confirmDeleteReview = confirm("해당 리뷰를 삭제하시겠습니까?");
		  if(confirmDeleteRzzzeview){
			  fetch("${root}/social/deleteReview", {
				  method: 'POST',
				  headers: {'Content-type': 'application/x-www-form-urlencoded'},
				  body: 'reviewid='+reviewid
				  })
			.then(response => response.text())
			.then(data => {
				if (data == 1) {
					alert("리뷰가 삭제 되었습니다!!");
					
					fetch("${root}/social/getUserReviews")
		        	.then(response => response.json())
		        	.then(reviews => {
		        		let myReviews = document.querySelector("#my-reviews");
		        		let reviewItems = ``;
		        		
		        		reviews.forEach(review => {
		        			reviewItems += `
		        				<li class="row mt-3 mb-3">
		    				    <img class="mr-3 col-2" src="\${review.image}" onerror="this.src='${root}/assets/img/noImg.jpg'" alt="\${review.spotid}">
		    				    <div class="media-body col-10">
		    				    	<div class="row">
		    					    	<div class="col-4 review-star">`
		    				for (var i = 0; i < review.score; i++) {
								reviewItems += `<i class="bi bi-star-fill"></i>`;
							}
		    				reviewItems+=`</div>
		    							<div class="col-4"></div>
		    							<div class="col-4 text-end pe-4">
		    								<button class="btn btn-solid-sm"  data-bs-toggle="modal" data-bs-target="#editReview" 
		    								onclick="showEditReview(\${review.reviewid}, \${review.score}, '\${review.content.trim()}')">
		    								<i class="fa-solid fa-pen-to-square" style="color: inherit" ></i> 수정</button>
		    								<button class="btn btn-solid-sm-point" onclick="deleteReview(\${review.reviewid})"><i class="fa-solid fa-trash" style="color: inherit"></i> 삭제</button>
		    							</div>				    	
		    				    	</div>
		    				      <h5 class="mt-0 mb-1">\${review.title}</h5>
		    				      \${review.content}
		    				    </div>
		    				  </li>
		        			`;
		        		})
		        		myReviews.innerHTML = reviewItems;
		        	})
				}
			})
		  }
	  }
	  
	  document.querySelector("#btn-close-edit-review").addEventListener("click", function(){
		  document.querySelector("#edit-review-form").reset();
	  });
	  
	  document.querySelector("#btn-edit-review").addEventListener("click", function(){
		  bootstrap.Modal.getInstance("#editReview").hide();
	  });
	  
	  document.querySelector("#edit-review-form").addEventListener("submit", function(e){
		  e.preventDefault();
		  
		  let reviewid = document.querySelector("#edit-reviewid").value;
		  let score = document.querySelector("input[name='star']:checked").value;
		  let content = document.querySelector("#edit-review-content").value;
		  let edited = false;
		  
		  fetch("${root}/social/updateReview", {
				  method: 'POST',
				  headers: {'Content-type': 'application/x-www-form-urlencoded'},
				  body: 'reviewid='+reviewid+'&score='+score+'&content='+content
				  })
			.then(response => response.text())
			.then(data => {
				if (data == 1) {
					alert("리뷰가 수정 되었습니다!!");
					
					fetch("${root}/social/getUserReviews")
		        	.then(response => response.json())
		        	.then(reviews => {
		        		let myReviews = document.querySelector("#my-reviews");
		        		let reviewItems = ``;
		        		
		        		reviews.forEach(review => {
		        			reviewItems += `
		        				<li class="row mt-3 mb-3">
		    				    <img class="mr-3 col-2" src="\${review.image}" onerror="this.src='${root}/assets/img/noImg.jpg'" alt="\${review.spotid}">
		    				    <div class="media-body col-10">
		    				    	<div class="row">
		    					    	<div class="col-4 review-star">`
		    				for (var i = 0; i < review.score; i++) {
								reviewItems += `<i class="bi bi-star-fill"></i>`;
							}
		    				reviewItems+=`</div>
		    							<div class="col-4"></div>
		    							<div class="col-4 text-end pe-4">
		    								<button class="btn btn-solid-sm"  data-bs-toggle="modal" data-bs-target="#editReview" 
		    								onclick="showEditReview(\${review.reviewid}, \${review.score}, '\${review.content.trim()}')">
		    								<i class="fa-solid fa-pen-to-square" style="color: inherit" ></i> 수정</button>
		    								<button class="btn btn-solid-sm-point" onclick="deleteReview(\${review.reviewid})"><i class="fa-solid fa-trash" style="color: inherit"></i> 삭제</button>
		    							</div>				    	
		    				    	</div>
		    				      <h5 class="mt-0 mb-1">\${review.title}</h5>
		    				      \${review.content}
		    				    </div>
		    				  </li>
		        			`;
		        		})
		        		myReviews.innerHTML = reviewItems;
		        	})
				}
			})
			
		  });
	  
      document.querySelector("#btn-schedule").addEventListener("click", function () {
        let buttons = document.querySelectorAll(".btn-change-section");
        for (let i = 0; i < buttons.length; i++) {
          const button = buttons[i];
          button.setAttribute("class", "btn-change-section btn-outline-sm me-4");
        }
        this.setAttribute("class", "btn-change-section btn-solid-sm me-4");
        let sections = document.querySelectorAll(".section-mypage");
        for (let i = 0; i < sections.length; i++) {
          const section = sections[i];
          section.style.display = "none";
        }
        
		var imagePath;
		var spotTitles="";
        function getSpots(scheduleid,scheduleItem){

			fetch("${root}/schedule/spotsInSchedule/"+scheduleid)
        				.then(response => response.json())
        				.then(spots => {
        					spotTitles="";
        					imagePath = spots[0].image;
        					for (var i = 0; i < spots.length - 1; i++) {
								spotTitles += spots[i].title + " -> ";
							}
        					spotTitles += spots[spots.length - 1].title;
        					document.getElementById(scheduleid).querySelector(".schedule-img").src = imagePath;
        					document.getElementById(scheduleid).querySelector(".schedule-card").innerText = spotTitles;
        				})
		}
        fetch("${root}/schedule/scheduleList")
        	.then(response => response.json())
        	.then(schedules => {
        		let mySchedules = document.querySelector("#my-schedules");
	        	let scheduleItems = ``;
        		
        		schedules.forEach(schedule => {
					let themeIcon = "";
					if(schedule.theme == "food"){
						themeIcon = `<span style="font-size: smaller;"><i class="fa-solid fa-utensils" style="color: inherit"></i></span>`;
					}else if (schedule.theme == "activity"){
						themeIcon = `<span style="font-size: smaller;"><i class="fa-solid fa-person-running" style="color: inherit"></i></span>`;
					}else if (schedule.theme == "healing"){
						themeIcon = `<span style="font-size: smaller;"><i class="fa-brands fa-gratipay" style="color: inherit"></i></span>`;						
					}
        			
        			let scheduleItem = `
        				<div class="card ms-3 me-3 mb-3 pt-2" id="\${schedule.scheduleid}" style="width: 30%">
	        				<img class="schedule-img" src="${imagePath}" class="card-img-top" alt="\${schedule.title}" 
	    					onerror="this.src='${root}/assets/img/noImg.jpg'" width=300px height=300px/>
	    					<div class="card-body">
								<p class="card-title">\${themeIcon}&ensp;\${schedule.title}</p>
								<p class="card-text schedule-card" id="spotTitles"></p>
		    					<div class="text-end">
									<button class="btn btn-solid-sm-point" onclick="deleteSchedule(\${schedule.scheduleid})">
										<i class="fa-solid fa-trash" style="color: inherit"></i> 삭제
									</button>
								</div>
							</div>
						</div>
        			`;        		
        			/*
        			<button class="btn btn-solid-sm">
						<i class="fa-solid fa-pen-to-square" style="color: inherit">\${spotTitles}</i>
						편집
					</button>
					*/
        			getSpots(schedule.scheduleid,scheduleItem);
        			scheduleItems += scheduleItem;
        		});
        		mySchedules.innerHTML = scheduleItems;
        	})
        
        document.querySelector("#schedule").style.display = "";
      });
	
      function deleteSchedule(scheduleid){
    	  let confirmDeleteSchedule = confirm("해당 스케줄을 삭제하시겠습니까?");
		  if(confirmDeleteSchedule){
			fetch("${root}/schedule/deleteSpots/"+scheduleid)
			  
			fetch("${root}/schedule/deleteSchedule"+scheduleid)
				.then(response => response.text())
				.then(data => {
					if(data == 1){
						alert("스케줄이 삭제되었습니다!!");
						
						var imagePath;
						var spotTitles="";
				        function getSpots(scheduleid,scheduleItem){

							fetch("${root}/schedule/spotsInSchedule/"+scheduleid)
				        				.then(response => response.json())
				        				.then(spots => {
				        					spotTitles="";
				        					imagePath = spots[0].image;
				        					for (var i = 0; i < spots.length - 1; i++) {
												spotTitles += spots[i].title + " -> ";
											}
				        					spotTitles += spots[spots.length - 1].title;
				        					document.getElementById(scheduleid).querySelector(".schedule-img").src = imagePath;
				        					document.getElementById(scheduleid).querySelector(".schedule-card").innerText = spotTitles;
				        				})
						}
				        fetch("${root}/schedule/scheduleList")
				        	.then(response => response.json())
				        	.then(schedules => {
				        		let mySchedules = document.querySelector("#my-schedules");
					        	let scheduleItems = ``;
				        		
				        		schedules.forEach(schedule => {
									let themeIcon = "";
									if(schedule.theme == "food"){
										themeIcon = `<span style="font-size: smaller;"><i class="fa-solid fa-utensils" style="color: inherit"></i></span>`;
									}else if (schedule.theme == "activity"){
										themeIcon = `<span style="font-size: smaller;"><i class="fa-solid fa-person-running" style="color: inherit"></i></span>`;
									}else if (schedule.theme == "healing"){
										themeIcon = `<span style="font-size: smaller;"><i class="fa-brands fa-gratipay" style="color: inherit"></i></span>`;						
									}
				        			
				        			let scheduleItem = `
				        				<div class="card ms-3 me-3 mb-3 pt-2" id="\${schedule.scheduleid}" style="width: 30%">
					        				<img class="schedule-img" src="${imagePath}" class="card-img-top" alt="\${schedule.title}" 
					    					onerror="this.src='${root}/assets/img/noImg.jpg'" width=300px height=300px/>
					    					<div class="card-body">
												<p class="card-title">\${themeIcon}&ensp;\${schedule.title}</p>
												<p class="card-text schedule-card" id="spotTitles"></p>
						    					<div class="text-end">
													<button class="btn btn-solid-sm-point" onclick="deleteSchedule(\${schedule.scheduleid})">
														<i class="fa-solid fa-trash" style="color: inherit"></i> 삭제
													</button>
												</div>
											</div>
										</div>
				        			`;        			
				        			/*
				        			<button class="btn btn-solid-sm">
										<i class="fa-solid fa-pen-to-square" style="color: inherit">\${spotTitles}</i>
										편집
									</button>
									*/
				        			getSpots(schedule.scheduleid,scheduleItem);
				        			scheduleItems += scheduleItem;
				        		});
				        		mySchedules.innerHTML = scheduleItems;
				        	})
					}
				})
		  }  	
      }
      
      document.querySelector("#btn-edit-profile").addEventListener("click", function () {
        let buttons = document.querySelectorAll(".btn-change-section");
        for (let i = 0; i < buttons.length; i++) {
          const button = buttons[i];
          button.setAttribute("class", "btn-change-section btn-outline-sm me-4");
        }
        this.setAttribute("class", "btn-change-section btn-solid-sm me-4");
        let sections = document.querySelectorAll(".section-mypage");
        for (let i = 0; i < sections.length; i++) {
          const section = sections[i];
          section.style.display = "none";
        }
        document.querySelector("#edit-profile").style.display = "";
      });

      function removeDiv(ele, spotid) {
    	let confirmDelete = confirm("해당 관광지를 즐겨찾기 목록에서 제거하시겠습니까?")
    	if(confirmDelete){
    		fetch("${root}/social/deleteLikeSpot/"+spotid)
	      		.then(response => response.text())
	      		.then(data => {
	      			if(data == 1){
	      				ele.parentElement.style.display = "none";
	      			}
      			})
    	}
      }
      

      let navs = document.querySelectorAll(".nav-link");
      navs[4].classList.add("active");
	</script>
</body>
</html>
