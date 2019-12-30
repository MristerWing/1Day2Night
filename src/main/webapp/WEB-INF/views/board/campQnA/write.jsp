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
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    
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
    	var camp_value(this)=function(select_camp){
    		var selected_index=select_camp.selectedIndex;
    		var value=select_camp.options[selected_index].value;
    		alert(value);
    	}
    	<script language="javascript">
    	function select_camp(){
    	 i=document.join.mail3.selectedIndex // 선택항목의 인덱스 번호
    	 var mail=document.join.mail3.options[i].value // 선택항목 value
    	 document.join.mail2.value=mail
    	}
    </script>  
        <!--++++++++++++++++++++++++++++++부트스트랩+++++++++++++++++++++++++++++++++++++++++++++=-->
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
                  		<a class="navbar-brand" href="${root}/index.jsp">문의사항</a>
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
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">문의사항</h3>
             <div class="QnA_content" >
				
				<label>문의사항 작성</label>
			<!--썸머노트 form태그-->
            <form class="campReview_form" action="${root}/board/campQnA/writeOk.do" method="POST" 
            	enctype="multipart/form-data" onsubmit="returnForm(this)">
 	
				<input type="hidden" name="qna_num" value="${qna_num}"/>
				<input type="hidden" name="group_num" value="${group_num}"/>
				<input type="hidden" name="sequence_num" value="${sequence_num}"/>
				<input type="hidden" name="sequence_level" value="${sequence_level}"/>
				<input type="hidden" name="sequence_level" value="${sequence_level}"/>
				
			  <div class="form-group">
				  <label>제목(*)</label>
				  <input type="text" class="form-control" id="title" name="title">
			  </div>
			  <div class="form-group">
				  <label for="pwd">작성자(*)</label>
				  <input name="user_num" type="hidden" value="${memberDto.user_num}">
				  <input type="text" class="form-control" value="${writer}" name="user_name" disabled="disabled">
			 </div>
			  <div class="form-group">
				  <label for="pwd">비밀번호 입력(*)</label>
				  <input type="password" class="form-control" value="${writer}" name="password" onfocus="this.value=''">
			 </div>
				      <div class="form-group">
					      <label for="sel1">문의유형(*)</label>
					      <select class="form-control" id="qna_type" name="qna_type">
					      	 <option>문의유형을 선택 해 주세요(*)</option>
					      	 <option value="캠핑장">캠핑장 관련문의</option>
						 	 <option value="이벤트">이벤트 관련문의</option>
						     <option value="기타">기타문의</option>
					      </select>
      				</div>
				     <div class="form-group">
      				  <label>내용을 입력해주세요</label>
      				  	<textarea name="content" rows="3" id="content"></textarea>
						<!--썸머노트 한글설정-->
						<script type="text/javascript" src="${root}/resources/javascript/summernote/summernote-ko-KR.js">
						</script>
						
						<script type="text/javascript">
						$(document).ready(function() {
					        $('#content').summernote({
					        	
					     		height:600,
					     		minHeight:null,
					     		maxHeight:null,
					     		focus:true,
					     		lang:'ko-KR'
					       
					        });
					        var code=$('#content').summernote('code');
					        $(".content").html(code);
					    });
					    </script>	
				     
				    </div>
			
				    <button type="submit" class="btn btn-primary">작성</button>
				    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campQnA/list.do?pageNumber=${pageNumber}'" >목록</button>
				 
				  </form>
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
