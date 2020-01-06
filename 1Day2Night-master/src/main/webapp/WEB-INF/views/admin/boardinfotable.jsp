<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<%-- 	<script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script> --%>
	 <script type="text/javascript" src="${root}/resources/javascript/admin/datatables.min.js"></script>
	<link rel="stylesheet" href="${root}/resources/css/admin/datatables.min.css">
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#example').DataTable();
		} );
	</script>
	 <script type="text/javascript">
		var popupX = (window.screen.width / 2) - (1200 / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		
		var popupY= (window.screen.height / 2) - (500 / 2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
  			function deleteOk(root,info_num) {
				var url = root + "/admin/campInfodelete.do?info_num="+info_num;
				//alert(url);
				open(url,"",'status=no, height=500, width=1200, left='+ popupX + ', top='+ popupY);
		}	
  		 /*     function update(){
  		    	var url = location.href='${root}/board/campInfo/update.do?info_num=${i.info_num}&user_num=${i.user_num}&pageNumber=1'
  		    
  		    	open(url,"",'status=no, height=500, width=900, left='+ popupX + ', top='+ popupY);
  		    }  */
                               
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>INFO_NUM</th>
                <th>TITLE </th>
                <th>USER_NUM </th>
                <th>WRITE_DATE </th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
           <c:forEach var="i" items="${BoardInfoList}">
           		 <tr>
                    <td>${i.info_num}</td>
                    <td>${i.title}</td>
                    <td>${i.user_num}</td>
                    <td>${i.write_date}</td>
           			<td><input type="button" class="btn btn-danger" value="수정" onclick="location.href='${root}/board/campInfo/update.do?info_num=${i.info_num}&user_num=${i.user_num}&pageNumber=1'"></td>
           			<td><input type="button" class="btn btn-danger" value="삭제" onclick="deleteOk('${root}','${i.info_num}')"></td>
                 </tr>
           </c:forEach>
        </tbody>   
    </table>
</body>
</html>	