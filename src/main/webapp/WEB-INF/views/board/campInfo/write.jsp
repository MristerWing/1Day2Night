<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<html lang="utf-8">

<head>
    <title>ODTN</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="Camping Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
    <link rel="stylesheet" href="${root}/resources/css/test/style.css" type="text/css" media="all" />
   
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="${root}/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <!-- /Fonts -->
    <link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800" rel="stylesheet">

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

                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mt-2">
                        <li class="active"><a href="index.html">캠핑장검색</a></li>
                        	<!-- First Tier Drop Down -->
                           <li>
                            <label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="#">캠핑톡 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                              <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="${root}/board/campInfo/write.do">캠핑소식</a>
                                </li>
                                <li><a href="gallery.html">캠핑후기</a>
                                </li>
                                <li><a href="features.html">이벤트</a>
                                </li>
                                <li><a href="features.html">캠핑노하우</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <!-- First Tier Drop Down -->
                            <label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="#">캠핑플러스 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                            <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="features.html">캠핑시작하기</a>
                                </li>
                                <li><a href="gallery.html">캠핑장비이야기</a>
                                </li>
                                <li><a href="features.html">안전한캠핑즐기기</a>
                                </li>
                                <li><a href="features.html">안전수칙동영상</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                         <!-- First Tier Drop Down -->
                            <label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="#">고객센터 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                            <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="features.html">공지사항</a>
                                </li>
                                <li><a href="gallery.html">캠핑상담</a>
                                </li>
                                <li><a href="features.html">캠핑장정보수정요청</a>
                                </li>
                                <li><a href="features.html">미등록야영장신고</a>
                                </li>
                                <li><a href="features.html">캠핑장공지사항</a>
                                </li>
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
  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">Explore The World With Us. </h3>
                <div class="feature-grids row mt-3 mb-lg-5 mb-3 mt-lg-5 text-center">
                    <div class="col-lg-4" data-aos="fade-up">
                        <div class="bottom-gd px-3">
                            <span class="fa fa-bus" aria-hidden="true"></span>
                            <h3 class="my-4"> Sit Amet Mattis</h3>
                            <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                        </div>
                    </div>
                    <div class="col-lg-4" data-aos="fade-up">
                        <div class="bottom-gd2-active px-3">
                            <span class="fa fa-car" aria-hidden="true"></span>
                            <h3 class="my-4"> Ultricies Velit</h3>
                            <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                        </div>
                    </div>
                    <div class="col-lg-4" data-aos="fade-up">
                        <div class="bottom-gd px-3">
                            <span class="fa fa-rocket" aria-hidden="true"></span>
                            <h3 class="my-4">Amet Mattis Quam</h3>
                            <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                        </div>
                    </div>

                </div>
				<div class="fetured-info pt-lg-5">
                   
                    <div class="row fetured-sec mt-lg-5 mt-3">
                        <div class="col-lg-6 p-0">
                            <div class="img-effect">
                                <img src="images/img1.jpg" alt="" class="img-fluid image1">
                            </div>

                        </div>
                        <div class="col-lg-6 serv_bottom feature-grids pl-lg-5">
                            <div class="featured-left text-left">
                                <div class="bottom-gd px-3">
                                    <span class="fa fa-plane" aria-hidden="true"></span>
                                    <h3 class="my-4"> Ultricies Velit</h3>
                                    <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                                </div>
                                <div class="bottom-gd fea active p-4" data-aos="fade-left">
                                    <span class="fa fa-rocket" aria-hidden="true"></span>
                                    <h3 class="my-3 ">Mattis Quam</h3>
                                    <p>Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                                </div>
                            </div>
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
                        <p class="count-text">Years Of Experience</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="counter">
					  <span class="fa fa-user"></span>
                        <h3 class="timer count-title count-number">120</h3>
                        <p class="count-text">Our Agents</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="counter">
					 <span class="fa fa-smile-o"></span>
                        <h3 class="timer count-title count-number">1280</h3>
                        <p class="count-text">Happy Customers</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="counter">
					  <span class="fa fa-users"></span>
                        <h3 class="timer count-title count-number">10200</h3>
                        <p class="count-text">Clients</p>
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
                <h3 class="tittle  text-center my-lg-5 my-3">Our Travel Agents</h3>
                <div class="row mt-lg-5 mt-4">
                    <div class="col-md-4 team-gd text-center">
                        <div class="team-img mb-4">
                            <img src="images/team.jpg" class="img-fluid" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Agent</span> Jason Donoghue</h3>
                            <p>Lorem Ipsum has been the industry's standard since the 1500s.</p>
                            <ul class="top-right-info text-center mt-md-4 mt-3">
                                
                                <li class="mr-1">
                                    <a href="#">
											<span class="fa fa-facebook-f"></span>
										</a>
                                </li>
                                <li>
                                    <a href="#">
											<span class="fa fa-twitter"></span>
										</a>
                                </li>
                                <li class="mx-1">
                                    <a href="#">
											<span class="fa fa-google-plus"></span>
										</a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4 team-gd second text-center">
                        <div class="team-img mb-4">
                            <img src="images/team1.jpg" class="img-fluid" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Agent</span> Mariana Noe</h3>
                            <p>Lorem Ipsum has been the industry's standard since the 1500s.</p>
                           <ul class="top-right-info text-center mt-md-4 mt-3">
                                
                                <li class="mr-1">
                                    <a href="#">
											<span class="fa fa-facebook-f"></span>
										</a>
                                </li>
                                <li>
                                    <a href="#">
											<span class="fa fa-twitter"></span>
										</a>
                                </li>
                               
                                <li>
                                    <a href="#">
											<span class="fa fa-dribbble"></span>
										</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 team-gd text-center">
                        <div class="team-img mb-4">
                            <img src="images/team2.jpg" class="img-fluid" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Agent</span> Daniel Doe</h3>
                            <p>Lorem Ipsum has been the industry's standard since the 1500s.</p>
                            <ul class="top-right-info text-center mt-md-4 mt-3">
                                
                                <li class="mr-1">
                                    <a href="#">
											<span class="fa fa-facebook-f"></span>
										</a>
                                </li>
                                <li>
                                    <a href="#">
											<span class="fa fa-twitter"></span>
										</a>
                                </li>
                                <li class="mx-1">
                                    <a href="#">
											<span class="fa fa-google-plus"></span>
										</a>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>
    <!--//team -->
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
                            <p>Address : 1234 lock, Charlotte, North Carolina, United States</p>
                            <p>Phone : +12 534894364</p>
                            <p>Email : <a href="mailto:info@example.com">info@example.com</a></p>
                            <p>Fax : +12 534894364</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4 footer-grid_section_1its">
                        <div class="footer-title-w3pvt">
                            <h3>Quick Links</h3>
                        </div>
                         <div class="row no-gutters">
                            <ul class="links">
                                <li><a href="index.html">Home </a></li>
                                <li><a href="about.html">About </a></li>
                                <li><a href="features.html">Services</a></li>

                                <li><a href="gallery.html">Gallery</a></li>
                                <li><a href="contact.html">Contact </a></li>
                            </ul>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 mt-lg-0 mt-4 col-sm-12 footer-grid_section_1its" data-aos="fade-left">
                        <div class="footer-title-w3pvt">
                            <h3>Newsletter</h3>
                        </div>
                        <div class="footer-text">
                            <p>By subscribing to our mailing list you will always get latest news and updates from us.</p>
                            <form action="#" method="post">
                                <input type="email" name="Email" placeholder="Enter your email..." required="">
                                <button class="btn1"><span class="fa fa-paper-plane-o" aria-hidden="true"></span></button>
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
			<p class="copy-w3layouts">© 2018 Camping. All rights reserved | Design by
				<a href="http://w3layouts.com">W3layouts.</a>
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

</body>

</html>
