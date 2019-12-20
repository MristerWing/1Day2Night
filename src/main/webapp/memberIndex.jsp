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

	<c:if test="${sessionScope.user_auth_id != null}">
	<h3>${nickname}님 환영합니다.</h3>
		<h3>user_id : ${user_auth_id}</h3>
		<h3>access_token: ${access_Token}</h3><br/>
		<h3>sessionScope.a_token: ${sessionScope.access_Token}</h3>
		<h3>s.id: ${sessionScope.user_auth_id}</h3>
		<h3>s.num: ${sessionScope.user_num}</h3>
		<h3>s.refToken: ${sessionScope.refresh_Token}</h3>
		<h3>refToken: ${refresh_Token}<br/></h3>
	</c:if>
	
	<c:if test="${email_auth_key != null}">
		<c:if test = "${user_auth_id == null}">
		<h3>${email}님 환영합니다.</h3>
		<h3>user_num : ${user_num}</h3>
		
		<h3>sessionScope.email_auth_key: ${sessionScope.email_auth_key}</h3>
		<h3>s.num: ${sessionScope.user_num}</h3>
		<h3>s.email: ${sessionScope.email}</h3>
		</c:if>
	</c:if>
		
	<c:if test="${email == null}">
		<c:if test="${user_auth_id==null}">
			<a href="${root}/member/privacyPolicyAgreement.do">
				<img src="./resources/images/emailSmashiconsFromFlaticon.png" width="100px" height="100px" alt="이메일 회원가입"/>
			<br/>이메일로 회원가입</a><br/>
			<a href="${root}/member/login.do">로그인</a>&nbsp;&nbsp;
		</c:if>
	</c:if>
	<c:if test="${sessionScope.email_auth_key != null}">
		<c:if test="${sessionScope.user_auth_id == null}">
		<a href="${root}/member/logout.do">로그아웃</a><br/>
		</c:if>
	</c:if>
		
		<c:if test="${sessionScope.user_auth_id == null}">
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=06ef11d13082c0f6655eada1dec1670a&redirect_uri=http://localhost:8181/camping/member/kakaoLogin.do&response_type=code">
			<img src="./resources/images/kr_02_medium_press.png" alt="카카오 로그인"/><br/>
			카카오 로그인</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${sessionScope.user_auth_id!=null}">
			<a href="${root}/member/kakaoLogout.do">카카오 로그아웃</a>
		</c:if>
		
		<c:if test="${sessionScope.user_num != null}">
			<a href="${root}/member/update.do">회원 정보 수정</a>&nbsp;&nbsp;
		</c:if>
	<c:if test="${sessionScope.email_auth_key != null}">
		<c:if test="${sessionScope.user_auth_id == null}">
		<a href="${root}/member/delete.do">회원 탈퇴</a>
		</c:if>
	</c:if>
	<c:if test="${sessionScope.user_auth_id != null}">
		<a href="${root}/member/kakaoDelete.do">카카오회원 탈퇴</a>
	</c:if>
			<c:if test="${email == 'egeoda@protonmail.com'}">
	&nbsp;&nbsp;<a href="${root}/member/adminPage.do">관리자 페이지</a>
	</c:if>	
</body>
</html>