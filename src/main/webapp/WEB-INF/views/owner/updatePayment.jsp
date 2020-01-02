<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.payAppend {
		float: right;
		height: 35px;
		width: 35px;
		color: white;
		margin: 0 10px;
	}
	.appendArea {
		margin: 10px 0;
		overflow: hidden;
	}
	.indexArea {
		min-height: 1000px;
		overflow: hidden;
	}
</style>
</head>
<body>
	<div class="container">
		<script type="text/javascript">
			var indexCount = ${paymentList.size()};
		</script>
		<div class="appendArea">
			<h5>캠핑장 요금 수정</h5>
			<button id="plusIndex" class="btn btn-info payAppend" style="width: 180px;">
				항목 추가하기
				<i class="fa fa-plus" aria-hidden="true"></i>
			</button>
			<script type="text/javascript">
				$("#plusIndex").click(function() {
					$("#indexArea").append(
						"<div class='payment'>" + 
						"<span class='title'>" + 
						"<i class='fa fa-flag' aria-hidden='true'" + 
						"style='color: royalblue;'></i>" + 
						"<input type='text' name='fee" + indexCount + "'>" +
						"<button class='btn btn-info payAppend minusIndex' onclick='removeIndex(this)'>" +
						"<i class='fa fa-minus' aria-hidden='true'></i>" +
						"</button>" +
						"</span>" +
						"<table class='table'>" +
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
						"<td><input type='text' name='normal_season_weekdays_fee" + indexCount + "'></td>" +
						"<td><input type='text' name='normal_season_holidays_fee" + indexCount + "'></td>" +
						"<td><input type='text' name='peak_season_weekdays_fee" + indexCount +"'></td>" + 
						"<td><input type='text' name='peak_season_holidays_fee" + indexCount + "'></td>" +
						"<td><input type='text' name='day_accept_member" + indexCount + "'></td>" +
						"</tr>" +
						"</tbody>" +	
						"</table>" +
						"</div>"
					);
					indexCount++;
				});
			</script>
		</div>
		<div id="indexArea">
			<c:forEach var="paymentDto" items="${paymentList}" varStatus="status">
				<div class="payment">
					<span class="title"> <i class="fa fa-flag" aria-hidden="true"
						style="color: royalblue;"></i> 
						<input type="text" name="fee${status.index}" value="${paymentDto.fee_name}">
						<button class="btn btn-info payAppend minusIndex" onclick="removeIndex(this)">
							<i class="fa fa-minus" aria-hidden="true"></i>
						</button>
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
								<td><input type="text" name="normal_season_weekdays_fee${status.index}" value="${paymentDto.normal_season_weekdays_fee}"></td>
								<td><input type="text" name="normal_season_holidays_fee${status.index}" value="${paymentDto.normal_season_holidays_fee}"></td>
								<td><input type="text" name="peak_season_weekdays_fee${status.index}" value="${paymentDto.peak_season_weekdays_fee}"></td>
								<td><input type="text" name="peak_season_holidays_fee${status.index}" value="${paymentDto.peak_season_holidays_fee}"></td>
								<td><input type="text" name="day_accept_member${status.index}" value="${paymentDto.day_accept_member}"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>
		</div>
		<div class="buttonArea">
			<button class="btn btn-primary" style="float: right;">수정확인</button>
		</div>
		<script type="text/javascript">
			function removeIndex(index) {
				$(index).parent().parent().remove();
			}
		</script>
	</div>
</body>
</html>