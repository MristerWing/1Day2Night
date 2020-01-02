<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
  <script type="text/javascript">
  	function password(){
  		var password = $("#password").val();
  		var user_num = $("#user_num").val();
  		alert(user_num+", "+password);
		var url="${root}/board/campQnA/pwdCheck.do?password="+password+"&user_num="+user_num;
		alert(url);
		location.href=url;
  	}
  </script>
    


</head>

<body>
	<!--++++++++++++++ModalStart++++++++++++++++++++++++++++++++-->
	<div class="modal" id="check_pwd">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Password</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      
        <input type="hidden" id="user_num" value="${sessionScope.user_num}">
        <input type="password" id="password" style="height:3rem; width: 50%" onfocus="this.value=''">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" style="background-color:#0781ff; border-color:#0781ff " onclick="password()">확인</button>
      </div>

    </div>
  </div>
</div>
	
	<!--++++++++++++++ModalEnd++++++++++++++++++++++++++++++++++-->
    <!-- //main-content -->
  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">문의사항</h3>
	             <div class="info_list">
					<div class="info_list_top">
						<form name="searchInfo" method="get" action="${root}/board/campQnA/searchList.do">
						 <div class="input-group mb-3" style="width: 90">
	
	    						<input type="text" class="form-control" placeholder="작성자 이름으로 검색" name="keyword" id="keyword">
	    						<input class="btn btn-outline-primary" type="submit" value="검색">  
	  						</div>
	  				 </form>
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
										        <c:if test="${sessionScope.email != 'eunsol8287@gmail.com' && sessionScope.user_num > 0}">
										        	<td><button type="button" class="btn btn-link"  data-toggle="modal" data-target="#check_pwd">${campQnADto.title}</button></td>
										        </c:if>
										        <td>${campQnADto.title}</td>
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
					<div class="list_buttom" align="right">
					  <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campQnA/write.do?user_num=${user_num}'">글쓰기</button>
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
       </div>
         
        <!-- //services -->
    </section>

</body>

</html>
