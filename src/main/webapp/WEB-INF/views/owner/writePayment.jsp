<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/owner/payment.css" />
</head>
<body>
	<div class="container">
		<script type="text/javascript">
			var indexCount = 0;
		</script>
		<div class="appendArea">
			<h5>캠핑장 요금 입력</h5>
			<button id="plusIndex" class="btn btn-info payAppend" style="width: 180px;">
				항목 추가하기
				<i class="fa fa-plus" aria-hidden="true"></i>
			</button>
			<script type="text/javascript">
				$("#plusIndex").click(function() {
					$("#indexArea").append(
						"<div class='payment'>" +
						"<input type='hidden' name='searchPaymentDtoList[" + indexCount + "].camp_id' value='${camp_id}'>" +
						"<span class='title'>" + 
						"<i class='fa fa-flag' aria-hidden='true'" + 
						"style='color: royalblue;'></i>" + 
						"<input type='text' name='searchPaymentDtoList[" + indexCount + "].fee_name'>" +
						"<button class='btn btn-info payAppend minusIndex' onclick='removeIndex(this)'>" +
						"<i class='fa fa-minus' aria-hidden='true'></i>" +
						"</button>" +
						"</span>" +
						"<table class='table table-sm'>" +
						"<thead class='thead-dark'>" +
						"<tr>" +								
						"<th>평상시 주중</th>" +
						"<th>평상시 주말</th>" +
						"<th>성수기 주중</th>" +
						"<th>성수기 주말</th>" +
						"<th>하루수용인원</th>" +
						"</tr>" +
						"</thead>" +
						"<tbody>" +
						"<tr>" +		
						"<td><input type='text' name='searchPaymentDtoList[" + indexCount + "].normal_season_weekdays_fee'></td>" +
						"<td><input type='text' name='searchPaymentDtoList[" + indexCount + "].normal_season_holidays_fee'></td>" +
						"<td><input type='text' name='searchPaymentDtoList[" + indexCount + "].peak_season_weekdays_fee'></td>" + 
						"<td><input type='text' name='searchPaymentDtoList[" + indexCount + "].peak_season_holidays_fee'></td>" +
						"<td><input type='text' name='searchPaymentDtoList[" + indexCount + "].day_accept_member'></td>" +
						"</tr>" +
						"</tbody>" +	
						"</table>" +
						"</div>"
					);
					indexCount++;
				});
			</script>
		</div>
		<form action="${root}/owner/writePaymentOk.do" method="POST">
			<div id="indexArea">
			</div>
			<div class="buttonArea">
				<input type="submit" class="btn btn-primary" value="확인" style="float: right;">
			</div>
		</form>
		<script type="text/javascript">
			function removeIndex(index) {
				$(index).parent().parent().remove();
			}
		</script>
	</div>
</body>
</html>