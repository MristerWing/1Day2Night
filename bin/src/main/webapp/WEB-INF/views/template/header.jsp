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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="${root}/resources/css/test/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="${root}/resources/css/test/style.css"
	type="text/css" media="all" />
<!-- Style-CSS -->
<!-- font-awesome-icons -->
<link href="${root}/resources/css/test/font-awesome.css"
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
	<div class="main-content inner" id="home">
		<!-- header -->
		<header class="header">
			<div class="container">
				<!-- nav -->
				<nav class="py-3">
					<div id="logo">
						<%-- 	<img class="logoImg" src="${root}/resources/css/images/ODTN.png" width="50"> --%>
						<h1>
							<a class="navbar-brand" href="index.html">CAMPINGINFO</a>
						</h1>
					</div>

					<label for="drop" class="toggle">Menu</label> <input
						type="checkbox" id="drop" />
					<ul class="menu mt-2">
						<li class="active"><a href="index.html">캠핑장검색</a></li>
						<!-- First Tier Drop Down -->
						<li><label for="drop-2" class="toggle">Drop Down <span
								class="fa fa-angle-down" aria-hidden="true"></span>
						</label> <a href="#">캠핑톡 <span class="fa fa-angle-down"
								aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
							<ul>
								<li><a href="${root}/board/campInfo/write.do">캠핑소식</a></li>
								<li><a href="gallery.html">캠핑후기</a></li>
								<li><a href="features.html">이벤트</a></li>
								<li><a href="features.html">캠핑노하우</a></li>
							</ul></li>
						<li>
							<!-- First Tier Drop Down --> <label for="drop-2" class="toggle">Drop
								Down <span class="fa fa-angle-down" aria-hidden="true"></span>
						</label> <a href="#">캠핑플러스 <span class="fa fa-angle-down"
								aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
							<ul>
								<li><a href="features.html">캠핑시작하기</a></li>
								<li><a href="gallery.html">캠핑장비이야기</a></li>
								<li><a href="features.html">안전한캠핑즐기기</a></li>
								<li><a href="features.html">안전수칙동영상</a></li>
							</ul>
						</li>
						<li>
							<!-- First Tier Drop Down --> <label for="drop-2" class="toggle">Drop
								Down <span class="fa fa-angle-down" aria-hidden="true"></span>
						</label> <a href="#">고객센터 <span class="fa fa-angle-down"
								aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
							<ul>
								<li><a href="features.html">공지사항</a></li>
								<li><a href="gallery.html">캠핑상담</a></li>
								<li><a href="features.html">캠핑장정보수정요청</a></li>
								<li><a href="features.html">미등록야영장신고</a></li>
								<li><a href="features.html">캠핑장공지사항</a></li>
							</ul>
						</li>

					</ul>


				</nav>
				<!-- //nav -->
			</div>
		</header>
		<!-- //header -->
	</div>
	<!-- //main-content -->
</body>
</html>