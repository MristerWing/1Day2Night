<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<html lang="utf-8">
 
<head>
    <script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
   <script type="text/javascript">
    	function content_alert(){
    		alert
    	}
    </script>  
    
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

</head>

<body>
  <!--/ab -->
  <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">문의사항 답변</h3>
             <div class="QnA_content" >
				
			<!--썸머노트 form태그-->
            <form class="campReview_form" action="${root}/board/campQnA/writeAnswerOk.do" method="POST" 
            	enctype="multipart/form-data" onsubmit="returnForm(this)">
 	
 			<!--안보이게 넘어가는 값-->
				<input type="hidden" name="qna_num" value="${qna_num}"/>
				<input type="hidden" name="group_num" value="${group_num}"/>
				<input type="hidden" name="sequence_num" value="${sequence_num}"/>
				<input type="hidden" name="sequence_level" value="${sequence_level}"/>
				<input type="hidden" name="sequence_level" value="${sequence_level}"/>
 			 	<input type="hidden" name="pageNumber" value="${pageNumber}"/>
 			 	<input type="hidden" name="password" value="${password}"/>
 			 	<input type="hidden" name="qna_type" value="${campQnADto.qna_type}">
				
			  <div class="form-group">
				  <label>제목(*)</label>
				  <input type="text" class="form-control" id="title" name="title" value="${title}" onfocus="this.value=''">
			  </div>
			  <div class="form-group">
				  <label for="pwd">작성자(*)</label>
				  <input name="user_num" type="hidden" value="${memberDto.user_num}">
				  <input type="text" class="form-control" value="${writer}" name="user_name" disabled="disabled">
			 </div>
		
				     <div class="form-group">
      				  <label>답변을 입력해주세요</label>
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
					        $('#content').summernote('code','${campQnADto.content}')			        
					        var code=$('#content').summernote('code')
					        $(".content").html(code);  
					    });
					    </script>	
				     
				    </div>
					<div align="right">
				    <button type="submit" class="btn btn-primary">작성</button>
				    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campQnA/list.do?pageNumber=${pageNumber}'" >목록</button>
				 	</div>
				  </form>
			</div>   
           </div>
        </div>
    </section>
</body>

</html>
