<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>로그인확인</title>
</head>
<body>
	<c:if test="${sessionScope.user_num != null}">
		<script type="text/javascript">
			alert("로그인 되었습니다.");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
	<c:if test="${sessionScope.user_num == null}">
		<script type="text/javascript">
			alert("로그인 실패");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
</body>
</html>