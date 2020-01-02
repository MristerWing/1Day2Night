<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="${root}/resources/javascript/search/searchList.js"></script>
<!--getSearchCSS-->
<link href="${root}/resources/css/search/search.css" rel="stylesheet" />
<link href="${root}/resources/css/search/searchBar.css" rel="stylesheet" />
<link href="${root}/resources/css/search/searchList.css"
	rel="stylesheet" />
<!-- 검색 게시물 Content CSS  -->
<link href="${root}/resources/css/search/searchBoard.css"
	rel="stylesheet" />
	
<!-- 실시간 자동검색 완성 css / js -->
<link href="${root}/resources/css/styles/jquery-ui.css" rel="stylesheet"/>	
<script src="${root}/resources/javascript/modules/jquery-ui.js"></script>
<!-- 검색값 초기화 JS -->
<script>
				$(function() {
					// 수정하기전 작업이야!!!!!!!!!!!ㅇㅇ
					<!-- 기본검색 초기화 -->
					$('#c_do option[value="${searchMap.city}"]').attr("selected",true);
					$('#searchLctCl option[value="${searchMap.thema}"]').attr("selected",true);
					$("#searchKrwd2").val("${searchMap.keyword}");
					
					<!-- 태그검색 초기화 -->
					var tagArr = "${searchMap.tag}".split(",");
					$("#layout-3 > div.tagBtn_group > ul > li > a").each(function() {
						var tag = $(this).text().replace("#", "");
						
						if(tagArr.indexOf(tag) > -1) {
							 $(this).css("background-color", "slateblue");
                        }
					
					});
					
					<!-- 상세검색 초기화 -->
 					var cityArr = "${searchMap.detailSearchCity}";
					$("#campSearchForm3 > div > ul > li:nth-child(1) > div > div > div > ul > li > input").each(function() {
						if(cityArr.indexOf($(this).val()) > -1) {
							$(this).prop("checked", true);
						}
						
					
					});
					
					var operArr = "${searchMap.detailSearchOperationType}".split(",");
					$("#campSearchForm3 > div > ul > li:nth-child(2) > div > div > div > ul input").each(function() {
						
						if(operArr.indexOf($(this).val()) > -1) {
							$(this).prop("checked", true);
						}
						
					});
					
					var locaArr = "${searchMap.detailSearchLocationType}".split(",");
					$("#campSearchForm3 > div > ul > li:nth-child(3) > div > div > div > ul input").each(function() {
						
						if(locaArr.indexOf($(this).val()) > -1) {
							$(this).prop("checked", true);
						}
					});
					
					var campArr = "${searchMap.detailSearchCampType}".split(",");
					$("#campSearchForm3 > div > ul > li:nth-child(4) > div > div > div > ul input").each(function() {
						
						if(campArr.indexOf($(this).val()) > -1) {
							$(this).prop("checked", true);
						}
					});
					
					var bottArr = "${searchMap.detailSearchBottomType}".split(",");
					$("#campSearchForm3 > div > ul > li:nth-child(5) > div > div > div > ul input").each(function() {
						
						if(bottArr.indexOf($(this).val()) > -1) {
							$(this).prop("checked", true);
						}
					});
					
					var mainArr = "${searchMap.detailSearchMainFacities}".split(",");
					$("#campSearchForm3 > div > ul > li:nth-child(6) > div > div > div > ul input").each(function() {
						
						if(mainArr.indexOf($(this).val()) > -1) {
							$(this).prop("checked", true);
						}
					});
					
					<!-- 필터검색 초기화 -->
					$('#search_Content > div:nth-child(1) > div > select option[value="${searchMap.filter}"]').attr("selected",true);
					
					<!-- 실시간 자동검색 -->
					$("#searchKrwd2").autocomplete({
						
						source: function(request, response) {
							
							$.ajax({
								
								type:"post",
								url:"${root}/search/autoComplete.json",
								// request.term = $("searchKrwd2").val() [참고용]
								data:{ searchName: request.term },
								dataType:"json",
								success: function(data) {
									response(
										$.map(data, function(item) {
											return {
												label : item.data,
												value: item.data
											}
										})
									);
								},
								error:function(xhr, status, error) {
									alert(xhr + "," + status + "," + error);
								}
							});
						},
						minLength:2,
						delay:500,
						
						focus: function(eventCheck, ui) {
							eventCheck.preventDefault();
							console.log(ui.item.label);
							
							$("#searchKrwd2").keydown(function(key) {
								
								if(key.which == 13) {
									$("#searchKrwd2").val(ui.item.label);
									event();
								}
							});
						}
					});
				});
</script>
</head>
<body>
	<div class="search">
		<div class="topline-background">
			<div class="container">
				<!-- <div class="name-space">
                        <h3>검색</h3>
                    </div> -->
				<!-- 검색박스  -->
				<div id="layout-1" style="display: block;">
					<div class="top_search_box">
						<div id="campSearchForm2">
							<input type="hidden" name="listTy" value="MAP" /> <input
								id="listOrdrTrget" name="listOrdrTrget" type="hidden"
								value="last_updusr_pnttm" />
							<button type="button" class="tag_link_btn">
								<span>태그로 검색</span>
							</button>
							<div>
								<div class="form_tt">
									<h2 class="tt">상세검색</h2>
									<a class="form_openTT" title="상세검색 펼쳐보기"></a>
								</div>
								<div class="form_w form_w_movV">
									<ul>
										<li class="tt"><strong class="title">지역</strong>
											<div class="select_box">
												<label for="c_do">도/특별시</label><select id="c_do" name="c_do"
													class="detail_select" title="도/특별시"><option
														value="">전체</option>
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
													<option value="제주">제주도</option></select>
											</div></li>
										<li class="tt"><strong class="title">테마</strong>
											<div class="select_box them">
												<label for="searchLctCl">전체</label> <select
													class="detail_select" name="searchLctCl" id="searchLctCl"
													title="테마선택">
													<option value="">전체테마</option>
													<option value="해변">해변</option>
													<option value="섬">섬</option>
													<option value="산">산</option>
													<option value="숲">숲</option>
													<option value="계곡">계곡</option>
													<option value="강">강</option>
													<option value="호수">호수</option>
													<option value="도심">도심</option>
												</select>
											</div></li>
									</ul>
									<ul>
										<li class="tt top_kwdSearch"><strong class="title">키워드검색</strong>
											<div class="input_search">
												<input id="searchKrwd2" name="searchKrwd"
													class="m_search_in" style="vertical-align: middle;"
													title="검색어를 입력하세요." placeholder="검색어를 입력하세요." type="text"
													value="" />
											</div></li>

										<li class="fw_2li">
											<ul>
												<li class="button_w">
													<button type="button" class="de_btn01">상세조건</button>
												</li>
												<li class="button_w">
													<button type="button" class="de_btn02">캠핑장 검색 +</button> <script>
														function event() {
                                                    		var city = "";
                                                        	if($(
                                                                    "#c_do"
                                                            ).val() != "") {
                                                        		
                                                            city = $("#c_do").val();
                           
                                                        	}
                                                            var thema = $(
                                                                "#searchLctCl"
                                                            ).val();
                                                            var keyword = "";
                                                            if($(
                                                                    "#searchKrwd2"
                                                            ).val() != "") {
                                                            	keyword =  $("#searchKrwd2").val();
                                                            }

                                                            // 링크로 보낸다.
                                                            var isMap = '${isMap}';
                                                            
                                                            var url =
                                                                "${root}/search/list.do?city=" +
                                                                city +
                                                                "&thema=" +
                                                                thema +
                                                                "&keyword=" +
                                                                keyword;
                                                                
                                                            if(isMap === 'MAP') url += "&isMap=" + isMap;
                                                            location.href = url;
                                                    	}
                                                            $(
                                                                "#campSearchForm2 > div > div.form_w.form_w_movV > ul:nth-child(2) > li.fw_2li > ul > li:nth-child(2) > button"
                                                            ).click(function() {
                                                            	event();
                                                            });
                                                            
                                                            $("#searchKrwd2").keydown(function (key) {
																if(key.which == 13) {
																	event();
																}
															});  
                                                        </script>
												</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="layout-2" style="display: none;">
					<!--상세검색-->
					<div id="campSearchForm3">
						<div class="detail_search_w">
							<ul>
								<li>
									<div class="tm_ver f_open">
										<div class="folder_w" style="display: block;">
											<label class="title">지역별</label>
											<div class="check_w">
												<ul>
													<li><input type="checkbox" name="searchDo" id="c_do01"
														class="check01" value="서울" /><label for="c_do01">서울시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do02"
														class="check01" value="부산" /><label for="c_do02">부산시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do03"
														class="check01" value="대구" /><label for="c_do03">대구시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do04"
														class="check01" value="인천" /><label for="c_do04">인천시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do05"
														class="check01" value="광주" /><label for="c_do05">광주시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do06"
														class="check01" value="대전" /><label for="c_do06">대전시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do07"
														class="check01" value="울산" /><label for="c_do07">울산시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do08"
														class="check01" value="세종" /><label for="c_do08">세종시</label>
													</li>
													<li><input type="checkbox" name="searchDo" id="c_do09"
														class="check01" value="경기" /><label for="c_do09">경기도</label>
													</li>
													<li><input type="checkbox" name="searchDo"
														id="c_do010" class="check01" value="강원" /><label
														for="c_do010">강원도</label></li>
													<li><input type="checkbox" name="searchDo"
														id="c_do011" class="check01" value="충북|충청북도" /><label
														for="c_do011">충청북도</label></li>
													<li><input type="checkbox" name="searchDo"
														id="c_do012" class="check01" value="충남|충청남도" /><label
														for="c_do012">충청남도</label></li>
													<li><input type="checkbox" name="searchDo"
														id="c_do013" class="check01" value="전북|전라북도" /><label
														for="c_do013">전라북도</label></li>
													<li><input type="checkbox" name="searchDo"
														id="c_do014" class="check01" value="전남|전라남도" /><label
														for="c_do014">전라남도</label></li>
													<li><input type="checkbox" name="searchDo"
														id="c_do015" class="check01" value="경북|경상북도" /><label
														for="c_do015">경상북도</label></li>
													<li><input type="checkbox" name="searchDo"
														id="c_do016" class="check01" value="경남|경상남도" /><label
														for="c_do016">경상남도</label></li>
													<li><input type="checkbox" name="searchDo"
														id="c_do017" class="check01" value="제주" /><label
														for="c_do017">제주도</label></li>
												</ul>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="tm_ver f_open">
										<div class="folder_w" style="display: block;">
											<label class="title">운영형태</label>
											<div class="check_w">
												<ul>
													<li><input type="checkbox" name="searchCl" id="c_cl01"
														class="check01" value="지자체" /><label for="c_cl01">지자체</label>
													</li>
													<li><input type="checkbox" name="searchCl" id="c_cl02"
														class="check01" value="국립공원" /><label for="c_cl02">국립공원</label>
													</li>
													<li><input type="checkbox" name="searchCl" id="c_cl03"
														class="check01" value="자연휴양림" /><label for="c_cl03">자연휴양림</label>
													</li>
													<li><input type="checkbox" name="searchCl" id="c_cl04"
														class="check01" value="국민여가" /><label for="c_cl04">국민여가</label>
													</li>
													<li><input type="checkbox" name="searchCl" id="c_cl05"
														class="check01" value="민간" /><label for="c_cl05">민간</label>
													</li>
												</ul>
											</div>
										</div>
										<!--//folder_w-->
									</div> <!--//tm_ver-->
								</li>
								<li>
									<div class="tm_ver f_open">
										<div class="folder_w" style="display: block;">
											<label class="title">입지구분</label>
											<div class="check_w">
												<ul>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl01" class="check01" value="해변" /><label
														for="c_lct_cl01">해변</label></li>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl02" class="check01" value="섬" /><label
														for="c_lct_cl02">섬</label></li>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl03" class="check01" value="산" /><label
														for="c_lct_cl03">산</label></li>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl04" class="check01" value="숲" /><label
														for="c_lct_cl04">숲</label></li>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl05" class="check01" value="계곡" /><label
														for="c_lct_cl05">계곡</label></li>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl06" class="check01" value="강" /><label
														for="c_lct_cl06">강</label></li>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl07" class="check01" value="호수" /><label
														for="c_lct_cl07">호수</label></li>
													<li><input type="checkbox" name="searchLctCl"
														id="c_lct_cl08" class="check01" value="도심" /><label
														for="c_lct_cl08">도심</label></li>
												</ul>
											</div>
										</div>
										<!--//folder_w-->
									</div> <!--//tm_ver-->
								</li>
								<li>
									<div class="tm_ver f_open">
										<div class="folder_w" style="display: block;">
											<label class="title">주요시설</label>
											<div class="check_w">
												<ul>
													<li><input type="checkbox" name="searchInduty"
														id="c_induty01" value="일반야영장" class="check01" /><label
														for="c_induty01">일반야영장</label></li>
													<li><input type="checkbox" name="searchInduty"
														id="c_induty02" value="자동차야영장" class="check01" /><label
														for="c_induty02">자동차야영장</label></li>
													<li><input type="checkbox" name="searchInduty"
														id="c_induty03" value="카라반" class="check01" /><label
														for="c_induty03">카라반</label></li>
													<li><input type="checkbox" name="searchInduty"
														id="c_induty04" value="글램핑" class="check01" /><label
														for="c_induty04">글램핑</label></li>
												</ul>
											</div>
										</div>
										<!--//folder_w-->
									</div> <!--//tm_ver-->
								</li>
								<li>
									<div class="tm_ver f_open">
										<div class="folder_w" style="display: block;">
											<label class="title">바닥형태</label>
											<div class="check_w">
												<ul>
													<li><input type="checkbox" class="check01"
														name="searchSiteBottomCl1" id="searchSiteBottomCl1"
														value="잔디" /><label for="searchSiteBottomCl1"
														class="label_name">잔디</label></li>
													<li><input type="checkbox" class="check01"
														name="searchSiteBottomCl2" id="searchSiteBottomCl2"
														value="테크" /><label for="searchSiteBottomCl2"
														class="label_name">데크</label></li>
													<li><input type="checkbox" class="check01"
														name="searchSiteBottomCl3" id="searchSiteBottomCl3"
														value="파쇄석" /><label for="searchSiteBottomCl3"
														class="label_name">파쇄석</label></li>
													<li><input type="checkbox" class="check01"
														name="searchSiteBottomCl4" id="searchSiteBottomCl4"
														value="자갈" /><label for="searchSiteBottomCl4"
														class="label_name">자갈</label></li>
													<li><input type="checkbox" class="check01"
														name="searchSiteBottomCl5" id="searchSiteBottomCl5"
														value="맨흙" /><label for="searchSiteBottomCl5"
														class="label_name">맨흙</label></li>
												</ul>
											</div>
										</div>
										<!--//folder_w-->
									</div> <!--//tm_ver-->
								</li>
								<li>
									<div class="tm_ver f_open">
										<div class="folder_w" style="display: block;">
											<label class="title">부대시설</label>
											<div class="check_w">
												<ul>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode01" value="전기" class="check01" /><label
														for="searchSbrsClCode01">전기</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode02" value="와이파이" class="check01" /><label
														for="searchSbrsClCode02">무선인터넷</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode03" value="장작판매" class="check01" /><label
														for="searchSbrsClCode03">장작판매</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode04" value="온수" class="check01" /><label
														for="searchSbrsClCode04">온수</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode05" value="트렘폴린" class="check01" /><label
														for="searchSbrsClCode05">트렘폴린</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode06" value="물놀이장" class="check01" /><label
														for="searchSbrsClCode06">물놀이장</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode07" value="놀이터" class="check01" /><label
														for="searchSbrsClCode07">놀이터</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode08" value="산책로" class="check01" /><label
														for="searchSbrsClCode08">산책로</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode09" value="운동장" class="check01" /><label
														for="searchSbrsClCode09">운동장</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode010" value="운동시설" class="check01" /><label
														for="searchSbrsClCode010">운동시설</label></li>
													<li><input type="checkbox" name="searchSbrsClCode"
														id="searchSbrsClCode011" value="마트.편의점" class="check01" /><label
														for="searchSbrsClCode011">마트.편의점</label></li>
												</ul>
											</div>
										</div>
										<!--//folder_w-->
									</div> <!--//tm_ver-->
								</li>
								<li class="detail_btn_w">
									<button type="reset" class="reset button">초기화</button>
									<button type="button" class="serach button">검색</button> <script
										type="text/javascript">
                                            // 검색
                                            $(
                                                "#campSearchForm3 > div > ul > li.detail_btn_w > button.serach.button"
                                            ).click(function() {
                                                // data
                                                var searchArr = new Array();
                                                for (var i = 1; i <= 7; i++) {
                                                    var str = "";
                                                    $(
                                                        "#campSearchForm3 > div > ul > li:nth-child(" +
                                                            i +
                                                            ") > div > div > div > ul > li"
                                                    ).each(function() {
                                                        if (
                                                            $(this)
                                                                .children()
                                                                .eq(0)
                                                                .is(":checked")
                                                        ) {
                                                            str +=
                                                                $(this)
                                                                    .children()
                                                                    .eq(0)
                                                                    .val() + ",";
                                                        }
                                                    });
                                                    searchArr.push(str);
                                                }
                                                var [
                                                    detailSearchCity,
                                                    detailSearchOperationType,
                                                    detailSearchLocationType,
                                                    detailSearchCampType,
                                                    detailSearchBottomType,
                                                    detailSearchMainFacities
                                                ] = searchArr;
                                                // 도시명 변환
                                                detailSearchCity = detailSearchCity.replace(
                                                    /,/gi,
                                                    "|"
                                                );
                                                // 링크로 이동
                                                // 수정필요 (지역별에서 구분자로 | 넣어주는데 마지막 |뺴주기 위한 코드)
                                                
                                                detailSearchCity = detailSearchCity.substring(0, detailSearchCity.length - 1);
                                                var url =
                                                	"${root}/search/list.do?detailSearchCity=" 
                                                			+ 
                                                            detailSearchCity +
                                                    "&detailSearchOperationType=" +
                                                    
                                                    detailSearchOperationType +
                                                    "&detailSearchLocationType=" +
                                                    
                                                    detailSearchLocationType +
                                                    "&detailSearchCampType=" +
                                                    
                                                    detailSearchCampType +
                                                    "&detailSearchBottomType=" +
                                                    
                                                    detailSearchBottomType +
                                                    "&detailSearchMainFacities=" +
                                                    
                                                    detailSearchMainFacities;
                                                var isMap = '${isMap}';
                                                if(isMap === 'MAP') url += "&isMap=" + isMap;
                                                location.href = url;
                                            });
                                        </script>
									<button type="button" class="exit button">닫기</button>
								</li>
							</ul>
						</div>
					</div>
					<!--//상세검색-->
				</div>
				<div id="layout-3" style="display: none;">
					<div class="tag_title">
						<p class="camp_name">#추천태그</p>
						<span class="tag_stt">추천태그를 클릭하여 검색해보세요.<br />원하는 유형의 캠핑장
							정보를 확인하실 수 있습니다.
						</span>
					</div>
					<div class="tagBtn_group">
						<ul>
							<li class="tag_s"><a href="#none" class="animal tagBtn"
								id="animal">#애견동반</a></li>
							<li><a href="#none" class="tagBtn " id="110_111">#계곡옆</a></li>
							<li><a href="#none" class="tagBtn " id="104_109">#아이들 놀기
									좋은</a></li>
							<li><a href="#none" class="tagBtn " id="104_107">#차대기 편한</a></li>
							<li><a href="#none" class="tagBtn " id="123_124">#힐링</a></li>
							<li><a href="#none" class="tagBtn " id="126_155">#익스트림</a></li>
							<li><a href="#none" class="tagBtn " id="104_105">#깨끗한</a></li>
							<li><a href="#none" class="tagBtn " id="110_115">#바다가
									보이는</a></li>
							<li><a href="#none" class="tagBtn " id="98_129">#가을</a></li>
							<li><a href="#none" class="tagBtn " id="126_157">#야영장사고배상책임보험가입</a>
							</li>
							<li><a href="#none" class="tagBtn " id="117_121">#자전거 타기
									좋은</a></li>
							<li><a href="#none" class="tagBtn " id="99_102">#여유있는</a></li>
							<li><a href="#none" class="tagBtn " id="98_130">#겨울</a></li>
							<li><a href="#none" class="tagBtn " id="123_125">#커플</a></li>
							<li><a href="#none" class="tagBtn " id="110_114">#물맑은</a></li>
							<li><a href="#none" class="tagBtn " id="104_108">#수영장 있는</a></li>
							<li><a href="#none" class="tagBtn " id="99_101">#재미있는</a></li>
							<li><a href="#none" class="tagBtn " id="117_119">#축제</a></li>
							<li><a href="#none" class="tagBtn " id="117_120">#둘레길</a></li>
							<li><a href="#none" class="tagBtn " id="98_128">#여름</a></li>
							<li><a href="#none" class="tagBtn " id="123_146">#가족</a></li>
							<li><a href="#none" class="tagBtn " id="99_103">#사이트 간격이
									넓은</a></li>
							<li><a href="#none" class="tagBtn " id="117_118">#문화유적</a></li>
							<li><a href="#none" class="tagBtn " id="110_116">#그늘이 많은</a></li>
							<li><a href="#none" class="tagBtn " id="98_127">#봄</a></li>
							<li><a href="#none" class="tagBtn " id="104_106">#온수 잘
									나오는</a></li>
							<li><a href="#none" class="tagBtn " id="110_112">#생태교육</a></li>
							<li><a href="#none" class="tagBtn " id="117_122">#별 보기
									좋은</a></li>
							<li><a href="#none" class="tagBtn " id="99_100">#친절한</a></li>
							<li><a href="#none" class="tagBtn " id="110_113">#물놀이 하기
									좋은</a></li>
						</ul>
					</div>
					<div class="tagSearch_btn_wrap">
						<a href="#" class="btn_reset"> 초기화</a> <a href="#"
							class="btn_detail"> 상세조건으로 검색 </a> <a href="#" class="btn_search"
							id="btn_tag_search"> 검색하기</a>
						<script type="text/javascript">
                                var tagArr = new Array();
                                // 태그 선택
                                $("#layout-3 > div.tagBtn_group > ul > li > a").click(function() {
                                    var tag = $(this).text();
                                    var index = tagArr.indexOf(tag);
                                    
                                    if (index > -1) {
                                        $(this).css("background-color", "transparent");
                                        tagArr.splice(index, 1);
                                    } else {
                                        $(this).css("background-color", "slateblue");
                                        tagArr.push(tag);
                                    }
                                });

                                // 태그 초기화
                                $("#layout-3 > div.tagSearch_btn_wrap > a.btn_reset").click(function() {
                                    $("#layout-3 > div.tagBtn_group > ul > li > a").css(
                                        "background-color",
                                        "transparent"
                                    );
                                    tagArr = new Array();
                                });

                                // 검색
                                $("#btn_tag_search").click(function() {
                                    var tag = tagArr.reduce((first, x) => (first += x.replace("#", "") + ","), "");

                                    // 이후 링크로 이동
                                    var url = "${root}/search/list.do?tag=" + tag;
                                    var isMap = '${isMap}';
                                    if(isMap === 'MAP') url += "&isMap=" + isMap;
                                    location.href = url;
                                });
                            </script>
					</div>
				</div>
				<!--검색박스-->
			</div>
		</div>
	</div>
	<!-- 리스트부분 -->
	<c:set var="url" value="${root}/search/list.do?" />
	<c:if test="${isMap == 'MAP'}">
		<c:set var="url" value="${root}/search/list.do?isMap=MAP&" />
	</c:if>

	<c:if
		test="${searchMap.city != null || searchMap.thema != null || searchMap.keyword != null }">
		<c:set var="url"
			value="${url}city=${searchMap.city}&thema=${searchMap.thema}&keyword=${searchMap.keyword}&" />
	</c:if>

	<c:if test="${searchMap.tag != null}">
		<c:set var="url" value="${url}tag=${searchMap.tag}&" />
	</c:if>

	<c:if
		test="${searchMap.detailSearchCity != null || searchMap.detailSearchOperationType != null || searchMap.detailSearchLocationType != null
					  || searchMap.detailSearchCampType != null || searchMap.detailSearchBottomType != null || searchMap.detailSearchMainFacities != null}">
		<c:set var="url"
			value="${url}detailSearchCity=${searchMap.detailSearchCity}&detailSearchOperationType=${searchMap.detailSearchOperationType}&detailSearchLocationType=${searchMap.detailSearchLocationType}&detailSearchCampType=${searchMap.detailSearchCampType}&detailSearchBottomType=${searchMap.detailSearchBottomType}&detailSearchMainFacities=${searchMap.detailSearchMainFacities}&" />
	</c:if>
	<div class="container" id="search_Content">
		<div>
			<h2 style="color: black;">
				총 <span style="color: #eb831d;">${searchMap.count}개</span> 캠핑장이
				검색되었습니다.
			</h2>
			<div class="search_Filter">
				<select>
					<option value="regisDate">등록일순</option>
					<option value="readCount">조회순</option>
					<option value="reCommand">추천순</option>
					<option value="reviewCount">리뷰순</option>
				</select>

				<!-- 필터 관련 JavaScript -->
				<script>
		            	$(".search_Filter > select").change(function() {
		            		var filter = 
		            		$(".search_Filter > select option:selected").val();
		            		
		            		var url = "${url}"+"filter=";
		            		location.href= url+filter;
		            	}) 
	            </script>
				<c:if test="${isMap == 'MAP'}">
					<button
						onclick="javascript:location.href='${url}'.replace('isMap=MAP','') + '&filter=${searchMap.filter}' + '&pageNumber=${searchMap.currentPage}'">리스트
						보기</button>
				</c:if>
				<c:if test="${isMap == null}">
					<button onclick="javascript:location.href='${url}' + 'isMap=MAP' + '&filter=${searchMap.filter}' + '&pageNumber=${searchMap.currentPage}'">지도로
						보기</button>
				</c:if>
			</div>
		</div>
		<!-- 지도로 검색 -->
		<c:if test="${isMap == 'MAP'}">
			<jsp:include page="./map.jsp">
				<jsp:param name="searchMap" value="${searchMap}" />
			</jsp:include>
		</c:if>

		<c:if test="${isMap == null}">
			<!-- 게시물 반복처리 -->
			<div class="search_list">
				<c:if test="${searchMap.searchList.size() > 0}">
					<c:forEach var="searchDto" varStatus="status"
						items="${searchMap.searchList}">
						<div class="Each_search row">
							<div class="col-sm-4 main_img">
								<a href="${root}/search/read.do?camp-id=${searchDto.camp_id}"><img
									src="${searchDto.main_image}"></a>
							</div>
							<div class="col-sm-7 Each_search_sub">
								<div class="badges-area">
									<span class="badge badge-primary">관광사업자 등록업체</span> <span
										class="badge badge-secondary">리뷰수
										${searchDto.review_count}</span> <span class="badge badge-info">조회수
										${searchDto.read_count}</span> <span class="badge badge-dark">추천수
										${searchDto.recommand_count}</span>
								</div>
								<div class="name-content-area">
									<span class="namespace"><a class="camp-title"
										href="${root}/search/read.do?camp-id=${searchDto.camp_id}">${searchDto.camp_name}</a></span>
									<c:if test="${searchDto.address != null}">
										<span class="address"> <i class='fa fa-map-marker'
											aria-hidden='true'></i> ${searchDto.address}
										</span>
									</c:if>
									<c:if test="${searchDto.hp != null}">
										<span class="hp"> <i class='fa fa-map-marker'
											aria-hidden='true'></i> ${searchDto.hp}
										</span>
									</c:if>
									<c:if test="${searchDto.main_facilities != null}">
										<div class="info row"></div>
										<script type="text/javascript">
											var title = {
												bolt: "전기",
												wifi: "와이파이",
												firewood: "장작판매",
												hotWater: "온수",
												trampoline: "트램폴린",
												waterPark: "물놀이장",
												playGround: "놀이터",
												park: "산책로",
												stadium: "운동장",
												gym: "운동시설",
												market: "마트.편의점"
											};
											var camp_main_info = "${searchDto.main_facilities}".split(",");
											
											var icons = {
												bolt: "<i class='fa fa-bolt' aria-hidden='true'></i>",
												wifi: "<i class='fa fa-wifi' aria-hidden='true'></i>",
												firewood: "<i class='fa fa-free-code-camp' aria-hidden='true'></i>",
												hotWater: "<i class='fa fa-thermometer-full' aria-hidden='true'></i>",
												trampoline: "<i class='fa fa-circle' aria-hidden='true'></i>",
												waterPark: "<i class='fa fa-bath' aria-hidden='true'></i>",
												playGround: "<i class='fa fa-users' aria-hidden='true'></i>",
												park: "<i class='fa fa-tree' aria-hidden='true'></i>",
												stadium: "<i class='fa fa-futbol-o' aria-hidden='true'></i>",
												gym: "<i class='fa fa-heart' aria-hidden='true'></i>",
												market: "<i class='fa fa-shopping-basket' aria-hidden='true'></i>"
											};
										
											var loop = 0;
											
											for(var prop in title) {
												if(!title.hasOwnProperty(prop)) continue;
												if(title[prop] == camp_main_info[loop]) {
													$("#search_Content > div.search_list > div:nth-child(${status.index+1})").has("div.info.row").children().eq(1).children().eq(1).children().eq(3).append(
																"<div class='icon-area'>" +
																"<div class='main-icons col'>" + icons[prop] + "</div>" +
																"<div class='name'>" + camp_main_info[loop] + "</div>" +
																"</div>"	
													);
														loop++;
												}
											};
										</script>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<!-- 페이징 처리 부분 -->
			<div class="pageCount">
				<c:if test="${searchMap.count>0}">
					<c:set var="pageBlock" value="${10}" />
					<fmt:parseNumber var="pageCount" integerOnly="true"
						value="${searchMap.count/searchMap.boardSize + (searchMap.count % searchMap.boardSize == 0 ? 0 : 1)}" />

					<fmt:parseNumber var="result"
						value="${(searchMap.currentPage-1)/pageBlock}" integerOnly="true" />
					<c:set var="startPage" value="${result*pageBlock+1}" />
					<c:set var="endPage" value="${startPage+pageBlock-1}" />

					<c:if test="${endPage > pageCount }">
						<c:set var="endPage" value="${pageCount}" />
					</c:if>

					<ul class="pagination">
						<c:if test="${startPage > pageBlock}">
							<li class="page-item"><a class="page-link"
								href="${url}pageNumber=1&filter=${searchMap.filter}"><i class="fa fa-angle-double-left"
									aria-hidden="true"></i></a></li>
							<li class="page-item"><a class="page-link"
								href="${url}pageNumber=${startPage - pageBlock}&filter=${searchMap.filter}">PREV</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i != searchMap.currentPage}">
								<li class="page-item"><a class="page-link"
									href="${url}pageNumber=${i}&filter=${searchMap.filter}">${i}</a></li>
							</c:if>
							<c:if test="${i == searchMap.currentPage}">
								<li class="page-item active"><a class="page-link"
									href="${url}pageNumber=${i}&filter=${searchMap.filter}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<li class="page-item"><a class="page-link"
								href="${url}pageNumber=${startPage + pageBlock}&filter=${searchMap.filter}">NEXT</a></li>
							<li class="page-item"><a class="page-link"
								href="${url}pageNumber=${pageCount}&filter=${searchMap.filter}"><i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						</c:if>
					</ul>
				</c:if>
			</div>
		</c:if>
	</div>
</body>
</html>
