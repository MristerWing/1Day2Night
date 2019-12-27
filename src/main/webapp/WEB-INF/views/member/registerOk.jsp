<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
<%-- 	<c:out value="${check}"/> --%>
	
	<c:if test="${check>0}">
<!-- 		<h3>회원 등록이 완료되었습니다.<br/> -->
<!-- 		입력하신 이메일 주소의 메일을 확인해서 인증해주십시오.<br/> -->
<!-- 		</h3> -->
		<script type="text/javascript">
			alert("회원 등록이 완료되었습니다. 입력하신 이메일 주소의 메일을 확인해서 인증해주십시오.");
			location.href="${root}/index.jsp";
		</script>
<%-- 		<a href="${root}/member/emailVerify.do?uid=${sessionScope.user_num}&email=${sessionScope.email}&authkey=${sessionScope.user_auth_key}">재발송</a> --%>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("이메일 비밀번호 정보등록이 잘 되지 않았습니다.");
			location.href="${root}/index.jsp";
		</script>
	</c:if>
</body>
</html>