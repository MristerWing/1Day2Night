<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
	<script type="text/javascript">
	function remove(){
		close();
	}
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap Core CSS -->
    <link href="${root}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    input{
    background-color: aqua;
    }
    
    td, th {
    padding: 0;
    text-align: center;
    background-color: aliceblue;
	}
    </style>
</head>
<body>
<%-- 	<div align="center" style="margin: 100px auto;">
	<form class="form" action="${root}/admin/deleteOk.do" method=post>
		<input type="hidden" name="user_num" value="${adminDto.user_num}">
			<table>
		        <thead>
		            <tr>
		                <th>user_num</th>
		                <th>회원 아이디(nickname)</th>
		                <th>이름(user_name)</th>
		                <th>이메일(email)</th>
		                <th>(이메일,카카오)register_type</th>
		                <th>register_data</th>
		            </tr>
		        </thead>
		      	 <tbody>
		           		 <tr>
		                    <td>${adminDto.user_num}</td>
		                    <td>${adminDto.nickname}</td>
		                    <td>${adminDto.user_name}</td>
		                    <td>${adminDto.email}</td>
		                    <td>${adminDto.register_type}</td> <!--null= email , kakao = kakao  -->
		           			<td>${adminDto.register_date}</td>
		                 </tr>
		        </tbody>   
		    </table>
		    <input type="submit" class="btn btn-danger" value="삭제"> <input type="reset" class="btn btn-danger" value="취소" onclick="remove()">
		</form>
	</div>
	 --%>
	 <div align="center" style="margin: 100px auto;">
		<form class="form" action="${root}/admin/deleteOk.do" method=post>
		   <div>
			<input type="hidden" name="user_num" value="${adminDto.user_num}">
 				<table border="1">
					<tr>
					   <td>user_num</td>
					   <td><input type="text" size="30"  value="${adminDto.user_num}" disabled="disabled"></td>
				  </tr>
				  <tr>
					   <td>nickname</td>
					   <td><input type="text" size="30" value="${adminDto.nickname}" disabled="disabled"></td>
				  </tr>
				  <tr>
					   <td>user_name</td>
					   <td><input type="password" size="30" value="${adminDto.user_name}" disabled="disabled"></td>
				  </tr>
				  <tr>
					   <td>email</td>
					   <td><input type="text" size="30"  value="${adminDto.email}" disabled="disabled"></td>
				  </tr>
				  <tr>
					   <td>register_type</td>
					   <td><input type="text" size="30" value="${adminDto.register_type}" disabled="disabled"></td>
				  </tr>
				   <tr>
					   <td>register_data</td>
					   <td><input type="text" size="30"  value="${adminDto.register_date}" disabled="disabled"></td>
				  </tr>
 				</table>
  				<input type="submit" class="btn btn-danger" value="삭제"> <input type="reset" class="btn btn-danger" value="취소" onclick="remove()">
  			</div>
</form>
</div>
</body>
</html>