
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
<style>
	#gallery > div > div > div img {
		height: 200px;
		width: 400px;
	}
	
	#gallery > div > div > div:nth-child(4), #gallery > div > div > div:nth-child(5), #gallery > div > div > div:nth-child(6) {
		margin-top: 10px;
	}
	
	#gallery > div > div > div > div > div > div.detail > h4 {
		font-size: 18px;
	}
	
	#gallery > div > div > div > div > div > div.detail > div > a {
		font-size : 12px;
	}
	
</style>

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
				<%--<img class="logoImg" src="${root}/resources/images/ODTN.png" width="50"> --%>
						<h1>
							<a class="navbar-brand" href="#">ODTN LOGO</a>
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
										&nbsp;&nbsp;<a href="${root}/admin/list.do">관리자 페이지</a>
									</c:if>	
									<c:if test="${email=='chanhok95@naver.com'}">
										&nbsp;&nbsp;<a href="${root}/admin/list.do">관리자 페이지</a>
									</c:if>
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
							<h3 class="my-4">${campingDto.campingCount}개의 다양한 캠핑장</h3>
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
						<h3 class="timer count-title count-number">${campingDto.campingCount}</h3>
						<p class="count-text">등록된 캠핑장</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="counter">
						<span class="fa fa-user"></span>
						<h3 class="timer count-title count-number">${campingDto.ownerCount}</h3>
						<p class="count-text">등록된 사업자</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="counter">
						<span class="fa fa-smile-o"></span>
						<h3 class="timer count-title count-number">${campingDto.recommandCount}</h3>
						<p class="count-text">추천</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="counter">
						<span class="fa fa-users"></span>
						<h3 class="timer count-title count-number">${campingDto.memberCount}</h3>
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
				<c:if test="${campingList.size() > 0}">
					<c:forEach var="searchDto" varStatus="status" items="${campingList}">
						<div class="col-lg-4 gal-img">
							<div class="gal-info">
								<a href="${root}/search/read.do?camp-id=${searchDto.camp_id}"><img src="${searchDto.main_image}" alt="news image"
									class="img-fluid"></a>
								<div class="property-info-list">
									<div class="detail">
										<h4 class="title">
											<a href="${root}/search/read.do?camp-id=${searchDto.camp_id}">${searchDto.camp_name}</a>
										</h4>
										<div class="location mt-2">
											<a href="${root}/search/read.do?camp-id=${searchDto.camp_id}"> <span class="fa fa-map-marker"></span>
												${searchDto.address}
											</a>
										</div>
										<ul class="facilities-list clearfix">
											<li><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> (추천)   ${searchDto.recommand_count}</li>
											<li><i class="fa fa-pencil" aria-hidden="true"></i> (리뷰)   ${searchDto.review_count}</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
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
	<!--footer -->
    <footer>
        <div class="footer_1its py-5">
            <div class="container py-md-4">

                <div class="row footer-top mb-md-5 mb-4">
                    <div class="col-lg-4 col-md-6 footer-grid_section_1its" data-aos="fade-right">
                        <div class="footer-title-w3pvt">
                            <h3>Address</h3>
                        </div>
                        <div class="footer-text">
                            <p>Address : 서울시 구로구 </p>
                            <p>Phone : 02-123-1234</p>
                            <p>Email : <a href="mailto:info@example.com">info@example.com</a></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4 footer-grid_section_1its">
                        <div class="footer-title-w3pvt">
                            <h3>Quick Links</h3>
                        </div>
                         <div class="row no-gutters">
                            <ul class="links">
                                <li><a href="index.html">개인정보처리방침</a></li>
                                <li><a href="about.html">전자우편무단수집거부</a></li>
                                <li><a href="features.html">캠핑장등록안내</a></li>
                                <li><a href="${root}/owner/login.do">사업자</a></li>
                                <li><a href="contact.html">sns로고</a></li>
                            </ul>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 mt-lg-0 mt-4 col-sm-12 footer-grid_section_1its" data-aos="fade-left">
                        <div class="footer-title-w3pvt">
                            <h3>관리자로그인</h3>
                        </div>
                        <div class="footer-text">
                            <p>By subscribing to our mailing list you will always get latest news and updates from us.</p>
                            <form action="#" method="post">
                             <!--    <input type="email" name="Email" placeholder="Enter your email..." required=""> -->
                                <button class="btn1"><span class="fa fa-paper-plane-o" aria-hidden="true">로그인</span></button>
                                <div class="clearfix"> </div>
                            </form>
                        </div>
                    </div>
                </div>
                
               

            </div>
        </div>
    </footer>
    <!-- //footer -->
    <!-- copyright -->
    <div class="cpy-right py-3">
	<div class="container">
		<div class="row no-gutters">
		<div class="col-md-8">
			<p class="copy-w3layouts">© 2019 ODTN Project. All rights reserved | Design by ODTN
			</p>
		</div>
        <div class="col-md-4 footer-grid_section">
			<ul class="top-right-info">
                                
                                <li class="mr-1">
                                    <a href="#">
											<span class="fa fa-facebook-f"></span></a>
                                </li>
                                <li>
                                    <a href="#">
											<span class="fa fa-twitter"></span></a>
                                </li>
                                <li class="mx-1">
                                    <a href="#">
											<span class="fa fa-google-plus"></span></a>
                                </li>
                                <li>
                                    <a href="#">
											<span class="fa fa-dribbble"></span></a>
                                </li>
                            </ul>
                </div>
			</div>
    </div>
	</div>
    <!-- //copyright -->
	<!-- //copyright -->
</body>
</html>
