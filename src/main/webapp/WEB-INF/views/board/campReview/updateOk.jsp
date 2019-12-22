<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>삭제확인</title>
</head>
<body>
		<c:if test="${check>0}">
			<script type="text/javascript">
			alert("게시물이수정되었습니다.");
			location.href="${root}/board/campReview/list.do";
			</script>
		</c:if>
		
		<c:if test="${check==0}">
			<script type="text/javascript">
			alert("게시물 수정에 실패하였습니다.");
			location.href="${root}/board/campReview/update.do?review_num="${campReviewDto.review_num}"&pageNumber="${pageNumber}";
			</script>
		</c:if>
</body>
</html>