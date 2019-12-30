<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
  
    
    
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

</head>

<body>
    <!-- //main-content -->
  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">문의사항</h3>
	             <div class="info_list">
					<div class="info_list_top">
					<label>문의사항</label>
						<div>
						<input type="text" value="제목" disabled="disabled"/>
						<input type="text" id="campinfo_search" value="검색어를 입력하세요" onfocus="this.value=''"/>
						<input type="submit" id="campinfo_search" value="확인"  onclick="e"/>
						</div> 
					</div> 
					<div id="qna_list_content">
					<c:if test="${count==0||campQnAList.size()==0}">
						<div>
							<span>게시판에 저장된 글이 없습니다.</span>
						</div>
					</c:if>
					<!--작성글이있다면-->
				
								<div class="container">         
						  <table class="table table-striped">
						    <thead>
						      <tr>
						        <th>번호</th>
						        <th>제목</th>
						        <th>문의 유형</th>
						        <th>작성자</th>
						        <th>등록일</th>
						        <th>조회수</th>
						      </tr>
						    </thead>
						    <tbody>
						       	 <c:if test="${count>0}">
						       	 	<c:forEach var="campQnADto" varStatus="list" items="${campQnAList}">
						       	 		 <tr>
										        <td>${campQnADto.qna_num}</td>
										        <c:if test="${sessionScope.email=='eunsol8287@gmail.com'}">
										        	<td><a href="${root}/board/campQnA/read.do?qna_num=${campQnADto.qna_num}&pageNumber=${currentPage}">${campQnADto.title}</a></td>
										        </c:if>
										        <c:if test="${sessionScope.email != 'eunsol8287@gmail.com'}">
										        	<td>${campQnADto.title}</td>
										        </c:if>
										       	<td>${campQnADto.qna_type}</td>
										        <td>${writerList[list.index]}</td>
										        <td><fmt:formatDate value="${campQnADto.write_date}" pattern="yyyy-MM-dd"/></td>
										        <td>${campQnADto.read_count}</td>
						     			 </tr>
						       	 	</c:forEach>
						       	 </c:if>
						    </tbody>
						  </table>
						</div>
				 <c:if test="${sessionScope.user_num != null}">
					<div class="list_buttom">
						<input type="button" value="글쓰기" onclick="location.href='${root}/board/campQnA/write.do?user_num=${user_num}'">
					</div>	
				</c:if>
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
						<a href="${root}/board/campReview/list.do?pageNumber=1">[처음]</a>
					</c:if>
					<c:if test="${startPage>pageBlock}">
						<a href="${root}/board/campReview/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${root}/board/campReview/list.do?pageNumber=${i}">[${i}]</a>
					</c:forEach>
					
					<c:if test="${endPage<pageCount}">
						<a href="${root}/board/campReview/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
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
                                <button class="btn1"><span class="fa fa-paper-plane-o" aria-hidden="true">관리자 로그인</span></button>
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
