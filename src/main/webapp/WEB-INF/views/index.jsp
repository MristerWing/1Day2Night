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

<script type="text/javascript" src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
<!-- 부트스트랩.js가 jquery를 상속 받기 때문에 jquery밑에 선언해줘야됨 -->
<script src="${root}/resources/javascript/modules/bootstrap.js"></script>
</head>

<body>
   <!-- mian-content -->
   <div class="main-content" id="home">
      <!-- header -->
      <header class="header">
         <div class="container">
            <!-- nav -->
            <nav class="py-3">
               <img class="logoImg" src="${root}/resources/images/odtnlogo.png" style="position: absolute;width: 146px;margin-top: -48px;">

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
                  <h2 style="margin-left: 6px;">Enjoy Your Holiday Trip</h2>
                  <h3 class="mb-3" style="text-shadow: 4px 5px 5px rgb(0,0,0);">캠핑장 조회 예약을  한곳에서</h3>
                  <p class="mb-4">국내 전체 캠핑장 약 <span>1500</span>여개의 정보와 위치기반을 통한 상세검색 사업자를 통한 관광지 등록신청까지 </p>
                  <a href="${root}/search/list.do" class="btn" style="box-shadow: 4px 5px 5px rgb(0,0,0);">캠핑장 검색</a>
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
                     <span class="fa fa-tag" aria-hidden="true"></span>
                     <h3 class="my-4">태그별 검색</h3>
                   	<p>다양한 태그를 통해 고객님의 </p>
                     <p>취향에 맞는 캠핑장을 선택하세요.</p>
                  </div>
               </div>
               <div class="col-lg-4" data-aos="fade-up">
                  <div class="bottom-gd2-active px-3">
                     <span class="fa fa-credit-card" aria-hidden="true"></span>
                     <h3 class="my-4">캠핑장 예약</h3>
                     <P>맘에드는 캠핑장을 찾으셨나요?</P>
                     <P>ODTN에서 바로 예약하세요.</P>
                  </div>
               </div>
               <div class="col-lg-4" data-aos="fade-up">
                  <div class="bottom-gd px-3">
                     <span class="fa fa-rocket" aria-hidden="true"></span>
                     <h3 class="my-4">${campingDto.campingCount}개의 다양한 캠핑장</h3>
                     <P>대한민국 방방곳곳의 캠핑장정보와</P>
                     	<P>캠핑장 리뷰를 공유해 보세요.</P>
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
                     <a href="${root}/board/campInfo/read.do?info_num=24&pageNumber=1"><img src="https://images.unsplash.com/photo-1455496231601-e6195da1f841?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60" class="img-fluid" alt="user-image"></a>
                  </div>
                  <div class="team-info">
                     <h3 class="mt-md-4 mt-3">
                        <span class="sub-tittle-team"></span> 겨울철캠핑 주의사항
                     </h3>
                       <p>캠핑 초보라면 더더욱 필요한 겨울캠핑 주의사항</p> 
                     	<p><a href="${root}/board/campInfo/read.do?info_num=24&pageNumber=1">[더보기]</a></p>
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
                     <a href="${root}/board/campInfo/read.do?info_num=29&pageNumber=1"><img src="https://images.unsplash.com/photo-1444228425018-ff8535a55c93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60" class="img-fluid" alt="user-image"></a>
                  </div>
                  <div class="team-info">
                     <h3 class="mt-md-4 mt-3">
                        <span class="sub-tittle-team"></span> 식기용품 사용법
                     </h3>
                 		 <p>캠핑용 식기용품의 올바른 사용법</p>
                   	 	 <p><a href="${root}/board/campInfo/read.do?info_num=29&pageNumber=1">[더보기]</a></p>
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
                     <a href="${root}/board/campInfo/read.do?info_num=25&pageNumber=1"><img src="https://images.unsplash.com/photo-1526491109672-74740652b963?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60" class="img-fluid" alt="user-image"></a>
                  </div>
                  <div class="team-info">
                     <h3 class="mt-md-4 mt-3">
                        <span class="sub-tittle-team"></span> 친환경 캠핑스쿨 신청
                     </h3>
                     	<p>2020년 친환경 캠핑 스쿨 신청</p>
                     	<p><a href="${root}/board/campInfo/read.do?info_num=25&pageNumber=1">[더보기]</a></p>
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