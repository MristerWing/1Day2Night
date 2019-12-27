<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>작성확인</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("게시물이 작성되었습니다.")
			location.href="${root}/board/campQnA/list.do";
		</script>
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("게시물 작성에 실패하였습니다.")
			location.href="${root}/board/campReview/write.do";
		</script>
	</c:if>
</body>
</html>