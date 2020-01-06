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
		<c:if test="${qna!=null}">
			<script type="text/javascript">
			
			location.href="${root}/board/campQnA/read.do?qna_num="+${qna.qna_num}+"&pageNumber="+${currentPage};
			</script>
		</c:if>
		
		
		<c:if test="${qna==null}">
			<script type="text/javascript">
			alert("비밀번호가 틀렸습니다.비밀번호를 확인해 주세요");
			location.href="${root}/board/campQnA/list.do?";
			</script>
		</c:if>
</body>
</html>