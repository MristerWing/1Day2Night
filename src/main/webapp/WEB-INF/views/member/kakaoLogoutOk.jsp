<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Logout</title>
</head>
<body>
	<c:if test="${sessionScope.access_Token == null}">
		<script type="text/javascript">
			alert("로그아웃 되었습니다.");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
	<c:if test="${sessionScope.access_Token != null}">
		<script type="text/javascript">
			alert("로그아웃 못했습니다, 쿠키를 삭제해서 로그아웃 하세요");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
</body>
</html>