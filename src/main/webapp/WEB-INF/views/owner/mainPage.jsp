<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
    <head>
        <link
            rel="stylesheet"
            href="${root}/resources/css/owner/mainPage.css"
            type="text/css"
            media="all"
        />
        <link href="${root}/resources/css/styles/Chart.css" rel="stylesheet" />
        <script
            type="text/javascript"
            src="${root}/resources/javascript/modules/Chart.js"
        ></script>
        <script
            type="text/javascript"
            src="${root}/resources/javascript/owner/mainPage.js"
        ></script>
    </head>
    <body>
        <div class="owner container">
            <div class="main-page">
                <div class="top-banner">
                    <span class=".read-background">${ownerMainPageDto.user_name} 님 환영합니다.</span>
                </div>
                <div class="content-area border rounded">
                    <div class="content-top">
                        <div class="content-left">
                            <span class="sub-title">내 그래프</span>
                            <div class="sub-content">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <!-- <li class="nav-item">
                                        <a
                                            class="nav-link active"
                                            data-toggle="tab"
                                            href="#graph1"
                                            >태그별 검색 순위</a
                                        >
                                    </li> -->
                                    <li class="nav-item">
                                        <a
                                            class="nav-link active"
                                            data-toggle="tab"
                                            href="#graph2"
                                            >월별 이용량</a
                                        >
                                    </li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <%-- <div id="graph1" class="container tab-pane active">
                                    	<canvas
                                            id="chart1"
                                            class="charts"
                                        ></canvas>
                                    </div> --%>
                                    <div id="graph2" class="container tab-pane active">
                                        <canvas
                                            id="chart2"
                                            class="charts"
                                        ></canvas>
                                    </div>
                                </div>
                                <script type="text/javascript">
	                                $.ajax({
		                                type: "POST",
		                                url: "${root}/owner/reservationChart.json",
		                                data: "camp_id=" + ${ownerDto.camp_id},
		                                dataType: "json",
		                                success: function (response) {
		                                		drawChart(2, response);
		                                }
		                            });
                            	</script>
                            </div>
                        </div>
                        <div class="content-right">
                            <span class="sub-title">내 캠핑정보 요약</span>
                            <div class="sub-content">
                                <table class="table">
                                    <tbody></tbody>
                                </table>
                                <script type="text/javascript">
                                var titles = {
                                		camp_name: "캠프이름:",
        								address: "주소", 
        								hp: "문의처", 
        								homepage: "홈페이지"
        							};
        							
        							var camp = {
        									camp_name: "${ownerMainPageDto.camp_name}",
        									address: "${ownerMainPageDto.address}",
        									hp: "${ownerMainPageDto.hp}",
        									homepage: "<a href='" + "${ownerMainPageDto.camp_link}" + "'>바로가기</a>"
        							};
        							
        							
        							for(let prop in camp) {
        								if(!camp.hasOwnProperty(prop)) continue;
        								if(camp[prop] != "") {
        									$("body > div > div.owner.container > div > div.content-area.border.rounded > div > div.content-right > div > table > tbody").append(
        										"<tr><th>" + titles[prop] + "</th><td>" + camp[prop] + "</td></tr>"
        									);
        								};
        							};
                                </script>
                                <div class="button-area">
                                    <button class="btn btn-primary" onclick="javascript: location.href='${root}/board/campReview/searchList.do?keyword=${ownerMainPageDto.camp_name}'">
                                        리뷰보기
                                    </button>
                                    <button class="btn btn-secondary" onclick="javascript: location.href='${root}/search/read.do?camp-id=${ownerDto.camp_id}'">
                                        상세보기
                                    </button>
                                    <button class="btn btn-success" onclick="javascript: location.href='${root}/owner/update.do?camp_id=${ownerDto.camp_id}&owner_key=${ownerDto.owner_key}'">
                                        수정하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--존재하는 값마다 루프처리-->
                <div class="content-bottom border rounded">
                    <span class="sub-title">요금별 예약 리스트 </span>
                    <button class="btn btn-primary payinfo" 
                    		data-toggle="modal"
                            data-target="#payModal">
                            	요금상세
                    </button>
                    <!-- Nav tabs -->
                    <ul
                        class="nav nav-tabs"
                        role="tablist"
                        style="margin-top: 20px;"
                    >
                    
                    <c:forEach varStatus="status" var="pay" items="${paymentList}">
                    	<c:if test="${status.index == 0}">
                    		<c:set var="payClass" value="nav-link active"></c:set>
                        </c:if>
                        <c:if test="${status.index > 0}">
                    		<c:set var="payClass" value="nav-link"></c:set>
                        </c:if>
                    	<li class="nav-item">
                            <a
                            	class="${payClass}"
                                data-toggle="tab"
                                href="#payment${status.index+1}"
                                >${pay.fee_name}</a
                            >
                        </li>
                    </c:forEach>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                    	<c:forEach varStatus="status" var="pay" items="${paymentList}">
                    	<c:if test="${status.index == 0}">
                    		<c:set var="payClass" value="container tab-pane active"></c:set>
                        </c:if>
                        <c:if test="${status.index > 0}">
                    		<c:set var="payClass" value="container tab-pane fade"></c:set>
                        </c:if>
                        <div id="payment${status.index+1}" class="${payClass}">
                            <br />
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>예약자명</th>
                                        <th>예약자번호</th>
                                        <th>인원</th>
                                        <th>예약등록일</th>
                                        <th>예약 시작일</th>
                                        <th>예약 종료일</th>
                                        <th>금액</th>
                                    </tr>
                                </thead>
                                <!--해당되는 예약 수 만큼 루프처리-->
                                <tbody></tbody>
                            </table>
                            <ul class="pagination"></ul>
                        </div>
                        	<script type="text/javascript">
	                        	$.ajax({
	                                type: "POST",
	                                url: "${root}/owner/reservationList.json",
	                                data: "camp_id=" + ${ownerDto.camp_id} + "&fee_name=" + "${pay.fee_name}",
	                                dataType: "json",
	                                success: function (response) {
	                                	var pageSize = Math.round(response.length / 10);
	                                	
	                                	for(var i = 1; i <= pageSize; i++) {
	                                		$("#payment${status.index+1} > .pagination").append(
	    	                                	"<li class='page-item'>" +
	    	                                		"<a class='page-link' tabindex='" + i +"'>" + i + "</a>" +
	    	                                	"</li>"
	    	                                );
	                                	}
	                                	
	                                	reservationList(0, response, ${status.index+1});
	                                	
	                                	$("#payment${status.index+1} > ul > li > a").click(function() {
	                                		var page = $(this).text() - 1;
	                                		reservationList(page, response, ${status.index+1});	
	                                	});
	                                }
	                            });
                        	</script>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </div>
        	<div
				class="modal fade"
				id="payModal"
				tabindex="-1"
				role="dialog"
				aria-labelledby="checkLabel"
				aria-hidden="true"
			>
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="checkLabel">
								${ownerMainPageDto.camp_name}의 요금 상세
							</h5>
							<button
								type="button"
								class="close"
								data-dismiss="modal"
								aria-label="Close"
							>
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<c:forEach var="paymentDto" items="${paymentList}">
								<span class="title"> <i class="fa fa-flag"
									aria-hidden="true" style="color: royalblue;"></i> ${paymentDto.fee_name}
								</span>
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th>평상시 주중</th>
											<th>평상시 주말</th>
											<th>성수기 주중</th>
											<th>성수기 주말</th>
											<th>하루수용인원</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${paymentDto.normal_season_weekdays_fee}</td>
											<td>${paymentDto.normal_season_holidays_fee}</td>
											<td>${paymentDto.peak_season_weekdays_fee}</td>
											<td>${paymentDto.peak_season_holidays_fee}</td>
											<td>${paymentDto.day_accept_member}</td>
										</tr>
									</tbody>
								</table>
							</c:forEach>
						</div>
						<div class="modal-footer">
							<button
								type="button"
								class="btn btn-secondary"
								data-dismiss="modal"
							>
								Close
							</button>
							<button type="button" 
							class="btn btn-primary"
							onclick="javascript:location.href='${root}/owner/updatePayment.do?camp_id=${ownerDto.camp_id}'">
								수정하기
							</button>
						</div>
					</div>
				</div>
			</div>
    </body>
</html>
