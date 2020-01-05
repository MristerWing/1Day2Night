<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 확인</title>
</head>
<body>
<!-- <h3>-Common<br/> -->
<%-- 	check: ${check}<br/> --%>
<%-- 	s.unum: ${sessionScope.user_num}<br/> --%>
<%-- 	s.rType: ${sessionScope.register_type}<br/> --%>
<!-- 	<br/> -->
<!-- 	-Reg by email<br/> -->
<%-- 	s.email: ${sessionScope.email}<br/> --%>
<%-- 	s.email_auth_key: ${sessionScope.email_auth_key}<br/> --%>
<!-- 	<br/> -->
<!-- 	-Reg by Kakao<br/> -->
<%-- 	s.uid: ${sessionScope.user_auth_id}<br/> --%>
<%-- 	s.aToken: ${sessionScope.access_Token}<br/> --%>
	
	
	
	

	<c:if test="${check >0}">
		<script type="text/javascript">
			alert("회원 정보가 수정되었습니다.");
			location.href="${root}/";
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("회원 정보 수정 실패");
			location.href="${root}/";
		</script>
	</c:if>

</body>
</html>