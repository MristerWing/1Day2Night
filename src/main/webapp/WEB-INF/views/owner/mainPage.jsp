<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </head>
    <body>
        <div class="owner container">
            <div class="main-page">
                <div class="top-banner">
                    <span class=".read-background">이용자 님 환영합니다.</span>
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
                                    <button class="btn btn-primary">
                                        리뷰보기
                                    </button>
                                    <button class="btn btn-secondary">
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
                        <li class="nav-item">
                            <a
                                class="nav-link active"
                                data-toggle="tab"
                                href="#payment1"
                                >일반캠핑</a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#payment2"
                                >오토캠핑</a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#payment3"
                                >글램핑</a
                            >
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="payment1" class="container tab-pane active">
                            <br />
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>예약자명</th>
                                        <th>인원</th>
                                        <th>예약등록일</th>
                                        <th>예약 시작일</th>
                                        <th>예약 종료일</th>
                                        <th>금액</th>
                                    </tr>
                                </thead>
                                <!--해당되는 예약 수 만큼 루프처리-->
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Anna</td>
                                        <td>Pitt</td>
                                        <td>35</td>
                                        <td>New York</td>
                                        <td>USA</td>
                                        <td>Female</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="payment2" class="container tab-pane fade">
                            <br />
                            <h3>2</h3>
                        </div>
                        <div id="payment3" class="container tab-pane fade">
                            <br />
                            <h3>3</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
