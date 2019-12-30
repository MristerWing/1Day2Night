<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("탈퇴되었습니다.");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("탈퇴되지 못했습니다.");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
</body>
</html>