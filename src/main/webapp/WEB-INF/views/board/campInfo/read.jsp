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
                <h5 class="tittle text-center mb-lg-5 mb-3 px-lg-5">NEW 캠핑소식</h5>
                <article>

		<div class="container" role="main" >

			<div class="bg-white rounded shadow-sm">

				<div class="board_title">
					<label>[ 제목 ]:</label>
					<label>${campInfoDto.title}</label>
				</div>

				<div class="board_info_box">
					<span class="board_author">
						<label>[공지 번호 ]: </label>
						<label>${campInfoDto.info_num}</label>	
					</span>
				</div>
				<div class="board_info_box">
					<span class="board_author">
						<label>[ 작성자 ]: </label>
						<label>${writer}</label>	
					</span>
				</div>
					<label>[ 첨부 파일 명 ]</label>
				<div class="board_info_box">
					<span class="board_author">
						<c:forEach var="i" items="${campInfoFileList}">
							<label><a href="${root}/board/campInfo/downLoad.do?info_num=${campInfoDto.info_num}&file_name=${i.file_name}">${i.file_name}</a></label><br/>
					</c:forEach>
					</span>
				</div>

				<div class="board_content">
					<span>
						<c:out value="${campInfoDto.content}" escapeXml="false"></c:out>
					</span>			
				</div>
			</div>

			

			<div style="margin-top : 20px">
			<c:if test="${sessionScope.user_num ==campInfoDto.user_num}">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate" onclick="location.href='${root}/board/campInfo/update.do?info_num=${campInfoDto.info_num}&user_num=${campInfoDto.user_num}&pageNumber=${pageNumber}'">수정</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
			</c:if>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>

		</div>

		

	</article>

             <div class="info_content" >
				
				<label>캠핑소식 작성</label>
			<!--썸머노트 form태그-->
          <%--   <form class="campInfo_form" action="${root}/board/campInfo/writeOk.do" method="POST" 
            	onsubmit="returnForm(this)" enctype="multipart/form-data"> --%>
			<ul class="">
				<li>
					<label>글번호</label>
					<label>${campInfoDto.info_num}</label>
				</li>
				<li>
					<label >제목(*)</label>
					<span>${campInfoDto.title}</span>
				</li>
				<li>
					<label >작성자(*)</label>
					<span>${writer}</span>
				</li>

			 	<li>
					<label >파일명</label><br/>
					<c:forEach var="i" items="${campInfoFileList}">
							<label><a href="${root}/board/campInfo/downLoad.do?info_num=${campInfoDto.info_num}&file_name=${i.file_name}">${i.file_name}</a></label><br/>
					</c:forEach>
				
				</li>  
				<li>
					<label>내용</label>
					<span>
						<c:out value="${campInfoDto.content}" escapeXml="false"></c:out>
					</span>
							
				</li>
	
				<li>
					
					<c:if test="${sessionScope.user_num ==campInfoDto.user_num}">
						<input class="btn" type="submit" value="수정" onclick="location.href='${root}/board/campInfo/update.do?info_num=${campInfoDto.info_num}&user_num=${campInfoDto.user_num}&pageNumber=${pageNumber}'" />	
						<input class="btn" type="button"  value="삭제" onclick="location.href='${root}/board/campInfo/delete.do?info_num=${campInfoDto.info_num}'"/>	
					</c:if>
						<input class="btn" type="button"  value="목록" onclick="location.href='${root}/board/campInfo/list.do?pageNumber=${pageNumber}'"/>	
					
				
				</li>
		</ul>
		<!-- </form>             -->
		</div>   
            </div>
        </div>
    </section>

</body>

</html>
