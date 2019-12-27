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
<%-- 	<c:set var="user_num" value="${user_num}" scope="session"/> --%>
<%-- 	<c:set var="email" value="${email}" scope="session"/> --%>
<%-- 	<c:set var="email_auth_key" value="${email_auth_key}" scope="session"/> --%>
	<h3>s.unum: ${sessionScope.user_num}<br/>
	s.email: ${sessionScope.email}<br/>
	s.eAKey: ${sessionScope.email_auth_key}<br/>
	s.regType: ${sessionScope.register_type}<br/>
	</h3>
	
	<c:if test="${sessionScope.user_num != null}">
		<script type="text/javascript">
			alert("로그인 되었습니다.");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
	<c:if test="${sessionScope.user_num == null}">
		<script type="text/javascript">
			alert("로그인 실패");
			//location.href="${root}/login.jsp";
		</script>
	</c:if>
</body>
</html>