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
    <title>ODTN</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="Camping Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script >
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
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
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">문의사항</h3>
             <div class="QnA_content" >
				
				<label>문의사항 수정</label>
			<!--썸머노트 form태그-->
            <form class="campReview_form" action="${root}/board/campQnA/updateOk.do" method="POST" 
            	enctype="multipart/form-data" onsubmit="returnForm(this)">
 	
 			<!--안보이게 넘어가는 값-->
				<input name=pageNumber type="hidden" value="${pageNumber}"/>
				<input name="qna_num" type="hidden" value="${campQnADto.qna_num}">
				
			  <div class="form-group">
				  <label>제목(*)</label>
				  <input type="text" class="form-control" id="title" name="title" value="${campQnADto.title}" onfocus="this.value=''">
			  </div>
			  <div class="form-group">
				  <label for="pwd">작성자(*)</label>
				  <input name="user_num" type="hidden" value="${memberDto.user_num}">
				  <input type="text" class="form-control" value="${writer}" name="user_name" disabled="disabled">
			 </div>
			  <div class="form-group">
				  <label for="pwd">비밀번호 입력(*)</label>
				  <input type="password" class="form-control" value="${writer}" name="password" onfocus="this.value=''">
			 </div>
				      <div class="form-group">
					      <label for="sel1">문의유형(*)</label>
					      <select class="form-control" id="qna_type" name="qna_type" style="height: 3.5rem;">
					      	 <option>문의유형을 선택 해 주세요(*)</option>
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
        <!-- //services -->
	
</body>

</html>
