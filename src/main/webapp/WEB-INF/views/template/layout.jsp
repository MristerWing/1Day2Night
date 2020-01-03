<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODTN-Perfect camping 4 U</title>
</head>
<body>
	<div class="template">
		<!-- header.jsp -->
		<t:insertAttribute name="header"></t:insertAttribute>

		<!-- content, 각각의 jsp -->
		<t:insertAttribute name="content"></t:insertAttribute>
		<!-- footer.jsp -->
		<t:insertAttribute name="footer"></t:insertAttribute>
	</div>
</body>
</html>