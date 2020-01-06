<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  
<html lang="utf-8">

<head>
</head>

<body>
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">캠핑장 리뷰</h3>
	             <div class="info_list">
					<div class="info_list_top">
							<form name="searchInfo" method="get" action="${root}/board/campReview/searchList.do">
						 <div class="input-group mb-3" style="width: 90">
	   						<!--  <div class="input-group-prepend">
	     						 <button class="btn btn-outline-primary" type="button">제목</button>  
	    					</div> -->
	    						<input type="text" class="form-control" placeholder="제목으로 검색" name="keyword" id="keyword">
	    						<input class="btn btn-outline-primary" type="submit" value="검색">  
	  						</div>
	  				 </form>
					</div> 
						
					<div id="info_list_content">
					<c:if test="${count==0||campReviewList.size()==0}">
						<div>
							<span>게시판에 저장된 글이 없습니다.</span>
						</div>
					</c:if>
					<!--작성글이있다면-->
					<div class="container">         
						  <table class="table table-striped">
						    <thead>
						      <tr>
						        <th>대표이미지</th>
						        <th>번호</th>
						        <th>제목</th>
						        <th>작성자</th>
						        <th>등록일</th>
						        <th>조회수</th>
						      </tr>
						    </thead>
						    <tbody style="vertical-align:center">
						       	 <c:if test="${count>0}">
						       	 	<c:forEach var="campReviewDto" varStatus="list" items="${campReviewList}">
						       	 		 <tr>
										        <td><img src="${pathList[list.index]}" width="120px"height="100px"></td>									 
										        <td>${campReviewDto.review_num}</td>
										        <td><a href="${root}/board/campReview/read.do?review_num=${campReviewDto.review_num}&pageNumber=${currentPage}">${campReviewDto.title}</a></td>
										        <td>${writerList[list.index]}</td>
										        <td><fmt:formatDate value="${campReviewDto.write_date}" pattern="yyyy-MM-dd"/></td>
										        <td>${campReviewDto.read_count}</td>
						     			 </tr>
						       	 	</c:forEach>
						       	 </c:if>
						    </tbody>
						  </table>
						</div>											
				 <c:if test="${sessionScope.user_num != null}">
					<div class="list_buttom" align="right">
						<button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campReview/write.do?user_num=${user_num}'">리뷰 작성</button>
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

</body>

</html>
