<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>

</head>

<body>
    <!-- //main-content -->
  <!--/ab -->
 <section class="about py-lg-5 py-md-5 py-5">

        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">캠핑장 리뷰</h3>
             <div class="info_content" >
				
				<label>캠핑장 리뷰 수정</label>
			<!--썸머노트 form태그-->
            <form class="campInfo_form" action="${root}/board/campReview/updateOk.do" method="POST" 
            	onsubmit="returnForm(this)" enctype="multipart/form-data">
            <!--사용자한테 안보이는값-->
 			 	<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			<ul class="">
				<li>
					<input name="review_num" type="hidden" value="${campReviewDto.review_num}">
				</li>
				<li>
					<label >제목(*)</label>
					<input name="title"  type="text" maxlength="100" value="${campReviewDto.title}" onfocus="this.value=''">
				</li>
				<li>
					<label >작성자(*)</label>
					<input name="user_num" type="hidden" value="${campReviewDto.user_num}"/>
					<input name="writer" type="text" value="${writer}" disabled="disabled"/>
				</li>

				<li>
					<label>첨부된 이미지</label>
					<span> ${file_name}</span>
					<br>
							<li>
							<label>파일 첨부</label>
							<!-- 	<a href="" onclick="return addFileInput('P','fileTd'); return false;">
								<img src="/img/2018/board/btn_addfile.png" alt="파일추가">
							</a>
							<a href="#ProgBtn" onclick="return addFileInput('M','fileTd'); return false;">
								<img src="/img/2018/board/btn_delfile.png" alt="파일삭제">
							</a> -->
							<input multiple="multiple" type="file" id="file" name="file" onchange="uploadImg_Change(this.value,'userfile1')" title="첨부파일1"/>
							<br>
						
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
					       
					        $('#content').summernote('code','${campReviewDto.content}')
					        
					        var code=$('#content').summernote('code');
					        $(".content").html(code);
					        
					        
					    });
					    </script>	
				<li>
					<p>
						<input class="btn" type="submit" value="작성"/>	
						<input class="btn" type="button"  value="목록" onclick="location.href='${root}/board/campReview/list.do?pageNumber=${pageNumber}'"/>	
					</p>
				
				</li>
		</ul>
		</form>            
	</div>   
            </div>
        </div>
    
        <!-- //services -->
    </section>

    <!-- //copyright -->

</body>

</html>
