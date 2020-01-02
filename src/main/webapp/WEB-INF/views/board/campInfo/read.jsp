<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>

 <link rel="stylesheet" type="text/css" href="${root}/resources/css/board/boardRead.css">
</head>

<body>
    <!-- //main-content -->
  <!--/ab -->
	<section class="about py-lg-5 py-md-5 py-5">
		<div class="container">
			<div class="inner-sec-w3pvt py-lg-5 py-3">
				<h4 class="tittle text-center mb-lg-5 mb-3 px-lg-5">${campInfoDto.title}</h4>
				<article>

					<div class="container" role="main">

						<div class="contents_form">

							<div class="writer">
								<span> 작성자:</span>&nbsp;<span>${writer}</span> &nbsp;&nbsp;
								<fmt:formatDate value="${campInfoDto.write_date}" pattern="yyyy-MM-dd"/>
							</div>
						
							<div class="file">
					<!-- 		<h6> 첨부 파일 </h6> -->
						    	<div class="file_name">
									<span> 
									<c:forEach  var="i"
											items="${campInfoFileList}">
											<label><a
												href="${root}/board/campInfo/downLoad.do?info_num=${campInfoDto.info_num}&file_name=${i.file_name}">${i.file_name}</a></label>
											<br />
										</c:forEach>
									</span>
								</div>
							</div>

							<div class="summernote_content">
								<span> <c:out value="${campInfoDto.content}"
										escapeXml="false"></c:out>
								</span>
							</div>
						</div>




						<div style="margin-top: 20px" align="center">
							<c:if test="${sessionScope.user_num ==campInfoDto.user_num}">
								<button type="button" class="btn btn-sm btn-primary"
									id="btnUpdate"
									onclick="location.href='${root}/board/campInfo/update.do?info_num=${campInfoDto.info_num}&user_num=${campInfoDto.user_num}&pageNumber=${pageNumber}'">수정</button>

								<button type="button" class="btn btn-sm btn-primary"
									id="btnDelete" onclick="location.href='${root}/board/campInfo/delete.do?info_num=${campInfoDto.info_num}'">삭제</button>
							</c:if>
							<button type="button" class="btn btn-sm btn-primary" id="btnList"  onclick="location.href='${root}/board/campInfo/list.do?pageNumber=${pageNumber}'">목록</button>

						</div>

					</div>



				</article>

			</div>
		</div>
	</section>

</body>

</html>
