<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>카카오로그인확인</title>
</head>
<body>
		<h3>${nickname}님 환영합니다.</h3>
		<h3>user_id : ${user_auth_id}</h3>
		<h3>access_token: ${access_Token}</h3><br/>
		<h3>refresh_token: ${refresh_Token}</h3>
		<h3>sessionScope.a_token: ${sessionScope.access_Token}</h3>
		<h3>s.id: ${sessionScope.user_auth_id}</h3>
		<h3>s.num: ${sessionScope.user_num}</h3>
		<h3>s.ref_tok: ${sessionScope.refresh_Token}</h3>
		<input type="button" value="인덱스로" onclick="location.href='${root}/index.jsp'"/>
		<input type="button" value="Logout" onclick="location.href='${root}/member/kakaoLogout.do'" />

</body>
</html>