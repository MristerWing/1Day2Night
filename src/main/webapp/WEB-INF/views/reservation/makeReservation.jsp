<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>예약</title>
    
        <!-- VsCode용 CSS, JavaScript-->
        <link href="${root}/resources/css/reservation/date.css/reservation.css" rel="stylesheet"/>
        <link href="${root}/resources/css/reservation/date.css" rel="stylesheet"/>
        <link href="${root}/resources/css/styles/font-awesome.css" rel="stylesheet"/>
        <link href="${root}/resources/css/styles/bootstrap.css" rel="stylesheet"/>
        
        <script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
        <script src="${root}/resources/javascript/modules/bootstrap.js"></script>
    </head>
    <body>
        <div class="container">
            <!-- 전체 레이아웃 div-->
            <div id="Content">
                <!-- 캠핑장 예약관련 div -->
                <div class="re_ch">
                    <div class="re_ch_left">
                        
                        <!-- 주소 및 지도-->
                        <div>
                            <h2 style="text-align: center;">${camp.camp_name}</h2>
                            <span>주소 : 강원도 강릉시 성산면 어훌리 457-2</span>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-secondary" style="margin-left: -15px; margin-bottom: 2px;"><i class="fa fa-map-marker" aria-hidden="true"></i>지도보기</button>
                        </div>

                        <!-- 이미지 슬라이드-->
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">

                            <!-- Indicators -->
                            <ul class="carousel-indicators">
                              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                              <li data-target="#myCarousel" data-slide-to="1"></li>
                              <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ul>
                            
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                              <div class="carousel-item active">
                                <img src="../Image/1.jpg" class="rounded" alt="Cinque Terre" width="400" height="506">
                              </div>
                              <div class="carousel-item">
                                <img src="../Image/2.jpg" class="rounded" alt="Cinque Terre" width="400" height="506">
                              </div>
                              <div class="carousel-item">
                                <img src="../Image/3.jpg" class="rounded" alt="Cinque Terre" width="400" height="506">
                              </div>
                            </div>
                            
                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                              <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                              <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
                    </div>

                    <!-- 캠핑장 예약 div -->
                    <div class="re_ch_right" style="margin-top: 10px;width:500px;">
                        <ul class="list-group">
                            <!-- 캠핑장 유형 -->
                            <li class="list-group-item">
                                <h2><i class="fa fa-bed" aria-hidden="true"></i>  캠핑장 유형</h2>
                                <div class="form-check-inline">
                                    <label class="form-check-label" for="radio1">
                                        <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1">일반야영장
                                    </label>
                                </div>

                                <div class="form-check-inline">
                                    <label class="form-check-label" for="radio2">
                                        <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">글램핑
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label">
                                      <input type="radio" class="form-check-input" id="radio3" name="optradio" value="option3">카라반
                                    </label>
                                </div>
                            </li>
                            
                            <!-- 예약인원 -->
                            <li class="list-group-item">
                                <h2><i class="fa fa-male" aria-hidden="true"></i>  예약인원</h2>
                                <div>
                                    <select class="form-control" id="sel1" style="width: 70px; padding:0px;" >
                                        <option>성인</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                    </select>
                                </div>
                                <div>
                                    <select class="form-control" id="sel1" style="width: 70px; padding: 0px; margin: 0px 20px 0px;">
                                        <option>청소년</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                    </select>
                                </div>
                                <div>
                                    <select class="form-control" id="sel1" style="width: 70px; padding:0px;">
                                        <option>유아</option>
                                        <option>1</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                    </select>
                                </div>
                            </li>

                            <!-- 예약날짜 -->
                            <li class="list-group-item">
                                <h2><i class="fa fa-calendar" aria-hidden="true"></i>  예약날짜</h2>
                                <div class="t-datepicker">
                                    <div class="t-check-in"></div>
                                    <div class="t-check-out"></div>
                                </div>
                                <script src="${root}/resources/javascript/reservation/t-datepicker.js"></script>
                                <script>
                                    $(document).ready(function(){
                                        // Call global the function
                                        $('.t-datepicker').tDatePicker({
                                        // options here
                                        });
                                    });
                                    </script>
                                    <script type="text/javascript">

                                    var _gaq = _gaq || [];
                                    _gaq.push(['_setAccount', 'UA-36251023-1']);
                                    _gaq.push(['_setDomainName', 'jqueryscript.net']);
                                    _gaq.push(['_trackPageview']);

                                    (function() {
                                        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                                        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                                    })();

                                </script>
                            </li>
                        </ul>
                    </div>
                </div>
                
            </div>
            <!-- 기본사항 -->
            <div class="re_prec" style="clear: both;">
                <div class="jumbotron">
                    <h3><i class="fa fa-info-circle" aria-hidden="true"></i> 기본사항</h3>
                    <span style="color: blue;">- 입실시간은 이용당일 14:00 ~ 22:00까지 입니다.</span style="color: blue;"><br/>
                    <span>- 22:00 이후 펜션에 도착하실 경우 미리 연락하셔야 하며, 사전 연락이 없을 경우 입실이 불가합니다.</span><br/>
                    <span>- 객실정리 시간이 12:00부터 14:00까지 이므로 이전 입실은 어렵습니다.</span><br/>
                    <span>- 객실은 예약 확인후에 받을 수 있습니다.</span><br/>
                    <span>- 입실시 예약하신 인원에서 인원이 추가되었을 경우 미리 말씀하셔야 하며, 최대 수용인원 외는 입실이 불가합니다.</span><br/>
                    <span style="color: blue;">- 퇴실시간은 마지막 이용일 오전 12:00까지 입니다.</span><br/>
                    <span>- 다음 이용인을 위하여 퇴실시간은 준수해 주시기 바랍니다.</span><br/>
                    <span>- 객실정리 후 퇴실시 점검후 키를 반납해주세요.</span><br/>
                    <span>- 이용 중 객실 집기의 파손이 있었을 경우 말씀해 주시기 바랍니다.</span><br/>
                    <span>- 쓰레기는 지정된 장소에 분리하여 주시기 바랍니다.</span><br/><br/>
                    <h3><i class="fa fa-info-circle" aria-hidden="true"></i> 유의사항</h3>
                    <span>- 이용시간 : 입실 (14:00 ~ 22:00), 퇴실 (오전 12:00까지)</span><br/>
                    <span>- 밤 10시 이후에는 가급적 외부 이용을 자제해 주시기 바랍니다.</span><br/>
                    <span>- 이용시 시설물 훼손, 분실에 대한 책임은 이용인에게 있으므로 유의하시기 바랍니다.</span><br/>
                    <span>- 다른 이용객에게 불쾌감을 주는 행동(무분별한 오락 및 음주 고성방가)과 흡연을 금함.</span><br/>
                    <span>- 보호자를 동반하지 않는 미성년자의 이용은 불가능합니다.</span><br/>
                    <span>- 바베큐 그릴, 참숯 또는 번개탄이 필요하실 경우 미리 말씀하시면 준비해드립니다.</span><br/>
                    <span>- 다음 분을 위해 집기류를 소중히 사용하여 주시면 감사하겠습니다.</span><br/>
                    <span style="color: blue;">- 애견과 같이 입실은 불가합니다.</span><br/>
                    <span style="color: blue;">- 객실 내에서 고기를 구워먹는 일은 절대 금지입니다.</span style="color: blue;"><br/>
                    <span style="color: red;">- pick up이 필요하신 분은 예약시 미리 말씀해주세요.</span style="color: blue;"><br/>
                </div>
            </div>

            <!-- 예약하기 및 뒤로가기 버튼-->
            <div class="re_do">
                <button type="button" class="btn btn-success btn-block">결제하러 가기</button>
                <button type="button" class="btn btn-primary btn-block">뒤로 가기</button>
            </div>
        </div>
    </body>
</html>