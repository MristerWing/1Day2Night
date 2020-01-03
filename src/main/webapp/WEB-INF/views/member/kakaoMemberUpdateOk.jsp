<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 회원 정보 수정 확인</title>
</head>
<body>
<h3>
	MSI.kMUO.check: ${check}<br/>
	s.unum: ${sessionScope.user_num}<br/>
	s.uai: ${sessionScope.user_auth_id}<br/>
	s.regType: ${sessionScope.register_type}<br/>
	s.email: ${memberDto.email}<br/>
	s.eAKey: ${memberDto.email_auth_key}<br/>
</h3>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("연동 로그인된 회원의 정보가 수정되었습니다.");
			//location.href="${root}/";
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("연동 로그인 회원 정보 수정 실패");
			//location.href="${root}/";
		</script>
	</c:if>
</body>
</html>