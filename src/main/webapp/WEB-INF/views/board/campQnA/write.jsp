
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
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
   <script type="text/javascript">
    </script>  
    
    <script type="text/javascript">
    function checkForm(){
  	  if($("#title").val()==""){
  		  alert("제목은 필수입력 사항입니다.");
  		  $("#title").focus();
  		  return false;
  	  }if ($("#password").val()=="") {
		  alert("비밀번호는 필수입력 사항입니다.");
		  $("#password").focus();
		  return false;
	}
  	  if ($("#qna_type").val()=="선택안함") {
		  alert("문의유형을 선택해 주세요.");
		  $("#qna_type").focus();
		  return false;
	}
    	if ($("#content").val()=="") {
		  alert("내용을 입력해 주세요");
		  $("#content").focus();
		  return false;
	}
    	$("form").submit();
    }
    </script>

</head>

<body>
   
  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">문의사항</h3>
             <div class="QnA_content" >
				
				<label>문의사항 작성</label>
			<!--썸머노트 form태그-->
            <form class="campQnAReview_form" action="${root}/board/campQnA/writeOk.do" method="POST" 
            	enctype="multipart/form-data">
 	
				<input type="hidden" name="qna_num" value="${qna_num}"/>
				<input type="hidden" name="group_num" value="${group_num}"/>
				<input type="hidden" name="sequence_num" value="${sequence_num}"/>
				<input type="hidden" name="sequence_level" value="${sequence_level}"/>
				<input type="hidden" name="sequence_level" value="${sequence_level}"/>
				
			  <div class="form-group">
				  <label>제목(*)</label>
				  <input type="text" class="form-control" id="title" name="title">
			  </div>
			  <div class="form-group">
				  <label for="pwd">작성자(*)</label>
				  <input name="user_num" type="hidden" value="${memberDto.user_num}">
				  <input type="text" class="form-control" value="${writer}" name="user_name" disabled="disabled">
			 </div>
			  <div class="form-group">
				  <label for="pwd">비밀번호 입력(*)</label>
				  <input type="password" class="form-control" value="${writer}" id="password" name="password" onfocus="this.value=''">
			 </div>
				      <div class="form-group">
					      <label for="sel1">문의유형(*)</label>
					      <select class="form-control" id="qna_type" name="qna_type" style="height: 3.5rem;">
					      	 <option value="선택안함">문의유형을 선택 해 주세요(*)</option>
					      	 <option value="캠핑장">캠핑장 관련문의</option>
						 	 <option value="이벤트">이벤트 관련문의</option>
						     <option value="기타">기타문의</option>
					      </select>
      				</div>
				     <div class="form-group">
      				  <label>내용을 입력해주세요</label>
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
					<div align="right">
				    <button type="button" class="btn btn-primary" onclick="checkForm()">작성</button>
				    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campQnA/list.do?pageNumber=${pageNumber}'" >목록</button>
				 	</div>
				  </form>
			</div>   
           </div>
        </div>
        <!-- //services -->
    </section>

</body>

</html>
