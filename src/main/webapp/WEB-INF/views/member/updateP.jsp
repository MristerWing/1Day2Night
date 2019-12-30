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
<h3>회원 정보를 수정하시거나 탈퇴하시려면 비밀번호를 재입력 해주십시오.</h3>
	<form action="${root}/member/updatePo.do" method="post">
		비밀번호&nbsp;<input type="password" name="password"/>
		&nbsp;<input type="submit" value="수정"/><br/><br/>
	</form>
	
	<form action="${root}/member/deleteOk.do" method="post">
	비밀번호&nbsp;<input type="password" name="password"/>
	&nbsp;<input type="button" value="탈퇴" />
	</form>
	<c:if test="${memberDto == null}">
		<c:if test="${password_fail == 't' }">
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다.");
			</script>
		</c:if>
	</c:if>
	
</body>
</html>