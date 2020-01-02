<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
    <title>ODTN</title>
</head>

<body>
    <!-- //main-content -->
  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">NEW 캠핑소식</h3>
	             <div class="info_list">
					<div class="info_list_top">
					<form name="searchInfo" method="get" action="${root}/board/campInfo/serchList.do">
						 <div class="input-group mb-3" style="width: 90">
	   						<!--  <div class="input-group-prepend">
	     						 <button class="btn btn-outline-primary" type="button">제목</button>  
	    					</div> -->
	    						<input type="text" class="form-control" placeholder="검색어입력" name="keyword" id="keyword">
	    						<input class="btn btn-outline-primary" type="submit" value="검색">  
	  						</div>
	  				 </form>
					</div> 
						
					<div id="info_list_content">
					<c:if test="${count==0||campInfoList.size()==0}">
						<div>
							<span>게시판에 저장된 글이 없습니다.</span>
						</div>
					</c:if>
					<!--작성글이있다면-->
				 <c:if test="${count>0}">
				 			
					<div class="container">         
						  <table class="table table-striped">
						    <thead>
						      <tr>
						        <th>번호</th>
						        <th>제목</th>
						        <th>작성자</th>
						        <th>등록일</th>
						        <th>조회수</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:if test="${count>0}">
						       	<c:forEach var="campInfoDto" varStatus="list" items="${campInfoList}">
						       	 <tr>
								    <td>${campInfoDto.info_num}</td>
									<td><a href="${root}/board/campInfo/read.do?info_num=${campInfoDto.info_num}&pageNumber=${currentPage}">${campInfoDto.title}</a></td>
									<td>${writerList[list.index]}</td>
									<td><fmt:formatDate value="${campInfoDto.write_date}" pattern="yyyy-MM-dd"/></td>
									<td>${campInfoDto.read_count}</td>
								 </tr>
						       	 	</c:forEach>
						     </c:if>
						    </tbody>
						  </table>
					</div>	
				 </c:if> 

				  <c:if test="${sessionScope.email=='chanhok95@naver.com'}">
					<div class="list_buttom" align="right">
						<button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campInfo/write.do?user_num=${user_num}'">공지 작성</button>
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
    </section>
</body>

</html>
