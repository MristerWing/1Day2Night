<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>삭제확인</title>
</head>
<body>
		<c:if test="${check>0}">
			<script type="text/javascript">
			alert("게시물이 삭제되었습니다.");
			location.href="${root}/board/campInfo/list.do?pageNumber=${pageNumber}";
			</script>
		</c:if>
		
		<c:if test="${check==0}">
			<script type="text/javascript">
			alert("게시물삭제에 실패하였습니다.");
			location.href="${root}/board/campInfo/read.do?info_num=${info_num}&pageNumber=${pageNumber}";
			</script>
		</c:if>
</body>
</html>