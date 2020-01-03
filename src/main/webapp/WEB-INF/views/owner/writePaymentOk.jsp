<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check == ''}">
		<script type="text/javascript">
			alert("캠핑장 등록 실패");
			history.back();
		</script>
	</c:if>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("캠핑장 등록 성공");
			location.href="${root}";
		</script>
	</c:if>
</body>
</html>