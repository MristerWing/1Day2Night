<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
  <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet" />
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet" />
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<script type="text/javascript">
 	function fileSizeCheck(){
 
 	    if(document.getElementById("file").value!=""){
 	    var fileSize = document.getElementById("file").files[0].size;
 	     
 	    var maxSize = 10 * 1024 * 1024;
 	 
 	    if(fileSize > maxSize){
 	       alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
 	       		$("#file").val('');
			return;
 	    }
 	}
 }
 	
 	</script>
</head>

<body>

  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">캠핑장 리뷰 작성</h3>
             <div class="review_content" >

				  <form class="campReview_form" action="${root}/board/campReview/writeOk.do" method="POST" 
            	enctype="multipart/form-data" onsubmit="returnForm(this)">
				    <div class="form-group">
				      <label>제목 (*)</label>
				      <input type="text" class="form-control" id="title" name="title">
				    </div>
				    <div class="form-group">
				      <label for="pwd">작성자 (*)</label>
				      <input name="user_num" type="hidden" value="${memberDto.user_num}">
				      <input type="text" class="form-control" value="${writer}" name="writer" disabled="disabled">
				    </div>
				      <div class="form-group" >
					      <label for="sel1">캠핑장선택 (*)</label>
				      	<div class="select_location">
					    
							
						      <select class="form-control" id="camp_id" name="camp_id" style="height: 3.5rem; width: 50%">
						       <c:if test="${bookingCnt>0}">
						       	 <option>캠핑장 이름을 선택해 주세요</option>
						       	 <c:forEach var="reservationDto" varStatus="list" items="${campList}">
						         	<option value="${reservationDto.camp_id}">${campNameList[list.index]}</option>
						         </c:forEach>
						       </c:if>  
						       <c:if test="${bookingCnt==0}">
						       	 <option>리뷰할 수 있는 캠핑장 내역이 없습니다.</option>
						       </c:if>  
						
						      </select>
						     <script type="text/javascript">
						        $("#c_do").mouseleave(function(){
							     var city=$("#c_do option:selected").val();
							     var paramdata=city;
							     alert(paramData);
							     var url="${root}/board/campReview/searchList.do?ci_do='${city}'"
							        $.ajax({
							        	url:url,
							        	data:paramData,
							        	type:'GET',
							        	dataType:'TEXT',
							        	success:function(data){
							        		console.log("성공");
							        	}
							        })	
							        
						        });
						   	</script>			     
						   </div>
      				</div>
      				 <div class="form-group">
      				 	  <label style="width:100%">대표이미지를 선택해주세요(선택사항입니다.)</label>
      				 	<div class="file_upload" style="float:left">
					      <input type="file" class="form-control-file border" name="file" id="file">
				      </div>
					      <input type="button" value="upload" onclick="fileSizeCheck()">
				    </div>
				     <div class="form-group">
      				  <label>내용을 입력해주세요 (*)</label>
      				  	<textarea name="content" rows="3" id="content"></textarea>
						<!--썸머노트 한글설정-->
						<script type="text/javascript" src="${root}/resources/javascript/summernote/summernote-ko-KR.js">
						</script>
						
						<script type="text/javascript">
						$(document).ready(function() {
					        $('#content').summernote({
					        	
					     		height:600,
					     		minHeight:null,
					     		maxHeight:null,
					     		focus:true,
					     		lang:'ko-KR'
					       
					        });
					        var code=$('#content').summernote('code');
					        $(".content").html(code);
					    });
					    </script>	
				     
				    </div>
					<div align="center">
				   		 <button type="submit" class="btn btn-primary">작성</button>
				   		 <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campReview/list.do?pageNumber=${pageNumber}'" >목록</button>
					</div>
				  </form>
			<!--썸머노트 form태그-->
       
	</div>   
            </div>
        </div>
        <!-- //services -->
    </section>
</body>

</html>
