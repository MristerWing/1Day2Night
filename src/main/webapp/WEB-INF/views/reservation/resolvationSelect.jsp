<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>${campList}</h3>
	<form action="${root}/reservation/pay.do" method="get">
		<input type="text" name="selectDate" />
		<input type="submit" value="결제" />	
	</form>
	
</body>
</html>