<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 방법 선택</title>
<script type="text/javascript">
	$(function(){
		var tooltip=$('<div class="balloon"></div>').appendTo('body');
		
		$()
	})
</script>
</head>
<body>
	<div id="wrapper" align="center" width="800px">
		
		<div class="emailRegister">
		<a href="${root}/member/privacyPolicyAgreement.do">
			<img src="${root}/resources/images/emailSmashiconsFromFlaticon.png" width="100px" height="100px" alt="이메일 회원가입"/>
<!-- 			이메일로 회원가입 -->
		</a>
		</div>
		&nbsp;&nbsp;&nbsp;
		<span class="kakaoRegister">
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=06ef11d13082c0f6655eada1dec1670a&redirect_uri=http://localhost:8181/camping/member/kakaoLogin.do&response_type=code">
				<img src="${root}/resources/images/kr_02_medium_press.png" alt="카카오 계정으로 로그인 등록"/><br/>
			</a>&nbsp;&nbsp;
		</span>
	</div>
</body>
</html>