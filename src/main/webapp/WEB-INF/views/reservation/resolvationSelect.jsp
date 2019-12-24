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
	<h3>${campingList}</h3>
	<form action="${root}/reservation/dateSold.json" method="get">
		<input type="hidden" name="camp-id" value="${camp.camp_id}" />
		<span>캠핑명</span>
		<input type="text" name="camp_fee" />
		<span>시작</span>
		<input type="text" name="startDate" />
		<span>끝</span>
		<input type="text" name="endDate" />
		<span>인원</span>
		<input type="text" name="people" />
		<input type="submit" value="날짜 확인" />	
	</form>
	
</body>
</html>