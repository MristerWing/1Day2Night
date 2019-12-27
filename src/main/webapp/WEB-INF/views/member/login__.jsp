<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${root}/member/loginOk.do" method="post">
		이메일&nbsp;<input type="text" name="email"/><br/>
		비밀번호&nbsp;<input type="password" name="password"/><br/>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>