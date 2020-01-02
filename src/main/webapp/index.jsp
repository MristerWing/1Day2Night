
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
<link rel="stylesheet" href="${root}/resources/css/styles/footer.css">
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
<script type="text/javascript" src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
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
								</c:if>
							</c:if>
							<c:if test="${user_auth_id != null}">
								<c:if test="${register_type != null}">
									<li><a href="${root}/member/kakaoLogout.do">카카오 로그아웃</a></li>
									<li><a href="${root}/member/kakaoDelete.do">카카오 연동 해제</a>
								</c:if>
							</c:if>
							<li><a href="${root}/member/update.do">정보 수정/탈퇴</a></li>
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
				<!-- //nav -->
			</div>
		</header>
		<!-- //header -->
		<!-- banner -->
		<section class="banner">
			<div class="container">
				<div class="row banner-grids">
					<div class="col-lg-6 banner-info-w3ls">
						<h2>Enjoy Your Holiday Trip</h2>
						<h3 class="mb-3">Perfect Camping for You</h3>
						<a href="${root}/owner/login.do">사업자</a>
						<p class="mb-4">Vestibulum ante ipsum primis in faucibus orci
							luctus et ultrices posuere cubilia Curae; Nulla mollis dapibus
							nunc, ut rhoncus turpis sodales quis.</p>
						<a href="about.html" class="btn">캠핑장 검색</a>
					</div>

				</div>
			</div>
		</section>
		<!-- //banner -->
	</div>
	<!--/ab -->
	<section class="about py-lg-5 py-md-5 py-5">
		<div class="container">
			<div class="inner-sec-w3pvt py-lg-5 py-3">
				<h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">ODTN이 왜 특별한가요?
					</h3>
				<div class="feature-grids row mt-3 mb-lg-5 mb-3 mt-lg-5 text-center">
					<div class="col-lg-4" data-aos="fade-up">
						<div class="bottom-gd px-3">
							<span class="fa fa-bus" aria-hidden="true"></span>
							<h3 class="my-4">캠핑카가 있어도</h3>
							<p>Integer sit amet mattis quam, sit amet ultricies velit.
								Praesent ullamcorper dui turpis.</p>
						</div>
					</div>
					<div class="col-lg-4" data-aos="fade-up">
						<div class="bottom-gd2-active px-3">
							<span class="fa fa-car" aria-hidden="true"></span>
							<h3 class="my-4">캠핑카가 없어도</h3>
							<p>Integer sit amet mattis quam, sit amet ultricies velit.
								Praesent ullamcorper dui turpis.</p>
						</div>
					</div>
					<div class="col-lg-4" data-aos="fade-up">
						<div class="bottom-gd px-3">
							<span class="fa fa-rocket" aria-hidden="true"></span>
							<h3 class="my-4">2304개의 다양한 캠핑장</h3>
							<p>Integer sit amet mattis quam, sit amet ultricies velit.
								Praesent ullamcorper dui turpis.</p>
						</div>
					</div>

				</div>

			</div>
		</div>
		<!-- //services -->
	</section>
	<!-- //ab -->
	<!--/counter-->
	<section class="stats py-lg-5">
		<div class="container py-5">
			<div class="row text-center">
				<div class="col-md-3 col-sm-6">
					<div class="counter">
						<span class="fa fa-briefcase"></span>
						<h3 class="timer count-title count-number">12</h3>
						<p class="count-text">등록된 캠핑장</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="counter">
						<span class="fa fa-user"></span>
						<h3 class="timer count-title count-number">120</h3>
						<p class="count-text">등록된 사업자</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="counter">
						<span class="fa fa-smile-o"></span>
						<h3 class="timer count-title count-number">1280</h3>
						<p class="count-text">추천</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="counter">
						<span class="fa fa-users"></span>
						<h3 class="timer count-title count-number">10200</h3>
						<p class="count-text">회원</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--//counter-->
	<!--//team -->
	<section class="banner-bottom py-lg-5 py-4">
		<div class="container">
			<div class="inner-sec-w3pvt speak">
				<h3 class="tittle  text-center my-lg-5 my-3">Camping Information</h3>
				<div class="row mt-lg-5 mt-4">
					<div class="col-md-4 team-gd text-center">
						<div class="team-img mb-4">
							<img src="https://images.unsplash.com/photo-1517823382935-51bfcb0ec6bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" class="img-fluid" alt="user-image">
						</div>
						<div class="team-info">
							<h3 class="mt-md-4 mt-3">
								<span class="sub-tittle-team"></span> 야간캠핑 주의사항
							</h3>
							<p>Lorem Ipsum has been the industry's standard since the
								1500s.</p>
							<ul class="top-right-info text-center mt-md-4 mt-3">

								<li class="mr-1"><a href="#"> <span
										class=""></span>
								</a></li>
								<li><a href="#"> <span class=""></span>
								</a></li>
								<li class="mx-1"><a href="#"> <span
										class=""></span>
								</a></li>

							</ul>
						</div>
					</div>

					<div class="col-md-4 team-gd second text-center">
						<div class="team-img mb-4">
							<img src="https://images.unsplash.com/photo-1537225228614-56cc3556d7ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" class="img-fluid" alt="user-image">
						</div>
						<div class="team-info">
							<h3 class="mt-md-4 mt-3">
								<span class="sub-tittle-team"></span> 야영 주의사항
							</h3>
							<p>Lorem Ipsum has been the industry's standard since the
								1500s.</p>
							<ul class="top-right-info text-center mt-md-4 mt-3">

								<li class="mr-1"><a href="#"> <span
										class=""></span>
								</a></li>
								<li><a href="#"> <span class=""></span>
								</a></li>

								<li><a href="#"> <span class=""></span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 team-gd text-center">
						<div class="team-img mb-4">
							<img src="https://images.unsplash.com/photo-1466220549276-aef9ce186540?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" class="img-fluid" alt="user-image">
						</div>
						<div class="team-info">
							<h3 class="mt-md-4 mt-3">
								<span class="sub-tittle-team"></span> 취사시 주의사항
							</h3>
							<p>Lorem Ipsum has been the industry's standard since the
								1500s.</p>
							<ul class="top-right-info text-center mt-md-4 mt-3">

								<li class="mr-1"><a href="#"> <span
										class=""></span>
								</a></li>
								<li><a href="#"> <span class=""></span>
								</a></li>
								<li class="mx-1"><a href="#"> <span
										class=""></span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--//team -->

	<!-- portfolio -->
	<section class="portfolio-flyer py-5" id="gallery">
		<div class="container pt-lg-3 pb-md-5">
			<h3 class="tittle  text-center my-lg-5 my-3">추천 캠핑장</h3>

			<div class="row news-grids pb-lg-5 mt-3 mt-lg-5">
				<div class="col-lg-4 gal-img">
					<div class="gal-info">
						<a href="#gal1"><img src="https://images.unsplash.com/photo-1475483768296-6163e08872a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80" alt="news image"
							class="img-fluid"></a>
						<div class="property-info-list">
							<div class="detail">
								<h4 class="title">
									<a href="about.html">호반캠핑장</a>
								</h4>
								<div class="location mt-2">
									<a href="about.html"> <span class="fa fa-map-marker"></span>
										Netherlands / Belgium
									</a>
								</div>
								<ul class="facilities-list clearfix">
									<li><span class="fa fa-clock-o"></span> 3 days</li>
									<li><span class="fa fa-clock-o"></span> 2 nights</li>
								</ul>
							</div>
							<div class="footer-properties">
								<a class="admin" href="#"> <span class="fa fa-user"></span>
									Lorem Ipsum
								</a> <span class="year text-right"> <span
									class="fa fa-calendar"></span> 2 months ago
								</span>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 gal-img">
					<div class="gal-info">
						<a href="#gal2"><img src="https://images.unsplash.com/photo-1492648272180-61e45a8d98a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" alt="news image"
							class="img-fluid"></a>
						<div class="property-info-list">
							<div class="detail">
								<h4 class="title">
									<a href="about.html">솔밭 야영장</a>
								</h4>
								<div class="location mt-2">
									<a href="about.html"> <span class="fa fa-map-marker"></span>
										France / Paris
									</a>
								</div>
								<ul class="facilities-list clearfix">
									<li><span class="fa fa-clock-o"></span> 3 days</li>
									<li><span class="fa fa-clock-o"></span> 2 nights</li>
								</ul>
							</div>
							<div class="footer-properties">
								<a class="admin" href="#"> <span class="fa fa-user"></span>
									Lorem Ipsum
								</a> <span class="year text-right"> <span
									class="fa fa-calendar"></span> 2 months ago
								</span>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 gal-img">
					<div class="gal-info">
						<a href="#gal3"><img src="https://images.unsplash.com/photo-1478810810369-07072c5ef88b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60" alt="news image"
							class="img-fluid"></a>
						<div class="property-info-list">
							<div class="detail">
								<h4 class="title">
									<a href="about.html">Australia</a>
								</h4>
								<div class="location mt-2">
									<a href="about.html"> <span class="fa fa-map-marker"></span>
										Melbourne / Sydney
									</a>
								</div>
								<ul class="facilities-list clearfix">
									<li><span class="fa fa-clock-o"></span> 3 days</li>
									<li><span class="fa fa-clock-o"></span> 2 nights</li>
								</ul>
							</div>
							<div class="footer-properties">
								<a class="admin" href="#"> <span class="fa fa-user"></span>
									Lorem Ipsum
								</a> <span class="year text-right"> <span
									class="fa fa-calendar"></span> 2 months ago
								</span>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 gal-img mt-lg-4">
					<div class="gal-info">
						<a href="#gal4"><img src="https://images.unsplash.com/photo-1504280390367-361c6d9f38f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" alt="news image"
							class="img-fluid"></a>
						<div class="property-info-list">
							<div class="detail">
								<h4 class="title">
									<a href="about.html">France</a>
								</h4>
								<div class="location mt-2">
									<a href="about.html"> <span class="fa fa-map-marker"></span>
										France / Paris
									</a>
								</div>
								<ul class="facilities-list clearfix">
									<li><span class="fa fa-clock-o"></span> 3 days</li>
									<li><span class="fa fa-clock-o"></span> 2 nights</li>
								</ul>
							</div>
							<div class="footer-properties">
								<a class="admin" href="#"> <span class="fa fa-user"></span>
									Lorem Ipsum
								</a> <span class="year text-right"> <span
									class="fa fa-calendar"></span> 2 months ago
								</span>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 gal-img mt-lg-4">
					<div class="gal-info">
						<a href="#gal5"><img src="https://images.unsplash.com/photo-1511993807578-701168605ad3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60" alt="news image"
							class="img-fluid"></a>
						<div class="property-info-list">
							<div class="detail">
								<h4 class="title">
									<a href="about.html">Australia</a>
								</h4>
								<div class="location mt-2">
									<a href="about.html"> <span class="fa fa-map-marker"></span>
										Melbourne / Sydney
									</a>
								</div>
								<ul class="facilities-list clearfix">
									<li><span class="fa fa-clock-o"></span> 3 days</li>
									<li><span class="fa fa-clock-o"></span> 2 nights</li>
								</ul>
							</div>
							<div class="footer-properties">
								<a class="admin" href="#"> <span class="fa fa-user"></span>
									Lorem Ipsum
								</a> <span class="year text-right"> <span
									class="fa fa-calendar"></span> 2 months ago
								</span>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 gal-img mt-lg-4">
					<div class="gal-info">
						<a href="#gal6"><img src="https://images.unsplash.com/photo-1532564979029-bbf9fcbe7b0b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" alt="news image"
							class="img-fluid"></a>
						<div class="property-info-list">
							<div class="detail">
								<h4 class="title">
									<a href="about.html">Germany</a>
								</h4>
								<div class="location mt-2">
									<a href="about.html"> <span class="fa fa-map-marker"></span>
										Netherlands / Belgium
									</a>
								</div>
								<ul class="facilities-list clearfix">
									<li><span class="fa fa-clock-o"></span> 3 days</li>
									<li><span class="fa fa-clock-o"></span> 2 nights</li>
								</ul>
							</div>
							<div class="footer-properties">
								<a class="admin" href="#"> <span class="fa fa-user"></span>
									Lorem Ipsum
								</a> <span class="year text-right"> <span
									class="fa fa-calendar"></span> 2 months ago
								</span>

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- //portfolio -->
	<!-- popup-->
	<div id="gal1" class="pop-overlay animate">
		<div class="popup">
			<img src="images/1.jpg" alt="Popup Image" class="img-fluid" /> <a
				class="close" href="#gallery">&times;</a>
		</div>
	</div>
	<!-- //popup -->

	<!-- popup-->
	<div id="gal2" class="pop-overlay animate">
		<div class="popup">
			<img src="images/2.jpg" alt="Popup Image" class="img-fluid" /> <a
				class="close" href="#gallery">&times;</a>
		</div>
	</div>
	<!-- //popup -->
	<!-- popup-->
	<div id="gal3" class="pop-overlay animate">
		<div class="popup">
			<img src="images/3.jpg" alt="Popup Image" class="img-fluid" /> <a
				class="close" href="#gallery">&times;</a>
		</div>
	</div>
	<!-- //popup3 -->
	<!-- popup-->
	<div id="gal4" class="pop-overlay animate">
		<div class="popup">
			<img src="images/4.jpg" alt="Popup Image" class="img-fluid" /> <a
				class="close" href="#gallery">&times;</a>
		</div>
	</div>
	<!-- //popup -->
	<!-- popup-->
	<div id="gal5" class="pop-overlay animate">
		<div class="popup">
			<img src="images/5.jpg" alt="Popup Image" class="img-fluid" /> <a
				class="close" href="#gallery">&times;</a>
		</div>
	</div>
	<!-- //popup -->
	<!-- popup-->
	<div id="gal6" class="pop-overlay animate">
		<div class="popup">
			<img src="images/6.jpg" alt="Popup Image" class="img-fluid" /> <a
				class="close" href="#gallery">&times;</a>
		</div>
	</div>
	<!-- //popup -->

	<!--footer -->
	<footer>
	<script type="text/javascript">
	$( document ).ready( function() {
		$( window ).scroll( function() { 
			if ( $( this ).scrollTop() > 200 ) { 
				$( '.btn_top' ).fadeIn(); 
			} 
			else { 
				$( '.btn_top' ).fadeOut(); 
				} 
			} ); 
		
		$( '.btn_top' ).click( function() { 
			$( 'html, body' ).animate( { scrollTop : 0 }, 400 ); 
			return false; 
			} ); 
		} );
	 
	function makeBold(){
		document.getElementById("btn").style.color="red";
		
	}
	function makeOut() {
		document.getElementById("btn").style.color="white";
	}
	</script>
		<div class="f_info_w">
		<div class="layout">
			<div class="f_logo">
				<span>ODTN</span>
			</div>
			<ul class="f_menu" style="float: left;">
				<li class="privacy"><a href="#" onclick="return false">개인정보처리방침</a></li>
				<li><a href="#" onclick="return false">전자우편무단수집거부</a></li>
				<li><a href="${root}/owner/login.do">캠핑장 등록안내</a></li>
				<li><a href="${root}/admin/adminCheck.do" id="btn" onmouseover="makeBold()" onmouseout="makeOut()">관리자 페이지</a></li>
			</ul>
			
			<div class="btn_top">상단으로</div>
		</div>
	</div>
	</footer>
	<!-- //footer -->
	<!-- copyright -->
	<div class="f_link_w">
		
		<div class="layout">
			<!--하단주소-->
			<div class="f_addr">
				<address class="addr">
					<div>서울특별시 구로구 구로동 디지털로34길 43 한국관광공사</div>
					<div>TEL : 02-0000-0000</div>
					<div>EMAIL : <a href="mailto:webmaster@gocamping.or.kr" class="f_mail">KITRI@Camping.or.kr</a></div>
				</address>
				<p class="copyright">
					Copyrights(c) 2020 <span>KOREA TOURISM ORGANIZATION</span> ALL RIGHTS RESERVED.
				</p>
			</div>
			<!--//f_addr-->
			<!--//하단주소--> 
			<script type="text/javascript">
			$(document).ready(function() {
				// 하단 관련사이트 슬라이드
				$("#myDropdown").hide();
				$(".dropbtn").click(function() {
					$("#myDropdown").slideToggle(500);
				});

			});
			</script>
			<div class="f_link"> 
				<div class="dropdown">
					<button class="f_link_tt dropbtn" onclick="myFunction()">관련사이트</button>
					<div id="myDropdown" class="dropdown-content" style="display: none;">
						<a href="http://kto.visitkorea.or.kr/kor.kto" target="_BLANK">한국관광공사</a>
						<a href="http://korean.visitkorea.or.kr/kor/bz15/addOn/main/publish/index.jsp" target="_BLANK">대한민국 구석구석</a>
						<a href="http://www.durunubi.kr/" target="_BLANK">두루누비</a>
						<a href="http://www.smartoutbound.or.kr/main/main.do" target="_BLANK">지구촌스마트여행</a>
						<a href="http://korean.visitkorea.or.kr/kor/tt/pr_gallery/new_photo_gallery/main/main.jsp" target="_BLANK">관광사진 갤러리</a>
					  </div>
				</div>
			</div>
			<!--//f_link-->
			 
		</div>
	</div>
	<!-- //copyright -->
</body>
</html>
