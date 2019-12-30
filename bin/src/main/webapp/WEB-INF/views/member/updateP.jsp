<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 전 비밀번호 확인</title>
</head>
<body>
	<form action="${root}/member/updatePo.do" method="post">
		비밀번호&nbsp;<input type="password" name="password"/>
		&nbsp;<input type="submit" value="확인"/>
	</form>
</body>
</html>