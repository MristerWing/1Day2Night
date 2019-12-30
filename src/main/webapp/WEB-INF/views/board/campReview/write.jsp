<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
</head>

<body>

  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">캠핑장 리뷰 작성</h3>
             <div class="review_content" >

				  <form class="campReview_form" action="${root}/board/campReview/writeOk.do" method="POST" 
            	enctype="multipart/form-data" onsubmit="returnForm(this)">
				    <div class="form-group">
				      <label>제목(*)</label>
				      <input type="text" class="form-control" id="title" name="title">
				    </div>
				    <div class="form-group">
				      <label for="pwd">작성자(*)</label>
				      <input name="user_num" type="hidden" value="${memberDto.user_num}">
				      <input type="text" class="form-control" value="${user_name}" name="user_name" disabled="disabled">
				    </div>
				      <div class="form-group">
					      <label for="sel1">캠핑장선택</label>
					      <select class="form-control" id="sel1" name="sellist1">
					        <option>시,도</option>
					      </select>
					      <br>
					      <select class="form-control" id="sel1" name="sellist1">
					        <option>시,구,군</option>
					      </select>
					      <br>
					      <select class="form-control" id="camp_id" name="camp_id">
					        <option>캠핑장 이름을 선택해 주세요</option>
					        <option value="11111">111111</option>
					      </select>
      				</div>
      				 <div class="form-group">
      				  <label>대표이미지를 선택해주세요</label>
				      <input type="file" class="form-control-file border" name="file">
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
				    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campReview/list.do?pageNumber=${pageNumber}'" >목록</button>
				 
				  </form>
			<!--썸머노트 form태그-->
       
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
html>