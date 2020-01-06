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
		var popupX = (window.screen.width / 2) - (900 / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		
		var popupY= (window.screen.height / 2) - (500 / 2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
  			function deleteOk(root,qna_num) {
				var url = root + "/admin/QnAdelete.do?qna_num="+qna_num;
				//alert(url);
				open(url,"",'status=no, height=500, width=900, left='+ popupX + ', top='+ popupY);
		}	
  		 /*    function update(root,user_num){
  		    	var url = root+"/admin/update.do?user_num="+user_num;
  		    	
  		    	open(url,"",'status=no, height=500, width=900, left='+ popupX + ', top='+ popupY);
  		    } */
                               
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>QNA_NUM </th>
                <th>USER_NUM  </th>
                <th>WRITE_DATE  </th>
                <th>QNA_TYPE</th>
                <th>TITLE </th>
                <!-- <th>수정</th> -->
                <th>삭제/확인</th>
            </tr>
        </thead>
        <tbody>
           <c:forEach var="i" items="${boardQnAList}">
           		 <tr>
                    <td>${i.qna_num}</td>
                    <td>${i.user_num}</td>
                    <td>${i.write_date}</td>
                    <td>${i.qna_type}</td>
                    <td>${i.title}</td>
           			<%-- <td><input type="button" class="btn btn-danger" value="수정" onclick="update('${root}','${i.user_num}')"></td> --%>
           			<td><input type="button" class="btn btn-danger" value="삭제" onclick="deleteOk('${root}','${i.qna_num}')"></td>
                 </tr>
                 
           </c:forEach>
        </tbody>   
    </table>
</body>
</html>