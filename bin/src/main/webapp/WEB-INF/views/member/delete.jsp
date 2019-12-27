<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<form action="${root}/member/deleteOk.do" method="post">
	비밀번호 <input type="password" name="password"/>
	<input type="submit" value="탈퇴"/>
	</form>
</body>
</html>