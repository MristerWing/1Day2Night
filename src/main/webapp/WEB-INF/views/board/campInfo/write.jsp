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
 
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet" />
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet" />
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
 	
 	<!--파일용량 체크 script-->
 	<script type="text/javascript">
	 	function fileSizeCheck(){
	 	    if(document.getElementById("file").value!=""){
	 	    var fileSize = document.getElementById("file").files[0].size;
	 	    var maxSize = 2 * 1024 * 1024;//2MB
	 	 
	 	    if(fileSize > maxSize){
	 	       alert("첨부파일 사이즈는 2MB 이내로 등록 가능합니다. ");
	 	       return;
	 	    }
	 	}

 	</script>

</head>

<body>
 
    <!-- //main-content -->
  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">NEW 캠핑소식</h3>
             <div class="info_content" >
				
				<label>캠핑소식 작성</label>
			<!--썸머노트 form태그-->
            <form class="campInfo_form" action="${root}/board/campInfo/writeOk.do" method="POST" 
            	onsubmit="returnForm(this)" enctype="multipart/form-data">
 	
			<ul class="">
				<li>
					<label >제목(*)</label>
					<input name="title"  type="text" maxlength="100"/>
				</li>
				<li>
					<label >작성자(*)</label>
					<input name="user_num" type="hidden" value="${memberDto.user_num}"/>
					<input name="writer" type="text" value="${writer}" disabled="disabled"/>
				</li>

				<li>
					<label >파일 첨부</label>
							<li>
							<!-- 	<a href="" onclick="return addFileInput('P','fileTd'); return false;">
								<img src="/img/2018/board/btn_addfile.png" alt="파일추가">
							</a>
							<a href="#ProgBtn" onclick="return addFileInput('M','fileTd'); return false;">
								<img src="/img/2018/board/btn_delfile.png" alt="파일삭제">
							</a> -->
							<input multiple="multiple" type="file" id="file" name="file" onchange="fileSizeCheck()" title="첨부파일1"/>
							<br>
						
							</li> 
				<li>
					<label>내용</label>
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
				<li>
					<p>
						<input class="btn" type="submit" value="작성"/>	
						<input class="btn" type="button"  value="목록" onclick="location.href='${root}/board/campInfo/list.do?pageNumber=${pageNumber}'"/>	
					</p>
				
				</li>
		</ul>
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
