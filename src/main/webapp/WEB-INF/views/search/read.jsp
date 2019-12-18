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
						<h1>namespace</h1>
						<h3>subname</h3>
					</div>
					<div class="tag-div"><label>tags</label></div>
				</div>
			</div>
			<div class="container main_content">
				<div class="img-area">
					<img
						src="${root}/resources/images/search/test/1.jpg"
						alt="loding"
					/>
				</div>
				<div class="content-area">
					<table class="table">
						<tbody>
							<!--스크립트 루프 처리 예정-->
							<tr>
								<th>주소</th>
								<td>2</td>
							</tr>
							<tr>
								<th>문의처</th>
								<td>4</td>
							</tr>
							<tr>
								<th>캠핑장 환경</th>
								<td>6</td>
							</tr>
							<tr>
								<th>캠핑장 유형</th>
								<td>8</td>
							</tr>
							<tr>
								<th>운영기간</th>
								<td>10</td>
							</tr>
							<tr>
								<th>운영일</th>
								<td>12</td>
							</tr>
							<tr>
								<th>홈페이지</th>
								<td></td>
							</tr>
							<tr>
								<th>예약방법</th>
								<td></td>
							</tr>
						</tbody>
					</table>
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
							var url = '${root}/search/read.do?readPage=' + $(this).val();
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
					<img src="${root}/resources/images/search/test/s1.jpg" alt="" />
					<img src="${root}/resources/images/search/test/s2.jpg" alt="" />
					<img src="${root}/resources/images/search/test/s3.jpg" alt="" />
				</div>
				<div class="sub-index">
					<span class="text">content</span>
					<span class="date">date</span>
				</div>
				<div class="sub-campinfo">
					<span class="title">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						캠핑장 시설정보
					</span>
					<div class="info"></div>
				</div>
				<div class="sub-etc">
					<span class="title">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						기타 주요시설
					</span>
					<table class="table">
						<tbody>
							<tr>
								<th>주요시설</th>
								<td>test</td>
							</tr>
							<tr>
								<th>바닥형태 (단위:면)</th>
								<td></td>
							</tr>
							<tr>
								<th>사이트 크기</th>
								<td></td>
							</tr>
							<tr>
								<th>글램핑 내부시설</th>
								<td></td>
							</tr>
							<tr>
								<th>카라반 내부시설</th>
								<td></td>
							</tr>
							<tr>
								<th>애완동물 출입</th>
								<td></td>
							</tr>
							<tr>
								<th>화로대</th>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				</c:if>
				<!--안내-->
				<!--루프처리-->
				<c:if test="${readPage  == 2}">
				<div class="container guide-area">
					<span class="title">
						<i class="fa fa-flag" aria-hidden="true"></i>
						일반요금
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
                                <td>30,000</td>
                                <td>30,000</td>
                                <td>30,000</td>
                                <td>30,000</td>
                            </tr>
                        </tbody>
					</table>
				</div>
				</c:if>
				<!--지도-->
			</div>
		</div>
	</body>
</html>
