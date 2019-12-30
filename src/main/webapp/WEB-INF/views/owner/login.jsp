<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${root}/resources/css/owner/login.css" />
<script type="text/javascript"
	src="${root}/resources/javascript/owner/login.js"></script>
</head>
<body>
	<div class="owner">
		<div class="container content-area">
			<div class="login-area border rounded mx-auto">
				<label class="main-text mx-auto">사업자 로그인</label> <input type="text"
					id="owner_key" class="mx-auto" />
				<button class="mx-auto btn btn-primary" onclick="login('${root}')">로그인</button>
				<a href="#" class="mx-auto link">사업자 등록이 필요하신가요? 등록하기</a>
			</div>
		</div>
	</div>
</body>
</html>
