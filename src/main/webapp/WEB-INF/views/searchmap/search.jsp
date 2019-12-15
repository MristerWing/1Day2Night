<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html lang="zxx">

<head>
<!-- 맨위페이지위에 이미지 쇼트컷 -->
<link rel="shortcut icon" href="${root}/resources/images/ODTN_LOGO.png">
<!-- 맨위페이지위에 이미지 쇼트컷 -->
<title>Camping a Travel Category Bootstrap Responsive Template |
	Contact :: W3layouts</title>


<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords"
	content="Camping Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>


<!-- //Meta tag Keywords -->
<!-- Custom-Files -->
<link rel="stylesheet" href="${root}/resources/css/styles/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="${root}/resources/css/styles/style.css"
	type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="${root}/resources/css/searchmap/layout.css">
<!-- font-awesome-icons -->
<link href="${root}/resources/css/styles/font-awesome.css"
	rel="stylesheet">
<!-- //font-awesome-icons -->
<!-- /Fonts -->
<link
	href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800"
	rel="stylesheet">

<!-- //Fonts -->

<!-- kakaomap -->
<link rel="stylesheet" href="${root}/resources/css/searchmap/kakaomap.css">
</head>
<body>
	<div id="wrap">
		<div id="s_contanier">
			<!-- mian-content -->
			<div class="main-content inner" id="home">
				<!-- header -->
				<header class="header">
					<div class="container">
						<!-- nav -->
						<nav class="py-3">
							<div id="logo">
								<h1>
									<a class="navbar-brand" href="index.html">Camping</a>
								</h1>
							</div>

							<label for="drop" class="toggle">Menu</label> <input
								type="checkbox" id="drop" />
							<ul class="menu mt-2">
								<li><a href="index.html">Home</a></li>
								<li><a href="about.html">About</a></li>
								<li>
									<!-- First Tier Drop Down --> <label for="drop-2"
									class="toggle">Drop Down <span class="fa fa-angle-down"
										aria-hidden="true"></span>
								</label> <a href="#">More Info <span class="fa fa-angle-down"
										aria-hidden="true"></span></a> <input type="checkbox" id="drop-2" />
									<ul>
										<li><a href="features.html">Features</a></li>
										<li><a href="gallery.html">Gallery</a></li>
										<li><a href="features.html">Services</a></li>
									</ul>
								</li>
								<li class="active"><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
						<!-- //nav -->
					</div>
				</header>
				<!-- //header -->
			</div>
			<!-- //main-content -->
			<!--/contact -->

			<!-- 상단 타이틀영역 -->
			<div id="sub_title_wrap2" style="background-color: darkgrey;">
				<!--Location-->
				<div class="location_w2">
					<div class="location_inner2">
						<div class="layout">
							<a href="/" class="all_home"><span class="skip">홈으로</span></a>
							<div class="mngroup depth1">
								<p class="step">캠핑GO</p>
								<ul class="menuUl" style="display: none;">
									<li class="menuLi depth1List"><a
										href="/zboard/list.do?lmCode=campNews">캠핑Talk</a></li>
									<li class="menuLi depth1List"><a
										href="/zboard/list.do?lmCode=campScn">캠핑플러스</a></li>
									<li class="menuLi depth1List"><a
										href="/zboard/list.do?lmCode=notice">고객센터</a></li>
								</ul>
							</div>
							<div class="mngroup depth2">
								<p class="step">캠핑장 검색</p>
								<ul class="menuUl" style="display: none;">
									<li class="menuLi depth1List"><a
										href="/bsite/camp/info/list.do">캠핑장 검색</a></li>
									<li class="menuLi depth1List"><a
										href="/bsite/camp/info/list.do?listTy=MAP">지도로 보기</a></li>
									<li class="menuLi depth1List"><a
										href="/camp/recomend/list.do">이달의 추천 캠핑장</a></li>
									<li class="menuLi depth1List"><a
										href="/zboard/list.do?lmCode=campEvent">캠핑장 이벤트</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!--//Location-->
				<div class="layout" id="layout_1">
					<h2>
						<span class="skip">달력 및 검색영역</span>
					</h2>
					<!-- 달력 -->
					<div class="calen" style="margin-left: -725px; margin-top: 50px;">
						<p class="month_area">
							<button type="button" class="m_prev"></button>
							<span id="cal_span">2019. 12</span>
							<button type="button" class="m_next"></button>
						</p>
						<div class="table_w_">
							<table class="month_tb">
								<colgroup>
									<col style="width: 15%">
									<col style="width: 14%">
									<col style="width: 14%">
									<col style="width: 14%">
									<col style="width: 14%">
									<col style="width: 14%">
									<col style="width: 15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="sun">SUN</th>
										<th scope="col">MON</th>
										<th scope="col">TUE</th>
										<th scope="col">WED</th>
										<th scope="col">THU</th>
										<th scope="col">FRI</th>
										<th scope="col" class="sat">SAT</th>
									</tr>
								</thead>
								<tbody id="cal_tbody">
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
									</tr>
									<tr>
										<td>8</td>
										<td>9</td>
										<td>10</td>
										<td class="today">11</td>
										<td>12</td>
										<td>13</td>
										<td>14</td>
									</tr>
									<tr>
										<td>15</td>
										<td>16</td>
										<td>17</td>
										<td>18</td>
										<td>19</td>
										<td>20</td>
										<td>21</td>
									</tr>
									<tr>
										<td>22</td>
										<td>23</td>
										<td>24</td>
										<td>25</td>
										<td>26</td>
										<td>27</td>
										<td>28</td>
									</tr>
									<tr>
										<td>29</td>
										<td>30</td>
										<td>31</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 검색박스  -->
					<div class="top_search_box">
						<form id="campSearchForm2" action="/bsite/camp/info/list.do"
							method="get">
							<input type="hidden" name="listTy" value="MAP"> <input
								id="listOrdrTrget" name="listOrdrTrget" type="hidden"
								value="last_updusr_pnttm">
							<button type="button" class="tag_link_btn">
								<span>태그로 검색</span>
							</button>
							<div>
								<div class="form_tt">
									<h2 class="tt">상세검색</h2>
									<a class="form_openTT" title="상세검색 펼쳐보기"><img
										src="https://www.gocamping.or.kr/img/2018/sub/ico_more03.png"
										alt="상세검색 펼쳐보기"></a>
								</div>
								<div class="form_w form_w_movV">
									<ul>
										<li class="tt"><strong class="title">지역</strong>
											<div class="select_box">
												<label for="c_do">도/특별시</label><select id="c_do" name="c_do"
													class="detail_select" title="도/특별시"><option
														value="">전체</option>
													<option value="1">서울시</option>
													<option value="2">부산시</option>
													<option value="3">대구시</option>
													<option value="4">인천시</option>
													<option value="5">광주시</option>
													<option value="6">대전시</option>
													<option value="7">울산시</option>
													<option value="8">세종시</option>
													<option value="9">경기도</option>
													<option value="10">강원도</option>
													<option value="11">충청북도</option>
													<option value="12">충청남도</option>
													<option value="13">전라북도</option>
													<option value="14">전라남도</option>
													<option value="15">경상북도</option>
													<option value="16">경상남도</option>
													<option value="17">제주도</option></select>
											</div></li>
										<li>
											<div class="select_box">
												<label for="c_signgu">시/군/지역</label><select id="c_signgu"
													name="c_signgu" class="detail_select" title="시/군/지역"><option
														value="">전체</option></select>
											</div>
										</li>
										<!-- <li class="tt"><strong class="title">위치</strong>
									<div class="select_box">
										<label for="r_select03">전체</label> <select class="detail_select" id="r_select03">
											<option selected="selected">선택1</option>
											<option>선택2</option>
											<option>선택3</option>
											<option>선택4</option>
										</select>
									</div></li> -->
										<li class="tt"><strong class="title">테마</strong>
											<div class="select_box them">
												<label for="searchLctCl">전체</label> <select
													class="detail_select" name="searchLctCl" id="searchLctCl"
													title="테마선택">
													<option value="">전체테마</option>
													<option value="47">해변</option>
													<option value="48">섬</option>
													<option value="49">산</option>
													<option value="50">숲</option>
													<option value="51">계곡</option>
													<option value="52">강</option>
													<option value="53">호수</option>
													<option value="54">도심</option>
												</select>
											</div></li>
									</ul>
									<ul>
										<li class="tt top_kwdSearch"><strong class="title">키워드검색</strong>
											<div class="input_search">
												<fieldset class="totalSearch">
													<legend>키워드 검색</legend>
													<label for="searchKrwd2" class="skip">키워드 검색어를
														입력하세요.</label> <input id="searchKrwd2" name="searchKrwd"
														class="m_search_in" style="vertical-align: middle;"
														title="검색어를 입력하세요." placeholder="검색어를 입력하세요." type="text"
														value="">
												</fieldset>
											</div></li>

										<li class="fw_2li">
											<ul>
												<li class="button_w"><button type="button"
														class="de_btn01">상세조건</button></li>
												<li class="button_w"><button type="submit"
														class="de_btn02">캠핑장 검색</button></li>
												<li class="button_w"><button type="button"
														onclick="geoFindMe('30', ''); return false;"
														class="de_btn03">내주변보기</button></li>
											</ul>
										</li>

										<!-- <li class="fw_2li">
										<div class="button_w">
											<button type="button" class="de_btn01">상세조건</button>
											<button type="submit" class="de_btn02">캠핑장 검색</button>
										</div>
									</li>-->
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- //상단 타이틀영역 -->
			<div class="gray_bar">
				<span class="skip">공백영역입니다.</span>
			</div>
			<!--콘텐츠박스-->
			<div id="cont_inner">
				<div class="sub_layout layout">
					<section id="section1" style="right: 0px">
						<h2 class="skip">본문내용이 시작됩니다.</h2>
						<header class="title_w mb_0">
							<h2 class="title2">
								총 <span class="em_org">2360개</span> 캠핑장이 검색되었습니다.
							</h2>
							<ul class="share">
								<li class="sns">
									<button type="button" class="sns_share">
										<span class="skip">SNS공유</span>
									</button>
									<div class="share_sns_list" style="display: none;">
										<ul>
											<li><button type="button" class="ssns_list01">
													<span class="skip">닫기</span>
												</button></li>
											<li><button type="button" class="ssns_list02"
													onclick="fn_sendSns('facebook'); return false;">
													<span class="skip">페이스북</span>
												</button></li>
											<li><button type="button" class="ssns_list03"
													onclick="fn_sendSns('twitter'); return false;">
													<span class="skip">트위터</span>
												</button></li>
											<li><button type="button" class="ssns_list04"
													onclick="fn_sendSns('band'); return false;">
													<span class="skip">블로그</span>
												</button></li>
											<li><button type="button" class="ssns_list05"
													onclick="fn_sendSns('kstory'); return false;">
													<span class="skip">카카오스토리</span>
												</button></li>
										</ul>
									</div>
								</li>
								<li class="bookmark"><a
									href="javascript:CreateBookmarkLink('', '현재페이지');"
									id="favorite"><span class="skip">즐겨찾기</span></a></li>
								<li class="link"><a href="#"
									onclick="copy_trackback(this.href); return false;"><span
										class="skip">링크 복사하기</span></a></li>
								<li class="print"><a href="#none"
									onclick="printThis(); return false;"><span class="skip">인쇄하기</span></a></li>
							</ul>
						</header>
					</section>




					<!-- 지도파싱	-->
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										검색 : <input type="text" value="캠핑장" id="keyword" size="15">
										<button type="submit">검색하기</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
					
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca03b0208d6f66d063f775590f585a44&libraries=services"></script>
						<script type="text/javascript" src="${root}/resources/javascript/searchmap/kakaomap.js"></script>
					
					
					<!-- //지도파싱	-->
					<div
						style="border: solid 2px black; width: auto; height: 100px; text-align: center; margin-top: 50px; line-height: 100px;">
						footer footer footer</div>




				</div>
			</div>
			<!--//contact -->

		</div>
	</div>
</body>
</html>