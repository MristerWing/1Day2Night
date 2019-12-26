
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<c:set var="root" value="${pageContext.request.contextPath}" />
<html lang="zxx">

<head>
<title>ODTN-Perfect camping 4 U</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords"
	content="Camping Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
		
	}
</script>
<!-- //Meta tag Keywords -->

<!-- Custom-Files -->
<link rel="stylesheet" href="${root}/resources/css/styles/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="${root}/resources/css/styles/style.css"
	type="text/css" media="all" />
<!-- Style-CSS -->
<!-- font-awesome-icons -->
<link href="${root}/resources/css/styles/font-awesome.css"
	rel="stylesheet">
<!-- //font-awesome-icons -->
<!-- /Fonts -->
<link
	href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800"
	rel="stylesheet">
<!-- //Fonts -->

</head>

<body>
	<!-- mian-content -->
	<div class="main-content" id="home">
		<!-- header -->
		<header class="header">
			<div class="container">
				<!-- nav -->
				<nav class="py-3">
					<div id="logo">
						<img class="logoImg" src="${root}/resources/images/ODTN.png" width="50">
						<h1>
							<a class="navbar-brand" href="#">ODTN</a>
						</h1>
					</div>

<!-- 회원가입, 로그인 뜨지 않는 경우 ${sessionScope.email} 처럼 변수마다 앞에 sessionScope. 붙여봐야 할 거에요 -->
					<label for="drop" class="toggle">Menu</label> <input
						type="checkbox" id="drop" />
					<ul class="menu mt-2">
					<c:if test="${user_num==null}">
						<c:if test="${user_auth_id==null}">
							<c:if test="${email == null}">
								<li><a href="${root}/member/beforeRegister.do">
								회원가입</a></li>
							</c:if>
						<li><a href="${root}/member/login.do">로그인</a></li>
						</c:if>
					</c:if>
						<c:if test="${user_num != null}">
							<c:if test="${user_auth_id == null}">
								<c:if test="${register_type == null}">
									<li><a href="${root}/member/logout.do">로그아웃</a></li>
									<c:if test="${email == 'egeoda@protonmail.com'}">
										&nbsp;&nbsp;<a href="${root}/member/adminPage.do">관리자 페이지</a>
									</c:if>	
									<c:if test="${email=='chanhok95@naver.com'}">
										&nbsp;&nbsp;<a href="${root}/member/adminPage.do">관리자 페이지</a>
									</c:if>
								</c:if>
							</c:if>
							<c:if test="${user_auth_id != null}">
								<c:if test="${register_type != null}">
									<li><a href="${root}/member/kakaoLogout.do">카카오 로그아웃</a></li>
								</c:if>
							</c:if>
						</c:if>
						<li class="active"><a href="${root}/search/list.do">캠핑장검색</a></li>
						<!-- First Tier Drop Down -->
						<li><label for="drop-2" class="toggle">Drop Down <span
								class="fa fa-angle-down" aria-hidden="true"></span>
						</label> <a href="#">캠핑톡 <span class="fa fa-angle-down"
								aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
							<ul>
								<li><a href="${root}/board/campInfo/list.do">캠핑공지</a></li>
								<li><a href="${root}/board/campReview/list.do">캠핑후기</a></li>

							</ul></li>
						<li> 
							<!-- First Tier Drop Down --> 
							<label for="drop-2" class="toggle">DropDown <span class="fa fa-angle-down" aria-hidden="true"></span>
						</label> <a href="#">고객센터 <span class="fa fa-angle-down"
								aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
							<ul>
								<li><a href="${root}/board/campQnA/list.do">캠핑문의</a></li>
							</ul>
						</li>

					</ul>
				</nav>
			</div>
		</header>
		<!-- //header -->
	</div>
	<!-- //main-content -->
</body>
</html>