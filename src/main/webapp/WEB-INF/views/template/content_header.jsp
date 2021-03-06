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
    <link rel="stylesheet" href="${root}/resources/css/styles/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="${root}/resources/javascript/modules/bootstrap.js"></script>
    <link rel="stylesheet" href="${root}/resources/css/styles/style.css" type="text/css" media="all" />
    <link href="${root}/resources/css/styles/font-awesome.css" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800" rel="stylesheet">
</head>

<body>
    <!-- mian-content -->
    <div class="main-content inner" id="home">
        <!-- header -->
               <header class="header">
            <div class="container">
                <!-- nav -->
                <nav class="py-3">
                <a href="${root}">
                    <img class="logoImg" src="${root}/resources/images/odtnlogo.png" style="position: absolute;width: 146px;margin-top: -48px; ">
                </a>

                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
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
                           <li><a href="${root}/reservation/check.do?user_num=${user_num}">예약확인</a></li>
                     	   <li><a href="${root}/member/update.do">정보 수정/탈퇴</a></li>
                        </c:if>
                     </c:if>
                     <c:if test="${user_auth_id != null}">
                        <c:if test="${register_type != null}">
                           <li><a href="${root}/member/kakaoLogout.do">카카오 로그아웃</a></li>
                           <li><a href="${root}/member/kakaoDelete.do">탈퇴</a>
                           <li><a href="${root}/reservation/check.do?user_num=${user_num}">예약확인</a></li>
                     	   <li><a href="${root}/member/update.do">정보 수정</a></li>
                        </c:if>
                     </c:if>
                  </c:if>
                        <li class="active"><a href="${root}/search/list.do">캠핑장검색</a></li>
                        	<!-- First Tier Drop Down -->
                           <li>
                            <label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="#">캠핑톡 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                              <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="${root}/board/campInfo/list.do">캠핑공지</a>
                                </li>
                                <li><a href="${root}/board/campReview/list.do">캠핑후기</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                         <!-- First Tier Drop Down -->
                            <label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="${root}/board/campQnA/list.do">캠핑 문의 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                            <input type="checkbox" id="drop-2" />

                        </li>
                      
                    </ul>


                </nav>
                <!-- //nav -->
            </div>
		       </header>
          </div>
        <!-- //header -->
</body>
</html>