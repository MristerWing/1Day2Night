<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<html lang="utf-8">
<body>
	<!-- //main-content -->
	<!--/ab -->
	<section class="about py-lg-5 py-md-5 py-5">
		<div class="container">
			<div class="inner-sec-w3pvt py-lg-5 py-3">
				<h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">사업자 정보수정</h3>
				<div class="register_content">
					<h5>등록된 사업자 번호</h5>
					<form class="register_form" action="" method="POST"
						enctype="multipart/form-data" onsubmit="returnForm(this)">
						<div class="form-group">
							<label>제목(*)</label> <input type="text" class="form-control"
								id="title" name="title">
						</div>
						<div class="form-group">
							<label for="pwd">캠핑장명(*)</label> <input type="text"
								class="form-control" value="캠핑장명" name="">
						</div>
						<div class="form-group">
							<label for="pwd">부제목</label> <input type="text"
								class="form-control" value="부제목" name="">
						</div>
						<label>태그 설정(*)</label> <br>
						<div class="form-check-inline">
							<br> <label class="form-check-label" for="radio1"> <input
								type="radio" class="form-check-input" id="radio1"
								name="optradio" value="option1" checked>설정
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label" for="radio2"> <input
								type="radio" class="form-check-input" id="radio2"
								name="optradio" value="option2">설정 안함
							</label>
						</div>
						<br> <br>
						<div class="form-group">
							<label>메인 이미지를 선택해주세요(*)</label> <input type="file"
								class="form-control-file border" name="file">
						</div>
						<div class="form-group">
							<label>서브 이미지를 선택해주세요</label> <input type="file"
								class="form-control-file border" name="file">
						</div>
						<div class="form-group">
							<label for="pwd">캠핑장 주소(*)</label> <input type="text"
								class="form-control" value="" name="">
						</div>
						<div class="form-group">
							<label for="pwd">전화번호(*)</label> <input type="text"
								class="form-control" value="" name="">
						</div>
						<div class="form-group">
							<label for="sel1">입지 선택(*)</label> <select class="form-control"
								id="sel1" name="sellist1">
								<option>캠핑장 입지유형을 선택해 주세요.(*)</option>
								<option>선택</option>
								<option>선택안함</option>
							</select>
						</div>
						<div class="form-group">
							<label for="sel1">운영 형태(*)</label> <select class="form-control"
								id="sel1" name="sellist1">
								<option>캠핑장 운형형태를 선택해 주세요.(*)</option>
								<option>선택</option>
								<option>선택안함</option>
							</select>
						</div>
						<div class="form-group">
							<label for="sel1">영업 날짜(*)</label> <select class="form-control"
								id="sel1" name="sellist1">
								<option>캠핑장 영업날짜를 선택해 주세요.(*)</option>
								<option>선택</option>
								<option>선택안함</option>
							</select>
						</div>

						<div class="form-group">
							<label for="sel1">기타시설 설정(*)</label> <select class="form-control"
								id="sel1" name="sellist1">
								<option>기타시설 추가(*)</option>
								<option>선택</option>
								<option>선택안함</option>
							</select> <select class="form-control" id="sel1" name="sellist1">
								<option>바닥 형태(*)</option>
								<option>선택</option>
								<option>선택안함</option>
							</select>
						</div>
						<label>애완동물 출입여부(*)</label> <br>
						<div class="form-check-inline">
							<br> <label class="form-check-label" for="radio1"> <input
								type="radio" class="form-check-input" id="radio1"
								name="optradio" value="option1" checked>가능
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label" for="radio2"> <input
								type="radio" class="form-check-input" id="radio2"
								name="optradio" value="option2">불가능
							</label>
						</div>
						<br> <br> <label>화로대 유무(*)</label> <br>
						<div class="form-check-inline">
							<br> <label class="form-check-label" for="radio1"> <input
								type="radio" class="form-check-input" id="radio1"
								name="optradio" value="option1" checked>개별
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label" for="radio2"> <input
								type="radio" class="form-check-input" id="radio2"
								name="optradio" value="option2">공동 취사장
							</label>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label for="pwd">글램핑 시설</label> <input type="text"
								class="form-control" value="" name="">
						</div>
						<div class="form-group">
							<label for="pwd">카라반 시설</label> <input type="text"
								class="form-control" value="" name="">
						</div>
						<label for="pwd">사이트 수</label><br>
						<div class="form-group" style="width: 100%; overflow: hidden;">
							<input type="text" class="form-control" value="가로" name="" style="margin-right: 10px;  float: left; width: 60px;">
							<span style="float: left;">X</span>
							<input type="text" class="form-control" value="세로" name="" style="margin: 0 10px;  float: left; width: 60px;">
							<span style="float: left;">=</span>
							<input type="text" class="form-control" value="합계" name="" style="margin-left: 10px;  float: left; width: 60px;">
						</div>
						<div class="form-group">
							<label for="comment">소개글을 작성해주세요</label>
							<textarea class="form-control" rows="10" id="comment" name="text"></textarea>
						</div>

						<button type="submit" class="btn btn-primary">작성</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='${root}/board/campReview/list.do?pageNumber=${pageNumber}'">목록</button>

					</form>
					<!--썸머노트 form태그-->

				</div>
			</div>
		</div>
		<!-- //services -->
	</section>
</body>

</html>
