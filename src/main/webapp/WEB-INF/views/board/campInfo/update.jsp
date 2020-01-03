<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>

    
    <!--summerNote-->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

	<!--파일사이즈 제한-->
	<script type="text/javascript">
		function fileSizeCheck() {
	
			if (document.getElementById("file").value != "") {
				var fileSize = document.getElementById("file").files[0].size;
			
				var maxSize = 10 * 1024 * 1024;
	
				if (fileSize > maxSize) {
					alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
					$("#file").val('');
					return;
				}
			}
		}
		/*null값 방지*/
		 function checkForm(){
 	  	  if($("#title").val()==""){
 	  		  alert("제목은 필수입력 사항입니다.");
 	  		  $("#title").focus();
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

 <section class="about py-lg-5 py-md-5 py-5">

        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">NEW 캠핑소식</h3>
             <div class="info_content" >
                     <div class="review_content" >

				  <form class="campInfo_form" action="${root}/board/campInfo/updateOk.do" method="POST" 
            		enctype="multipart/form-dat">
            		<!--사용자에겐 안보이는 정보-->
            		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
            		<input type="hidden" name="info_num" value="${campInfoDto.info_num}"/>
            		
				    <div class="form-group">
				   	<label >제목(*)</label>
					<input class="form-control" name="title"  type="text" maxlength="100" value="${campInfoDto.title}" onfocus="this.value=''">
				    </div>
				    <div class="form-group">
				      <label>작성자(*)</label>
				      <input name="user_num" type="hidden" value="${memberDto.user_num}">
				      <input type="text" class="form-control" value="${writer}" name="writer" disabled="disabled">
				    </div>
				
      				 <div class="form-group">
      				 	  <label style="width:100%">파일첨부</label>
      				 	<div class="file_upload" style="float:left" width:50% >
					      <input type="file" class="form-control-file border" name="file" id="file" multiple="multiple">
				      </div>
					      <input type="button" value="upload" onclick="fileSizeCheck()">
				    </div>
      	
				     <div class="form-group">
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
					       
					        $('#content').summernote('code','${campInfoDto.content}')
					        
					        var code=$('#content').summernote('code');
					        $(".content").html(code);
					        
					        
					    });
					    </script>	
				    </div>
					
					<div align="center">
					    <button type="submit" class="btn btn-primary" onclick="checkForm()">작성</button>
					    <button type="button" class="btn btn-primary" onclick="location.href='${root}/board/campInfo/list.do?pageNumber=${pageNumber}'" >목록</button>
				    </div>
				  </form>
			<!--썸머노트 form태그-->
       
	</div>   
				</div>
				
            </div>
        </div>
    
        <!-- //services -->
    </section>
</body>

</html>
