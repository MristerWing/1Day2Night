<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html lang="zxx">

<head>
<!-- 맨위페이지위에 이미지 쇼트컷 -->
<%-- <link rel="shortcut icon" href="${root}/resources/images/ODTN_LOGO.png"> --%>
<!-- 맨위페이지위에 이미지 쇼트컷 -->
<title>Camping a Travel Category Bootstrap Responsive Template |
	Contact :: W3layouts</title>


<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="Camping Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script>
	function fn_sendSns(sns) {
		var method = "popup";
		var thisUrl = document.URL;
		var snsTitle = "캠핑장 검색";
		if (sns == 'facebook') {
			var url = "http://www.facebook.com/sharer/sharer.php?u="
					+ encodeURIComponent(thisUrl);
			window.open(url, "", "width=486, height=286");
		} else if (sns == 'twitter') {
			var url = "http://twitter.com/share?url="
					+ encodeURIComponent(thisUrl) + "&text="
					+ encodeURIComponent(snsTitle);
			window
					.open(url, "tweetPop",
							"width=486, height=286,scrollbars=yes");
		} else if (sns == 'band') {
			var url = "http://www.band.us/plugin/share?body="
					+ encodeURIComponent(snsTitle) + "&route="
					+ encodeURIComponent(thisUrl);
			window.open(url, "shareBand",
					"width=400, height=500, resizable=yes");
		} else if (sns == 'kstory') {
			var url = "https://story.kakao.com/share?url="
					+ encodeURIComponent(thisUrl);
			window.open(url, "shareKakao",
					"width=400, height=500, resizable=yes");
		}
	}

	function printThis() {
		$("#contents").printThis({

		});
	}
</script>

<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<!-- kakaomap -->
<link rel="stylesheet"
	href="${root}/resources/css/searchmap/layout.css">
<link rel="stylesheet"
	href="${root}/resources/css/searchmap/kakaomap.css">
</head>
<body>
	<div id="wrap">
		<div id="s_contanier">
			<!-- mian-content -->
				<!-- header -->
		
				<!-- //header -->
			<!-- //main-content -->
			<!--/contact -->
			
			
			<!-- //상단 타이틀영역 -->
			<!--콘텐츠박스-->
			<div id="cont_inner">
				<div class="sub_layout">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca03b0208d6f66d063f775590f585a44&libraries"></script>

					<script type="text/javascript">
							var positions = new Array();
						</script>

					<c:forEach var="i" items="${searchMap.searchList}">
						<script type="text/javascript">
							var lat = parseFloat("${i.wido}");
							var lng = parseFloat("${i.gyeonddo}");
							
							// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
							var points = {
								content : '<div>'+"${i.address}"+'</div>' + '<div>'+"${i.camp_name}"+'</div>'+'<div>'+"${i.hp}"+'</div>',
								latlng : new kakao.maps.LatLng(lat, lng)
							}
							$(function () {
							$("#placesList").append(
									"<li>" +
									"["+"${i.camp_name}" +"]"+
									"</br>"+
									"${i.address}"+
									"</br>"+
									"${i.hp}"+
									"<input type='hidden' class='lat' value='${i.wido}'/>" + 
									"<input type='hidden' class='lng' value='${i.gyeonddo}'/>" +
									"<input type='hidden' class='addres' value='${i.address}'/>" +
									"<input type='hidden' class='camp' value='${i.camp_name}'/>" +
									"<input type='hidden' class='phoneno' value='${i.hp}'/>" +
									"<input type='hidden' class='link' value='${i.camp_id}'/>" +
									"</li>");
							});
							
							positions.push(points);
						</script>
					</c:forEach>
					<script type="text/javascript">
					$(function() {
						$("#placesList > li").css("cursor", "pointer");
						$("#placesList > li").css("border-bottom", "1px solid #888");
						
						$("#placesList > li").click(function() {
							category($(this).children().eq(2).val(), $(this).children().eq(3).val(), 
									$(this).children().eq(4).val(), $(this).children().eq(5).val(), 
									$(this).children().eq(6).val(), $(this).children().eq(7).val());
						});
						
					});
					</script>
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
							<div id="menu_wrap" class="bg_white">
								<div class="option">
									<div>
										<form onsubmit="searchPlaces(); return false;"></form>
									</div>
								</div>
								<ul id="placesList">
								</ul>
								<div id="pagination"></div>
								<div align="center">
									<c:if test="${searchMap.count >0 }">
										<c:set var="pageBlock" value="${10}"/> 
										<c:set var="pageCount" value="${searchMap.count/searchMap.boardSize + (searchMap.count%searchMap.boardSize==0 ? 0 : 1) }"/>
										
										<fmt:parseNumber var="result" value="${(searchMap.currentPage-1)/pageBlock }" integerOnly="true"/>
										<c:set var="startPage" value="${result * pageBlock+1 }"/>
										<c:set var="endPage" value="${startPage + pageBlock -1 }"/>
										
										<c:if test="${endPage > pageCount }">
											<c:set var="endPage" value="${pageCount }"/>
										</c:if>
										
										<c:if test="${startPage > pageBlock }">
											<a href="${root }/search/list.do?isMap=MAP&pageNumber=${startPage-pageBlock}&filter=${searchMap.filter}">[이전]</a>		
										</c:if>
										
										<c:forEach var="i" begin="${startPage }" end="${endPage }">
											<c:if test="${i != searchMap.currentPage}">
												<a href="${root }/search/list.do?isMap=MAP&pageNumber=${i}&filter=${searchMap.filter}">[${i}]</a>
											</c:if>
											<c:if test="${i == searchMap.currentPage}">
												<a href="${root }/search/list.do?isMap=MAP&pageNumber=${i}&filter=${searchMap.filter}" style="font-weight:bold;">[${i}]</a>
											</c:if>
										</c:forEach>
										
										<c:if test="${endPage < pageCount }">
											<a href="${root }/search/list.do?isMap=MAP&pageNumber=${startPage+pageBlock}&filter=${searchMap.filter}">[다음]</a>
										</c:if>
									</c:if>
								</div>
							</div>
					</div>
					<!-- 로드뷰를 표시할 div 입니다 -->
					<div id="roadview" style="width:100%;height:300px;"></div>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
						mapOption = {
							center : new kakao.maps.LatLng(37.5426652,
									127.6172013), // 지도의 중심좌표
							level : 13
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
						var bounds = new kakao.maps.LatLngBounds();    
						
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();
						
						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
						
						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new kakao.maps.ZoomControl();
						map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						
						function category(lat, lng, content, campname, phoneno, campId){
							// 마커가 표시될 위치입니다 
							var markerPosition  = new kakao.maps.LatLng(lat, lng); 
							console.log(markerPosition);
						 	// 현재 지도의 레벨을 얻어옵니다
						    var level = map.getLevel();
							
						    var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
							var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
							var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
						 	
							var position = new kakao.maps.LatLng(lat, lng);
						 	
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    position: markerPosition
							
							});
							infowindow.setContent(
									"<div class='category-text'>" +
									"<a href='${root}/search/read.do?camp-id=" + campId + "'>" + 
									campname + "</a>" +
									"</br>" + "<span>" + 
									content  + "</span>" + "</br>" + 
									"<span>" + phoneno + "</span>" +
									"</div>"
									);
							infowindow.open(map, marker);
							 // 지도 중심을 부드럽게 이동시킵니다
						 	// 지도를 1레벨 내립니다 (지도가 확대됩니다)
						    map.setLevel(level - 10);
						    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
						    map.panTo(markerPosition);     
						 
						 	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
						    roadviewClient.getNearestPanoId(position, 50, function(panoId) {
						        roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
						    });
						}
						for (var i = 0; i < positions.length; i++) {
							// 마커를 생성합니다
							var  marker = new kakao.maps.Marker({
							 map : map, // 마커를 표시할 지도
							 position : positions[i].latlng
							// 마커의 위치
							});
							
							marker.setMap(map);
							
							// LatLngBounds 객체에 좌표를 추가합니다
						    bounds.extend(positions[i].latlng);
							
							// 마커에 표시할 인포윈도우를 생성합니다 
							var infowindow = new kakao.maps.InfoWindow({
								content : positions[i].content,
										 	
							// 인포윈도우에 표시할 내용
							});
								
							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							// 이벤트 리스너로는 클로저를 만들어 등록합니다 
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							
							//kakao.maps.event.addListener(marker, 'mouseover',makeOverListener(map, marker, infowindow));
							//kakao.maps.event.addListener(marker, 'mouseout',makeOutListener(infowindow));
						}
						
							/* 마커클릭시 인포윈도우 텍스트띄우기
							
							인포윈도우를 표시하는 클로저를 만드는 함수입니다 
						function makeOverListener(map, marker, infowindow) {
							return function() {
								infowindow.open(map, marker);
							};
						}

						//인포윈도우를 닫는 클로저를 만드는 함수입니다 
						function makeOutListener(infowindow) {
							return function() {
								infowindow.close();
							};
						} */
						
						function setBounds() {
						    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
						    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
						    map.setBounds(bounds);
						}
						setBounds(); // 클릭없이 좌표설정 함수호출 바로 실행되게
					</script>
					<!-- //지도파싱  -->
				<div
						style="border: solid 2px white; width: auto; height: 100px; text-align: center; margin-top: 50px; line-height: 100px;">
						</div>
				</div>
			</div>
			<!--//contact -->

		</div>
	</div>
</body>
</html>