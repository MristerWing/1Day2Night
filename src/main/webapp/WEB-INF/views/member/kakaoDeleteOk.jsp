<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>카카오계정 연동 회원 탈퇴</title>
</head>
<body>
<% session.invalidate(); %>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("카카오 연동 정보가 삭제 되었습니다.");
		</script>
	</c:if>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("탈퇴 못했습니다.")
		</script>
	</c:if>
</body>
</html>