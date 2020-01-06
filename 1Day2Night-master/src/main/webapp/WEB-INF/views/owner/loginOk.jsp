<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	
	<c:if test="${ownerDto == 'error'}">
		<script type="text/javascript">
			alert("사업자 번호가 올바르지 않습니다.");
			location.href="${root}/owner/login.do";
		</script>
	</c:if>
	<c:if test="${ownerDto != 'error'}">
		<form action="${root}/owner/mainPage.do" method="POST">
			<input type="hidden" name="owner_key" value="${ownerDto.owner_key}" />
			<input type="hidden" name="camp_id" value="${ownerDto.camp_id}" />
			<input type="hidden" name="user_num" value="${ownerDto.user_num}" />
		</form>
		<script type="text/javascript">
			//location.href="${root}/owner/mainPage.do?owner_key=${ownerDto.owner_key}&camp_id=${ownerDto.camp_id}&user_num=${ownerDto.user_num}";
			$("form").submit();
		</script>
	</c:if>
</body>
</html>