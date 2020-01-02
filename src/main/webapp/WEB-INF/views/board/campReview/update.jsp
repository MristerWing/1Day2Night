<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet" />
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet" />
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	
	<!--파일 용량체크-->
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
    <!-- //main-content -->
  <!--/ab -->
 <section class="about py-lg-5 py-md-5 py-5">
	 <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">캠핑장 리뷰 수정</h3>
             <div class="review_content" >

				  <form class="campReview_form" action="${root}/board/campReview/updateOk.do" method="POST" 
            	enctype="multipart/form-data" onsubmit="returnForm(this)">
            	<!--숨겨서 넘어가는값 -->
            		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
            		<input name="review_num" type="hidden" value="${campReviewDto.review_num}">
				    <div class="form-group">
				      <label>제목 (*)</label>
				      <input type="text" class="form-control" id="title" name="title" value="${campReviewDto.title}" onfocus="this.value=''">
				    </div>
				    <div class="form-group">
				      <label for="pwd">작성자 (*)</label>
				      <input name="user_num" type="hidden" value="${memberDto.user_num}">
				      <input type="text" class="form-control" value="${writer}" name="writer" disabled="disabled">
				    </div>
				      <div class="form-group" >
					      <label for="sel1">캠핑장선택 (*)</label>
				      	<div class="select_location">
					      <select class="form-control" id="c_do" name="sellist1" style="height: 3.5rem; width: 50%;float: left">
					        <option>시,도</option>
					        	<option value="서울">서울시</option>
								<option value="부산">부산시</option>
								<option value="대구">대구시</option>
								<option value="인천">인천시</option>
								<option value="광주">광주시</option>
								<option value="대전">대전시</option>
								<option value="울산">울산시</option>
								<option value="세종">세종시</option>
								<option value="경기">경기도</option>
								<option value="강원">강원도</option>
								<option value="충북|충청북도">충청북도</option>
								<option value="충남|충청남도">충청남도</option>
								<option value="전북|전라북도">전라북도</option>
								<option value="전남|전라남도">전라남도</option>
								<option value="경북|경상북도">경상북도</option>
								<option value="경남|경상남도">경상남도</option>
								<option value="제주">제주도</option>
							</select>
						      <select class="form-control" id="camp_id" name="camp_id" style="height: 3.5rem; width: 50%">
						       	 <option>캠핑장 이름을 선택해 주세요</option>
						         <option value="11111">111111</option>
						
						      </select>
					     
						   </div>
      				</div>
      				<div class="uploaded_file">
      					<label>첨부된이미지(*):</label>&nbsp;&nbsp;<span>${file_name}</span>
      				</div>
      				 <div class="form-group">
      				 	  <label style="width:100%">대표이미지 수정</label>
      				 	<div class="file_upload" style="float:left">
					      <input type="file" class="form-control-file border" name="file" id="file" value="${file_name}">
				      </div>
					      <input type="button" value="upload" onclick="fileSizeCheck()" multiple="multiple">
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
					        var code=$('#content').summernote('code','${campReviewDto.content}');
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
