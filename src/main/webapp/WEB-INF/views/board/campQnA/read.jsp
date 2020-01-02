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
 	<link rel="stylesheet" type="text/css" href="${root}/resources/css/board/boardRead.css">
   <script type="text/javascript">
        function replyQnA(root,qna_num,group_num,sequence_num,sequence_level,pageNumber,user_num){
        	 var url=root+"/board/campQnA/writeAnswer.do?qna_num="+qna_num;
    	     url +="&group_num="+group_num+"&sequence_num="+sequence_num;
    	     url +="&sequence_level="+sequence_level+"&pageNumber="+pageNumber+"&user_num="+user_num;
    	     alert(url);
    	     location.href=url;
        }
    </script>  
    
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    
</head>

<body>
 
				<!--본문 -->
				<!--댓글작성 form-->
				<section class="about py-lg-5 py-md-5 py-5">
		<div class="container">
			<div class="inner-sec-w3pvt py-lg-5 py-3">
				<h4 class="tittle text-center mb-lg-5 mb-3 px-lg-5">${campQnADto.title}</h4>
				<article>

					<div class="container" role="main">

						<div class="contents_form">

							<div class="writer">
								<span> 작성자:</span>&nbsp;<span>${writer}</span> &nbsp;&nbsp;
								<fmt:formatDate value="${campQnADto.write_date}" pattern="yyyy-MM-dd"/>
							</div>

							<div class="summernote_content">
								<span> <c:out value="${campQnADto.content}"
										escapeXml="false"></c:out>
								</span>
							</div>
						</div>



						<div style="margin-top: 20px" align="center">
							<c:if test="${sessionScope.user_num ==campQnADto.user_num}">
								<button type="button" class="btn btn-sm btn-primary"
									id="btnUpdate"
									onclick="location.href='${root}/board/campQnA/update.do?qna_num=${campQnADto.qna_num}&user_num=${campQnADto.user_num}&pageNumber=${pageNumber}'">수정</button>

								<button type="button" class="btn btn-sm btn-primary"
									id="btnDelete" onclick="location.href='${root}/board/campQnA/delete.do?qna_num=${campQnADto.qna_num}'">삭제</button>
							</c:if>
							<c:if test="${sessionScope.email=='eunsol8287@gmail.com'}">
							<button  class="btn btn-sm btn-primary" type="button" 
							onclick="replyQnA('${root}','${campQnADto.qna_num}','${campQnADto.group_num}',
							'${campQnADto.sequence_num}','${campQnADto.sequence_level}','${pageNumber}','${sessionScope.user_num}')">답글</button>
							</c:if>			
							<button type="button" class="btn btn-sm btn-primary" id="btnList"  onclick="location.href='${root}/board/campQnA/list.do?pageNumber=${pageNumber}'">목록</button>

						</div>

					</div>



				</article>

			</div>
		</div>
	</section>
			
			<!--세션스콥받아오는 작업해주고 고치기-->
<%-- 			<input type="hidden" name="user_num" value="${sessionScope.sessionID}">--%>			
		
    
</body>

</html>
