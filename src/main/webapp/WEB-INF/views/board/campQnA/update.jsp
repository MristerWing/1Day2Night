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

</head>

<body>
  <!--/ab -->
 <section class="about py-lg-5 py-md-5 py-5">

        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">문의사항</h3>
             <div class="info_content" >
				
				<label>문의사항 수정</label>
			<!--썸머노트 form태그-->
            <form class="campInfo_form" action="${root}/board/campQnA/updateOk.do" method="POST" 
            	onsubmit="returnForm(this)" enctype="multipart/form-data">
            <!--사용자한테 안보이는값-->
 			 	<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			<ul class="">
				<li>
					<input name="qna_num" type="hidden" value="${campQnADto.qna_num}">
				</li>
				<li>
					<label >제목(*)</label>
					<input name="title"  type="text" maxlength="100" value="${campQnADto.title}" onfocus="this.value=''">
				</li>
				<li>
					<label >작성자(*)</label>
					<input name="user_num" type="hidden" value="${campQnADto.user_num}"/>
					<input name="writer" type="text" value="${writer}" disabled="disabled"/>
				</li>
				
				<li>
					<label>내용</label>
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
				<li>
					<p>
						<input class="btn" type="submit" value="작성"/>	
						<input class="btn" type="button"  value="목록" onclick="location.href='${root}/board/campQnA/list.do?pageNumber=${pageNumber}'"/>	
					</p>
				
				</li>
		</ul>
		</form>            
	</div>   
            </div>
        </div>
    
        <!-- //services -->
    </section>

</body>

</html>
