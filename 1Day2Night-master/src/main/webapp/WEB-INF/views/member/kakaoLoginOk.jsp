<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 확인</title>
</head>
<body>
	<c:if test="${check == 0}">
		<c:if test = "${user_num ==0}">
			<% session.invalidate(); %>
			<script type="text/javascript">
				alert("회원 가입이 잘 되지 못했습니다.");
				location.href="${root}/";
			</script>
		</c:if>
		<c:if test="${user_num !=0}">
			<script type="text/javascript">
				alert("카카오로 연동 로그인 되었습니다.");
				location.href="${root}/";
			</script>
		</c:if>
	</c:if>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("카카오 연동 가입이 잘 되었습니다.");
			location.href="${root}/";
		</script>
<%-- 		<h3>${nickname}님 환영합니다.</h3> --%>
<%-- 		<h3>user_id : ${user_auth_id}</h3> --%>
<%-- 		<h3>access_token: ${access_Token}</h3><br/> --%>
<%-- 		<h3>refresh_token: ${refresh_Token}</h3> --%>
<%-- 		<h3>sessionScope.a_token: ${sessionScope.access_Token}</h3> --%>
<%-- 		<h3>s.id: ${sessionScope.user_auth_id}</h3> --%>
<%-- 		<h3>s.num: ${sessionScope.user_num}</h3> --%>
<%-- 		<h3>s.ref_tok: ${sessionScope.refresh_Token}</h3> --%>
		<input type="button" value="메인 화면으로 돌아가기" onclick="location.href='${root}/index.jsp'"/>
<%-- 		<input type="button" value="Logout" onclick="location.href='${root}/member/kakaoLogout.do'" /> --%>
	</c:if>

</body>
</html>