<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>결제</title>

        <!-- VsCode용 CSS, JavaScript-->
        <link href="${root}/resources/css/reservation/payReservation.css" rel="stylesheet"/>
        
        <script>
        	$(function() {
        		
        		var cost = $("#Content > div > div.order_div > div:nth-child(2) > h2").text();
        		cost = cost.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        		$("#Content > div > div.order_div > div:nth-child(2) > h2").text(cost);
        		$("#Content > table > tbody > tr > td:nth-child(3)").text(cost);
        		
        		$("#Content > div > div.re_div > div:nth-child(1) > input[type=checkbox]").change(function() {
        			
        			if($("#Content > div > div.re_div > div:nth-child(1) > input[type=checkbox]").is(":checked")) {
        				
        				// 예약자명
        				$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(6) > input[type=text]")
        				.val($("#Content > div > div.order_div > div:nth-child(1) > p:nth-child(2)").text());
        				
        				var phoneNumber = $("#Content > div > div.order_div > div:nth-child(1) > p:nth-child(4)").text();
						
						var phoneArr = phoneNumber.split("-");
						
						//휴대폰 첫 번호
						$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > select").val(phoneArr[0]).prop("selected", true);
						
						// 휴대폰 중간번호 
						$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > input[type=text]:nth-child(4)")
						.val(phoneArr[1]);
						
						// 휴대폰 끝번호
						$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > input[type=text]:nth-child(6)")
						.val(phoneArr[2]);
        				
        			} else {
        				
        				// 예약자명 
        				$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(6) > input[type=text]")
        				.val("이름을 입력해주세요.");
        				
        				//휴대폰 첫 번호
						$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > select").val("02").prop("selected", true);
						
						// 휴대폰 중간번호 
						$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > input[type=text]:nth-child(4)")
						.val("");
						
						// 휴대폰 끝번호
						$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > input[type=text]:nth-child(6)")
						.val("");
        			}
        			
        		});
        		
        		$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(6) > input[type=text]").click(function() {
        			
        			var nameCheck = $("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(6) > input[type=text]").val();
        			if(nameCheck === "이름을 입력해주세요.") {
        				$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(6) > input[type=text]").val("");
        			}
        		});
        		
        		$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(6) > input[type=text]").blur(function() {
        			
        			if($(this).val() == "") {
        				$(this).val("이름을 입력해주세요.");
        			}
        			
        		});
        		
        		// 결제하기 버튼 클릭시 이벤트
        		$("#Content > div > div.order_div > div:nth-child(3) > button").click(function() {
        			
        			var reservationName = $("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(6) > input[type=text]").val();
        			
        			var reservationPhone = $("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > select > option:checked").val() +
        			$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > input[type=text]:nth-child(4)").val() +
        			$("#Content > div > div.re_div > div:nth-child(1) > p:nth-child(7) > input[type=text]:nth-child(6)").val();
        			
        			var reservationData = "user_number=${user_num}&camp_id=${camp.camp_id}&camp_site_type=${camp_fee}&reservation_personnel=${people}" +
        								  "&start_date=${startDate}&end_date=${endDate}&user_name=" + reservationName + "&phone=" + reservationPhone +
        								  "&amount=${cost}";
        			
					$.ajax({
						
						url:"${root}/reservation/Finalpay.do",
						type:"post",
						data:reservationData,
						dataType:"text",
						success:function(data) {
							
							var success = JSON.parse(data).check;
							
							if(success == "성공") {
								alert("결제되었습니다.")
								
								var bank = $("#Content > div > div.re_div > div:nth-child(2) > div:nth-child(3) > select option:selected").val();
								var peopleName = $("#Content > div > div.re_div > div:nth-child(2) > div:nth-child(3) > input[type=text]").val();
								
							 	location.href="${root}/reservation/payInfo.do?user_name=" + reservationName + "&phone=" + reservationPhone +
												"&bank=" + bank; 
							 	
							} else {
								alert("결제되지 않았습니다.")
								location.href="${root}/search/read.do?camp-id=${camp.camp_id}";
							}
						},
						error:function(xhr, status, error) {
							alert(xhr + "," + status + "," + error);
						}	
					});  
        			
        		});
        		
        	});
        </script>
    </head>
    <body>
        <div class="container background rounded">
			
            <!-- 전체 레이아웃 div -->
            <div id="Content">
                
                <!-- 주문 / 결제 Text -->
                <h3>주문 / 결제</h3>
				
                <!-- 상품정보 -->
                <table class="table table-hover" style="text-align: center; background-color: white; border: 1px solid white;">
                    
                    <thead>
                      <tr>
                        <th style="border-right: 1px solid #dbdbdb">상품정보</th>
                        <th style="border-right: 1px solid #dbdbdb">판매자</th>
                        <th>금액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td style="border-right: 1px solid #dbdbdb"><img src="${camp.main_image}" class="rounded" alt="Cinque Terre" width="304" height="236"></td>
                        <td style="border-right: 1px solid #dbdbdb">${camp.camp_name}</td>
                        <td>${cost}원</td>
                      </tr>
                </table>
                
                <!-- 예약 및 주문 정보 -->
                <div class="pay_div">
                    <!-- 예약자 정보 및 결제 정보 -->
                    <div class="re_div">

                        <!-- 예약자 정보-->
                        <div>
                            <h3 style="display:inline">예약자 정보</h3>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" value="예약자"/><span>주문자 정보와 동일</span>
                            <br/><br/>

                            <p><span>예약자명</span>  <input type="text" value="이름을 입력해주세요."/></p>
                            <p>
                                <span>휴대폰</span>
                                <select style="display:inline;">
                                    <option value="02">02</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="031">031</option>
                                </select>
                                <span> - </span>
                                <input type="text" style="width:50px; height:26px;" maxlength="4"/>
                                <span> - </span>
                                <input type="text" style="width:50px; height:26px;" maxlength="4"/>
                            </p>
                            <p><span>기타메모</span><textarea class="form-control" rows="3" id="comment" name="text"></textarea></p>
                        </div>

                        <!-- 결제 정보 -->
                        <div>
                            <h3>결제 정보</h3>
                            <div style="border: 1px solid white;">
                                <!-- Nav pills -->
                                <ul class="nav nav-pills" role="tablist" style="border-bottom: 1px solid white;">

                                    <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#home">일반결제</a>
                                    </li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div id="home" class="container tab-pane active"><br>
                                        <div class="form-check-inline">
                                            <label class="form-check-label" for="radio1">
                                            	<input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked/>무통장입금
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="margin-top: 30px;">
                                <span>입금은행</span>&nbsp;
                                <select style="display:inline;">
                                    <option>농협은행</option>
                                    <option>국민은행</option>
                                    <option>신한은행</option>
                                    <option>우리은행</option>
                                    <option>기업은행</option>
                                    <option>KEB하나은행</option>
                                    <option>대구은행</option>
                                    <option>부산은행</option>
                                    <option>SC제일은행</option>
                                    <option>광주은행</option>
                                    <option>경남은행</option>
                                </select>
                                <br/><br/>
                                <span>입금자명</span>
                                <input type="text" style="width:70px; height:25px;" maxlength="4"/>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 주문자 정보 및 결제금액 -->
                    <div class="order_div">
                        <!-- 주문자 정보 -->
                        <div style="border-bottom: 1px solid white;">
                            <h3>주문자 정보</h3>
                            <p>박성수</p>
                            <p>akgkfk3@naver.com</p>
                            <p>010-2222-2222</p>
                        </div>

                        <!-- 결제금액 -->
                        <div style="margin-top: 30px;">
                            <h5>결제 금액</h5>
                            <h2>${cost}원</h2>
                        </div>

                        <!-- 결제하기 버튼 -->
                        <div style="margin-top: 30px; border-top: 1px solid white; padding-top: 10px;">
                        	<button type="button" class="btn btn-success" style="width:200px; height:100px; font-size: 40px;">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>