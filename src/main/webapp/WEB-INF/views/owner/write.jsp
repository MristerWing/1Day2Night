<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html lang="utf-8">
<head>
<script
type="text/javascript"
src="${root}/resources/javascript/owner/update.js">
</script>
</head>
<body>
	<!-- //main-content -->
	<!--/ab -->
	<section class="about py-lg-5 py-md-5 py-5">
		<div class="container">
			<div class="inner-sec-w3pvt py-lg-5 py-3">
				<h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5">사업자 정보 등록</h3>
				<div class="register_content">
					<form class="register_form" action="${root}/owner/ownerWriteOk.do" id="inputForm" method="POST"
						enctype="multipart/form-data">
						<input type="hidden" name="owner_key" value="${owner_key}">
						<div class="form-group">
							<label for="pwd">캠핑장명(*)</label> <input type="text"
								class="form-control" name="camp_name">
						</div>
						<div class="form-group">
							<label for="pwd">부제목</label> <input type="text"
								class="form-control" name="title">
						</div>
						<label>태그 설정</label> <br>
						<div id="tag"></div>
						<script type="text/javascript">
							var tags = ["#애견동반", "#계곡옆", "#아이들 놀기 좋은", "#차대기 편한", "#힐링", "#익스트림", "#깨끗한", "#바다가 보이는", "#가을", "#야영장사고배상책임보험가입", "#자전거 타기 좋은", "#여유있는", "#겨울", "#커플", "#물맑은", "#수영장 있는", "#재미있는", "#축제", "#둘레길", "#여름", "#가족", "#사이트 간격이 넓은", "#문화유적", "#그늘이 많은", "#봄", "#온수 잘 나오는", "#생태교육", "#별 보기 좋은", "#친절한", "#물놀이 하기 좋은"];
							makeCheckBoxs(tags, '', 'tag');
							$("input[name=tag]").click(function () {
								$("input[name=tag]:checked").each(function () {
									console.log($(this).val());
								});
							});
						</script>
						<br> <br>
						<div class="form-group">
							<h5>이미지를 선택하지 않을경우 기존 이미지가 유지됩니다.</h5>
							<label>메인 이미지를 선택해주세요(*)</label> <input type="file"
								class="form-control-file border" name="mainImage">
						</div>
						<div class="form-group">
							<label>서브 이미지를 선택해주세요(최대3개)</label> <input type="file"
								class="form-control-file border" multiple="multiple" name="subImage">
						</div>
						<div class="form-group">
							<label for="pwd">캠핑장 주소(*)</label> <input type="text"
								class="form-control" name="address">
						</div>
						<div class="form-group">
							<label>전화번호</label> <input type="text"
								class="form-control" name="hp">
						</div>
						<div class="form-group">
							<label>홈페이지 주소</label> <input type="text" class="form-control"
								id="camp_link" name="camp_link">
						</div>
						<div class="form-group">
							<label>입지 선택(*)</label>
							<div id="loc"></div>
						</div>
						<script type="text/javascript">
							var locs = ["해변", "섬", "산", "숲", "계곡", "강", "호수", "도심"];
							makeCheckBoxs(locs, '', 'loc');
							$("input[name=loc]").click(function () {
								$("input[name=loc]:checked").each(function () {
									console.log($(this).val());
								});
							});
						</script>
						<div class="form-group">
							<label>운영 형태(*)</label>
							<div id="oper"></div>
						</div>
						<script type="text/javascript">
							var opers = ["지자체", "국립공원", "자연휴양림", "국민여가", "민간"];
							makeCheckBoxs(opers, '', 'oper');
						</script>
						<div class="form-group">
							<label>캠핑장유형</label>
							<div id="campType"></div>
						</div>
						<script type="text/javascript">
							var campType = ["일반야영장", "자동차야영장", "카라반", "글램핑"];
							makeCheckBoxs(campType, '', 'campType');
						</script>
						<div class="form-group">
							<label>운영기간</label>
							<div id="opPeriod"></div>
						</div>
						<script type="text/javascript">
							var opPeriod = ["봄", "여름", "가을", "겨울"];
							makeCheckBoxs(opPeriod, '', 'opPeriod');
						</script>
						<div class="form-group">
							<label>영업 날짜</label>
							<div id="opDay"></div>
						</div>
						<script type="text/javascript">
							var opDays = ["평일", "주말"];
							makeCheckBoxs(opDays, '', 'opDay');
						</script>
						<div class="form-group">
							<label>시설정보</label>
							<div id="mainFacilities"></div>
						</div>
						<script type="text/javascript">
							var main_facilities = ["전기", "무선인터넷", "장작판매", "온수", "트렘폴린", "물놀이장", "놀이터", "산책로", "운동장", "운동시설", "마트.편의점"];
							makeCheckBoxs(main_facilities, '', 'mainFacilities');
						</script>
						
						<div class="form-group">
							<label for="etc_facilities">기타시설 설정</label>
							<input type="text" class="form-control"
								id="etc_facilities" name="etc_facilities" "> 
							
							<label for="bottom_type">바닥형태</label>
							<input type="text" class="form-control"
								id="bottom_type" name="bottom_type" ">
							
						</div>
						<label>애완동물 출입여부</label> <br>
						<div class="form-check-inline">
							<br> <label class="form-check-label" for="animal1"> <input
								type="radio" class="form-check-input" id="animal1"
								name="animal_access" value="가능">가능
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label" for="animal2"> <input
								type="radio" class="form-check-input" id="animal2"
								name="animal_access" value="불가능">불가능
							</label>
						</div>
						<br> <br> <label>화로대 유무</label> <br>
						<div class="form-check-inline">
							<br> <label class="form-check-label" for="torch1"> <input
								type="radio" class="form-check-input" id="torch1"
								name="torch" value="개별">개별
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label" for="torch2"> <input
								type="radio" class="form-check-input" id="torch2"
								name="torch" value="공동 취사장">공동 취사장
							</label>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label for="pwd">글램핑 시설</label> <input type="text"
								class="form-control" name="gramping_facilities">
						</div>
						<div class="form-group">
							<label for="pwd">카라반 시설</label> <input type="text"
								class="form-control" name="karaban_facilities">
						</div>
						<label for="pwd">사이트 수</label><br>
						<div class="form-group" style="width: 100%; overflow: hidden;">
							<input type="text" class="form-control" placeholder="가로" name="siteWidth" style="margin-right: 10px;  float: left; width: 60px;">
							<span style="float: left;">X</span>
							<input type="text" class="form-control" placeholder="세로" name="siteHeight" style="margin: 0 10px;  float: left; width: 60px;">
							<span style="float: left;">·</span>
							<input type="text" class="form-control" placeholder="갯수" name="siteNumbers" style="margin-left: 10px;  float: left; width: 60px;">
						</div>
						<div class="form-group">
							<label for="comment">소개글을 작성해주세요</label>
							<textarea class="form-control" rows="10" id="comment" name="content"></textarea>
						</div>

						<button type="button" onclick="returnForm('${root}')" class="btn btn-primary">작성</button>
					</form>
				</div>
			</div>
		</div>
		<!-- //services -->
	</section>
</body>

</html>
