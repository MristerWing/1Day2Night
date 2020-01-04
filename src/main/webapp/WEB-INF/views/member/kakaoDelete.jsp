<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 체크</title>
</head>
<body>
	<h3>정말로 탈퇴하시겠습니까?</h3>
	<form action="${root}/member/kakaoDeleteOk.do" method="post">
		<input type="submit" value="--예--"/>&nbsp;&nbsp;&nbsp;&nbsp;
	</form>
	<a href="${root}/">--아니오(메인으로)--</a>
</body>
</html>