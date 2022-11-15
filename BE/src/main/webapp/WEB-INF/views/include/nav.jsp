<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav id="navbarExample"
	class="navbar navbar-expand-lg fixed-top navbar-light"
	aria-label="Main navigation">
	<div class="container">
		<a class="navbar-brand logo-image" href="${root}/index"><img
			src="${root}/assets/img/logo_black.png" alt="alternative" /></a>

		<button class="navbar-toggler p-0 border-0" type="button"
			id="navbarSideCollapse" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse offcanvas-collapse"
			id="navbarsExampleDefault">
			<ul class="navbar-nav ms-auto navbar-nav-scroll">
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="${root}/index">홈</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown01"
					data-bs-toggle="dropdown" aria-expanded="false">관광지조회</a>
					<ul class="dropdown-menu" aria-labelledby="dropdown01">
						<li><a class="dropdown-item"
							href="${root}/spot/locationSearch">지역별조회</a></li>
						<li><div class="dropdown-divider"></div></li>
						<li><a class="dropdown-item"
							href="${root}/spot/mapSearch">지도로조회</a></li>
					</ul></li>
				<c:if test="${!empty user}">
				<li class="nav-item">
				<a class="nav-link"
					href="${root}/schedule">여행스케줄</a></li>
				</c:if>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown01"
					data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
					<ul class="dropdown-menu" aria-labelledby="dropdown01">
						<li><a class="dropdown-item"
							href="${root}/board/listNotice/1">공지사항</a></li>
						<li><div class="dropdown-divider"></div></li>
						<li><a class="dropdown-item"
							href="${root}/board/listBoard/1">여행정보공유</a></li>
					</ul></li>
				<c:if test="${!empty user}">
					<li class="nav-item"><a class="nav-link"
						href="${root}/user/mypage">마이페이지</a></li>
				</c:if>
			</ul>

			<span class="nav-item"> <c:if test="${empty user}">
					<a class="btn-solid-sm" href="${root}/user/login">로그인</a>
				</c:if> <c:if test="${!empty user}">
					<a class="btn-solid-sm" href="${root}/user/logout">로그아웃</a>
				</c:if>
			</span>
		</div>
	</div>
</nav>