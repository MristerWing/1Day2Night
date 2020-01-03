<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카로</title>
</head>
<body>
	<c:if test="${userId == null}">
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=06ef11d13082c0f6655eada1dec1670a&redirect_uri=http://192.168.14.30:8181/camping/member/kakaoLoginOk.do&response_type=code">카카오 로그인</a>		
	</c:if>
	<c:if test="${userId != null}">
		<h3>카카오 로그인 성공</h3>
	</c:if>
</body>
</html>