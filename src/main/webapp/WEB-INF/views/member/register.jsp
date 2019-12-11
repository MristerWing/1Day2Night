<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" src="${root}/resources/css/member/member.css"/>
<script type="text/javascript" src="${root}/resources/javascript/member/member.js"></script>

</head>
<body>

	<form action="${root}/member/registerOk.do" method="post"
		onsubmit="return registerForm(this)" name="createForm">
		<input type="text" name="email_id" />&nbsp; 
		<input type="button" name="emailveri" onclick="#"/><br/>
		<input type="password" name="password" /><br />
		<input type="password" name="passwordcheck" /><br />
		<input type="submit" value="가입" />&nbsp;
		<input type="reset" value="취소" /><br/>
	</form>

</body>
</html>