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
	
  			function deleteOk(root,user_num) {
				var url = root + "/admin/delete.do?user_num="+user_num;
				//alert(url);
				open(url,"",'status=no, height=500, width=1200, left='+ popupX + ', top='+ popupY);
		}	
  		    function update(root,user_num){
  		    	var url = root+"/admin/update.do?user_num="+user_num;
  		    	
  		    	open(url,"",'status=no, height=500, width=900, left='+ popupX + ', top='+ popupY);
  		    }
                               
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
                <th>content  </th>
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
                    <td>${i.content}</td>
                    <td>${i.write_date}</td>
           			<td><input type="button" class="btn btn-danger" value="수정" onclick="update('${root}','${i.user_num}')"></td>
           			<td><input type="button" class="btn btn-danger" value="삭제" onclick="deleteOk('${root}','${i.user_num}')"></td>
                 </tr>
                  <%--   <c:if test="${count>0}">
						       	<c:forEach var="campInfoDto" varStatus="list" items="${campInfoList}">
						       	 <tr>
								    <td>${campInfoDto.info_num}</td>
									<td><a href="${root}/board/campInfo/read.do?info_num=${campInfoDto.info_num}&pageNumber=${currentPage}">${campInfoDto.title}</a></td>
									<td>${writerList[list.index]}</td>
									<td><fmt:formatDate value="${campInfoDto.write_date}" pattern="yyyy-MM-dd"/></td>
									<td>${campInfoDto.read_count}</td>
								 </tr>
						       	 	</c:forEach>
						     </c:if> --%>
           </c:forEach>
        </tbody>   
    </table>
</body>
</html>