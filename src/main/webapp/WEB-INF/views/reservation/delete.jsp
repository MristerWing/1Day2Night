<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check == ''}">
		<script type="text/javascript">
			alert("예약 취소 실패");
			location.href="${root}/reservation/check.do?user_num=${user_num}";
		</script>
	</c:if>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("예약을 취소하였습니다.");
			location.href="${root}/reservation/check.do?user_num=${user_num}";
		</script>
	</c:if>
</body>
</html>