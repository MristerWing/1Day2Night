<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>finalMemberIndex</title>
</head>
<body>
<%-- 	<a href="${root}/member/start.do">시작</a> --%>
	
<%-- 	<c:if test="${memberLevel == null}"> --%>
		<a href="${root}/member/register.do">회원가입</a>
		<a href="${root}/member/login.do">로그인</a>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${memberLevel != null}"> --%>
		<a href="${root}/member/update.do">회원 정보 수정</a>
		<a href="${root}/member/delete.do">회원 탈퇴</a>
<%-- 		<c:if test="${memberLevel == 'admin'}"> --%>
			<a href="${root}/member/adminPage.do">관리자 페이지</a>
<%-- 		</c:if> --%>
<%-- 	</c:if> --%>
	
</body>
</html>