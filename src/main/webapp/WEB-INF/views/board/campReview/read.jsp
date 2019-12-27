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
   
    <script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
   	<script type="text/javascript">
		   addEventListener("load", function() {
		       setTimeout(hideURLbar, 0);
		   }, false);
		
		   function hideURLbar() {
		       window.scrollTo(0, 1);
		   };
		   /*댓글*/
		 	$(document).ready(function(){
		  		showCommentList();
		  	});
		   
		  	function showCommentList(){
		  		var review_num = ${campReviewDto.review_num};
		  		var url="${root}/reviewComment/list.do?review_num="+review_num;
		  			alert(url);
		  		$.ajax({
		  			type:'POST',
		  			url:url,
		  			dataType: 'json',
		  			success:function(data){
		  				var html="";
		  				if (data.lenth<1) {
							html.push("등록된 댓글이 없습니다.");
							alert("data < 1");
						}else{
							$(data).each(function(){
							     htmls += '<div class="media text-muted pt-3" id="rid' + this.wrtier + '">';

			                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

			                     htmls += '<title>Placeholder</title>';

			                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

			                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

			                     htmls += '</svg>';

			                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

			                     htmls += '<span class="d-block">';

			                     htmls += '<strong class="text-gray-dark">' + this.writer + '</strong>';

			                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';

			                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + this.reg_id + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';

			                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ')" >삭제</a>';

			                     htmls += '</span>';

			                     htmls += '</span>';

			                     htmls += this.content;

			                     htmls += '</p>';

			                     htmls += '</div>';
							});
						}
		  			}
		  		});
		  	}
/*    function fn_comment(code){
	    var url="${root}/reviewComment/insert.do"
	    $.ajax({
	        type:'POST',
	        url :root+"",
	        data:$("#commentForm").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#comment").val("");
	            }
	        },
	        error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	        
	    });
	} */
    </script>  

     <!--++++++++++++++++++++++리스트 부트스트랩+++++++++++++++++++++++++++++++++++++-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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
                                <li><a href="${root}/board/campInfo/list.do">캠핑소식</a>
                                </li>
                                <li><a href="${root}/board/campReview/list.do">캠핑후기</a>
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
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">NEW 캠핑소식</h3>
             <div class="info_content" >
				<!--본문 -->
				<!--댓글작성 form-->
	
			<input type="hidden" name="review_num" value="${campReviewDto.review_num}">
			<!--세션스콥받아오는 작업해주고 고치기-->
<%-- 			<input type="hidden" name="user_num" value="${sessionScope.sessionID}">--%>			
				<label>캠핑소식 작성</label>
				<ul class="">
				<li>
					<label>글번호</label>
					<label>${campReviewDto.review_num}</label>
				</li>
				<li>
					<label >제목(*)</label>
					<span>${campReviewDto.title}</span>
				</li>
				<li>
					<label >작성자(*)</label>
					<span>${writer}</span>
				</li>
  
				<li>
					<label>내용</label>
					<span>
						<c:out value="${campReviewDto.content}" escapeXml="false"></c:out>
					</span>			
				</li>
				<li>
					<c:if test="${sessionScope.user_num ==campReviewDto.user_num}">
						<input class="btn" type="button" value="수정" onclick="location.href='${root}/board/campReview/update.do?review_num=${campReviewDto.review_num}&user_num=${campReviewDto.user_num}&pageNumber=${pageNumber}'" />	
						<input class="btn" type="button"  value="삭제" onclick="location.href='${root}/board/campReview/delete.do?review_num=${campReviewDto.review_num}'"/>	
					</c:if>					
						<input class="btn" type="button"  value="목록" onclick="location.href='${root}/board/campReview/list.do?pageNumber=${pageNumber}'"/>	
				</li>
				
			<!--++++++++++++++댓글리스트++++++++++++++++-->
			    <li>
					<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
		
						<h6 class="border-bottom pb-2 mb-0">댓글목록</h6>
		
						<div id="commentList"></div>
					</div> 
				</li>
	
			<!--댓글쓰는란-->
			<c:if test="${sessionScope.user_num != null}">
				<li>
					<div class="container">
					
				    <form id="commentForm" name="commentForm" method="post" action="${root}/reviewComment/insert.do">
				    <br><br>
				        <div>
				            <div>
				                <span><strong>Comments</strong></span> <span id="cCnt"></span>
				            </div>
				            <div>
				                <table class="table">                    
				                    <tr>
				                        <td>
				                            <textarea style="width: 1100px" rows="3" cols="30" id="comment_content" name="comment_content" placeholder="댓글을 입력하세요"></textarea>
				                            <br>
				                            <div align="right">
				                               <input type="submit" value="등록"/>
				                            </div>
				                        </td>
				                    </tr>
				                </table>
				            </div>
				        </div>
				        <input type="hidden" id="pageNumber" name="pageNumber" value="${pageNumber}" /> 
				        <input type="hidden" id="review_num" name="review_num" value="${campReviewDto.review_num}" /> 
				        <input type="hidden" id="user_num" name="user_num" value="${sessionScope.user_num}">       
				    </form>
					</div>
				</li>
			</c:if>
			</ul>

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
                            <h3>Newsletter</h3>
                        </div>
                        <div class="footer-text">
                            <p>By subscribing to our mailing list you will always get latest news and updates from us.</p>
                            <form action="#" method="post">
                                <input type="email" name="Email" placeholder="Enter your email..." >
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
