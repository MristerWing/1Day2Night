<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script >
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
   <script type="text/javascript">
    	function content_alert(){
    		alert
    	}
    </script>  
    
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    
    <!-- //Meta tag Keywords -->
    <!-- Custom-Files -->
    <link rel="stylesheet" href="${root}/resources/css/styles/bootstrap.css">
    <!--리스트전용 css-->
    <link rel="stylesheet" href="${root}/resources/css/board/list.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="${root}/resources/css/styles/style.css" type="text/css" media="all" />
   
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
   <%--  <link href="${root}/css/styles/font-awesome.css" rel="stylesheet"> --%>
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
                  		<a class="navbar-brand" href="index.html">CampReview</a>
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
                                <li><a href="">캠핑후기</a>
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
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">캠핑장 리뷰</h3>
	             <div class="info_list">
					<div class="info_list_top">
					<label>캠핑소식</label>
						<div>
						<input type="text" value="제목" disabled="disabled"/>
						<input type="text" id="campinfo_search" value="검색어를 입력하세요" onfocus="this.value=''"/>
						<input type="submit" id="campinfo_search" value="확인"  onclick="e"/>
						</div> 
					</div> 
						
					<div id="info_list_content">
					<c:if test="${count==0||campReviewList.size()==0}">
						<div>
							<span>게시판에 저장된 글이 없습니다.</span>
						</div>
					</c:if>
					<!--작성글이있다면-->
				 <c:if test="${count>0}">
					<c:forEach var="campInfoDto" items="${campReviewList}">
						
						<a href="">
							<div class="">
								<img src="" alt= class="">
							</div>
							<div class="">
								<p class="">
									</p>
								<p class="">
								</p>
							</div>
						</a>
						<div class="">
							<ul class="">
								<li></li>
								<li></li>
								<li><span class="">조회수</span></li>
							</ul>
						</div>
					</c:forEach>
				 </c:if> 
					<div class="list_buttom">
						<input type="button" value="글쓰기" onclick="location.href='${root}/board/campInfo/write.do'">
					</div>	
					<div align="center">
				 <c:if test="${count>0}">
					<fmt:parseNumber var="pageCount" integerOnly="true" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>						
					<c:set var="pageBlock" value="${10}"/>
					
					<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
					<c:set var="startPage" value="${result*pageBlock+1}"/>
					<c:set var="endPage" value="${startPage+pageBlock-1}"/>
						
					<c:if test="${endPage>pageCount}">
						<c:set var="endPage" value="${pageCount}"/>	
					</c:if>
					
					<c:if test="${startPage>pageBlock}">
						<a href="${root}/board/campInfo/list.do?pageNumber=1">[처음]</a>
					</c:if>
					<c:if test="${startPage>pageBlock}">
						<a href="${root}/board/campInfo/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${root}/board/campInfo/list.do?pageNumber=${i}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${endPage<pageCount}">
						<a href="${root}/board/campInfo/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
					</c:if>
				</c:if>
					</div>
	            </div>
	          </div>  
        </div>
       </div>
         
        <!-- //services -->
    </section>
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
                                <li><a href="gallery.html">미등록야영장불법영업신고</a></li>
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

</body>

</html>
