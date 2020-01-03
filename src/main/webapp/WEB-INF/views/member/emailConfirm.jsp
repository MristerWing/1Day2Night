<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 확인됨</title>
<style type="text/css">
	h5{
		text-align: center;
	}
	button{
		margin-left: 15px;
		margin-bottom: 15px;
		margin-top: 15px;
	}
</style>

</head>
<body>
<div class="container">
<%-- 	<h3>user_num: ${sessionScope.user_num}</h3> --%>
<%-- 	<h3>email_auth_key: ${sessionScope.email_auth_key}</h3> --%>
	<c:if test="${check > 0}">
<%-- 		<h3>email: ${email}님,</h3> --%>
<!-- 		<h3>이메일 인증이 확인 되었습니다. 가입을 축하합니다.</h3> -->
<!-- 		<h3>추가 정보를 입력해주신다면 더욱 원활한 서비스를 받으실 수 있습니다.</h3> -->
<%-- 		<h3>입력하신다면 <a href="${root}/member/update.do">여기</a>를 누르시고, --%>
<!-- 		추후에 입력하신다면 회원 정보 수정에서 입력하실 수 있습니다.  -->
<!-- 		아래의 메인으로를 눌러주세요.</h3> -->
		
		<h5>email: ${email}님,</h5>
		<h5>이메일 인증이 확인 되었습니다. 가입을 축하합니다.</h5>
		<h5>아래의 메인으로를 눌러주세요.</h5>
	</c:if>
	<button type="button" class="btn btn-primary" onclick=javascript:location.href="${root}/index.jsp">메인으로</button>
</div>
</body>
</html>