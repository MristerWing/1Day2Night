<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<head>
			<meta charset="UTF-8" />
			<title>ODTN-Perfect camping 4 U</title>
			<!-- Meta tag Keywords -->
			<meta
				name="viewport"
				content="width=device-width, initial-scale=1"
			/>
			<meta charset="UTF-8" />
			<meta
				name="keywords"
				content="Camping Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
			/>
			<script>
				addEventListener(
					'load',
					function() {
						setTimeout(hideURLbar, 0);
					},
					false
				);

				function hideURLbar() {
					window.scrollTo(0, 1);
				}
			</script>
			<!-- //Meta tag Keywords -->

			<script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
            <script
                type="text/javascript"
                src="${root}/resources/javascript/search/searchRead.js"
            ></script>

            <!-- Custom-Files -->
            <link rel="stylesheet" href="${root}/resources/css/styles/bootstrap.css" />
            <!-- Bootstrap-Core-CSS -->
            <link
                rel="stylesheet"
                href="${root}/resources/css/styles/style.css"
                type="text/css"
                media="all"
            />
            <!-- Style-CSS -->
            <!-- font-awesome-icons -->
            <link href="${root}/resources/css/styles/font-awesome.css" rel="stylesheet" />
            <!--getSearchCSS-->
            <link href="${root}/resources/css/search/search.css" rel="stylesheet" />
            <link href="${root}/resources/css/search/searchBar.css" rel="stylesheet" />
            <link href="${root}/resources/css/search/searchRead.css" rel="stylesheet" />
            <!-- //font-awesome-icons -->
			<!-- /Fonts -->
			<link
				href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900"
				rel="stylesheet"
			/>
			<link
				href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800"
				rel="stylesheet"
			/>
			<!-- //Fonts -->
		</head>
	</head>
	<body>
		<div class="main-content top"></div>
		<div class="search">
			<div class="topline-background">
				<div class="container read-background">
					<div class="name-space">
						<h1>${searchDto.camp_name}</h1>
						<h3>${searchDto.title}</h3>
					</div>
					<div class="tag-div"><label>tags</label><label>${searchDto.tag}</label></div>
				</div>
			</div>
			<div class="container main_content">
				<div class="img-area">
					<img
						src="${searchDto.main_image}"
						alt="loding"
					/>
				</div>
				<div class="content-area">
					<table class="table">
						<tbody></tbody>
					</table>
					<script type="text/javascript">
						var titles = {
							address: "주소", 
							hp: "문의처", 
							loc: "캠핑장 환경", 
							operationType: "캠핑장 유형", 
							operationPeriod: "운영기간", 
							operationDay: "운영일", 
							homepage: "홈페이지"
						};
						
						var camp = {
								address: "${searchDto.address}",
								hp: "${searchDto.hp}",
								loc: "${searchDto.location_type}",
								operationType: "${searchDto.operation_type}",
								operationPeriod: "${searchDto.operation_period}", 
								operationDay: "${searchDto.operation_day}", 
								homepage: "<a href='" + "${searchDto.camp_link}" + "'>바로가기</a>"
						};
						
						
						for(let prop in camp) {
							if(!camp.hasOwnProperty(prop)) continue;
							if(camp[prop] != "") {
								$("body > div.search > div.container.main_content > div.content-area > table > tbody").append(
									"<tr><th>" + titles[prop] + "</th><td>" + camp[prop] + "</td></tr>"
								);
							};
						};
					</script>
					<div class="button-area">
						<button class="btn btn-primary" value="1">
							<i class="fa fa-thumbs-o-up" aria-hidden="true"></i
							>추천
						</button>
						<button class="btn btn-danger" value="2">
							<i class="fa fa-heart" aria-hidden="true"></i>
							찜하기
						</button>
						<button class="btn btn-dark" value="3">
							<i
								class="fa fa-calendar-check-o"
								aria-hidden="true"
							></i>
							예약하기
						</button>
					</div>
				</div>
				<div class="row">
					<button class="col btn btn-dark" value="1">캠핑장 소개</button>
					<button class="col btn btn-dark" value="2">이용안내</button>
					<button class="col btn btn-dark" value="3">위치/주변정보</button>
					<script type="text/javascript">
					$('body > div.search > div.container.main_content > div.row > button').click(
						function() {
							var url = '${root}/search/read.do?readPage=' + $(this).val() + "&camp-id=" + "${searchDto.camp_id}";
							console.log(url);
							location.href = url;
						}
					);
					</script>
				</div>
			</div>
			<div class="sub-content">
				<!--소개-->
				<c:if test="${readPage == 1||readPage == null||readPage == ''}">
				<div class="sub-img">
					<img src="${searchDto.sub_image1}" alt="" />
					<img src="${searchDto.sub_image2}" alt="" />
					<img src="${searchDto.sub_image3}" alt="" />
				</div>
				<div class="sub-index">
					<span class="text">${searchDto.content}</span>
					<span class="date">${searchDto.content_modified_date}</span>
				</div>
				<div class="sub-campinfo">
					<span class="title">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						캠핑장 시설정보
					</span>
					<div class="info"></div>
					<script type="text/javascript">
						var fac = {
							wifi = "와이파이",
							bolt
						}
					
						var camp_main_info = "${searchDto.main_facilities}".split(",");
						
						
					</script>
				</div>
				<div class="sub-etc">
					<span class="title">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						기타 주요시설
					</span>
					<table class="table">
						<tbody></tbody>
					</table>
					<script type="text/javascript">
						var titles = {
							etc: "주요시설", 
							bottom: "바닥형태 (단위:면)", 
							site: "사이트 크기", 
							gramping: "글램핑 내부시설", 
							karaban: "카라반 내부시설", 
							animal: "애완동물 출입", 
							torch: "화로대"
						};
						
						var etc = {
								etc: "${searchDto.etc_facilities}", 
								bottom: "${searchDto.bottom_type}", 
								site: "${searchDto.site_size}", 
								gramping: "${searchDto.gramping_facilities}", 
								karaban: "${searchDto.karaban_facilities}", 
								animal: "${searchDto.animal_access}", 
								torch: "${searchDto.torch}"
						};
						
						
						for(let prop in etc) {
							if(!etc.hasOwnProperty(prop)) continue;
							if(etc[prop] != "") {
								$("body > div.search > div.sub-content > div.sub-etc > table > tbody").append(
									"<tr><th>" + titles[prop] + "</th><td>" + etc[prop] + "</td></tr>"
								);
							};
						};
					</script>
				</div>
				</c:if>
				<!--안내-->
				<!--루프처리-->
				<c:if test="${readPage  == 2}">
				<div class="container guide-area">
					<c:forEach var="paymentDto" items="${paymentList}">
						<span class="title">
							<i class="fa fa-flag" aria-hidden="true"></i>
							${paymentDto.fee_name}
						</span>
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>평상시 주중</th>
									<th>평상시 주말</th>
									<th>성수기 주중</th>
									<th>성수기 주말</th>
								</tr>
							</thead>
							<tbody>
	                            <tr>
	                                <td>${paymentDto.normal_season_weekdays_fee}</td>
	                                <td>${paymentDto.normal_season_holidays_fee}</td>
	                                <td>${paymentDto.peak_season_weekdays_fee}</td>
	                                <td>${paymentDto.peak_season_holidays_fee}</td>
	                            </tr>
	                        </tbody>
						</table>
					</c:forEach>
				</div>
				</c:if>
				<!--지도-->
			</div>
		</div>
	</body>
</html>
