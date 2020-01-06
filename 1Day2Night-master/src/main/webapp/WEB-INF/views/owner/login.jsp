<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${root}/resources/css/owner/login.css" />
</head>
<body>
	<div class="owner">
		<div class="container content-area">
			<form action="${root}/owner/loginOk.do" class="login-area border rounded mx-auto" method="POST">
				<label class="main-text mx-auto">사업자 로그인</label> <input type="text"
					name="owner_key" id="owner_key" class="mx-auto" placeholder="사업자 번호"/>
				<button class="mx-auto btn btn-primary" type="submit">로그인</button>
				<a href="${root}/owner/register.do" class="mx-auto link">사업자 등록이 필요하신가요? 등록하기</a>
			</form>
		</div>
	</div>
</body>
</html>
