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
                                    <li class="nav-item">
                                        <a
                                            class="nav-link active"
                                            data-toggle="tab"
                                            href="#home"
                                            >이용자별</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a
                                            class="nav-link"
                                            data-toggle="tab"
                                            href="#menu1"
                                            >월별</a
                                        >
                                    </li>
                                    <li class="nav-item">
                                        <a
                                            class="nav-link"
                                            data-toggle="tab"
                                            href="#menu2"
                                            >월별 이용량</a
                                        >
                                    </li>
                                </ul>

                                <!--데이터를 이용하여 루프시키킨다. 각 id값은 전부 다르게-->
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div id="home" class="container tab-pane active">
                                        <canvas
                                            id="myChart"
                                            width="1"
                                            height="1"
                                        ></canvas>
                                        <script type="text/javascript">
                                            var ctx = $("#myChart");
                                            var myChart = new Chart(ctx, {
                                                type: "pie",
                                                data: {
                                                    labels: [
                                                        "Red",
                                                        "Blue",
                                                        "Yellow",
                                                        "Green",
                                                        "Purple"
                                                    ],
                                                    datasets: [
                                                        {
                                                            label: "# of Votes",
                                                            data: [12, 19, 3, 5, 2],
                                                            backgroundColor: [
                                                                "rgba(255, 99, 132)",
                                                                "rgba(54, 162, 235)",
                                                                "rgba(255, 206, 86)",
                                                                "rgba(75, 192, 192)",
                                                                "rgba(153, 102, 255)",
                                                                "rgba(255, 159, 64)"
                                                            ]
                                                        }
                                                    ]
                                                },
                                                options: {
                                                    scales: {
                                                        responsive: true
                                                    }
                                                }
                                            });
                                        </script>
                                    </div>
                                    <div id="menu1" class="container tab-pane fade">
                                        <br />
                                        <h3>월</h3>
                                    </div>
                                    <div id="menu2" class="container tab-pane fade">
                                        <br />
                                        <h3>요금</h3>
                                    </div>
                                </div>
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
                                    <button class="btn btn-primary" onclick="javascript: location.href='${root}/board/campReview/list.do'">
                                        리뷰보기
                                    </button>
                                    <button class="btn btn-secondary" onclick="javascript: location.href='${root}/search/read.do?camp-id=${ownerDto.camp_id}'">
                                        상세보기
                                    </button>
                                    <button class="btn btn-success">
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
                        </div>
                        	<script type="text/javascript">
	                        	$.ajax({
	                                type: "POST",
	                                url: "${root}/owner/reservationList.json",
	                                data: "camp_id=" + ${ownerDto.camp_id} + "&fee_name=" + "${pay.fee_name}",
	                                dataType: "json",
	                                success: function (response) {
	                                	var loop = 0;
	                                	$(response).each(function() {
	                                		var index = response[loop];
	                                		var register_date = dateTrans(index.register_date);
	                                		var start_date = dateTrans(index.start_date);
	                                		var end_date = dateTrans(index.end_date);
	                                		
	                                    	$("#payment${status.index+1} > table > tbody").append(
	                                    		"<tr>" +
					                                "<td>" + index.reservation_id + "</td>" +
					                                "<td>" + index.user_name + "</td>" +
					                                "<td>" + index.phone + "</td>" +
					                                "<td>" + index.reservation_personnel + "</td>" +
					                                "<td>" + register_date + "</td>" +
					                                "<td>" + start_date + "</td>" +
					                                "<td>" + end_date + "</td>" +
					                                "<td>" + index.amount + "</td>" +
				                                "</tr>"
	                                    	);
	                                    	loop++;
	                                    });
	                                	console.log(loop);
	                                }
	                            });
                        	</script>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
