<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${adminCheck > 0 }">
		<script type="text/javascript">
		//alert("관리자 로그인");
		location.href="${root}/admin/list.do";
		</script>
	</c:if>
	
	
	<c:if test="${adminCheck == 0}">
		<script type="text/javascript">
		alert("※접속 권한 없음※");
		location.href="${root}";
		</script>
	</c:if>
	
</body>
</html>