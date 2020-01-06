<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy년MM월dd일" var="today" />
	<div id="payment" class="container" style="min-height: 600px;">
		<h3 style="float: right; margin: 20px 0; display: block;">${memberDto.user_name}님의
			예약내역입니다.</h3>
		<br />
		<h5>이전예약 내역</h5>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>#</th>
					<th>예약자명</th>
					<th>예약자번호</th>
					<th>인원</th>
					<th>캠핑명</th>
					<th>예약등록일</th>
					<th>예약 시작일</th>
					<th>예약 종료일</th>
					<th>금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reservationList}" var="reservation"
					varStatus="status">
					<fmt:formatDate value="${reservation.start_date}"
						pattern="yyyy년MM월dd일" var="startDate" />
					<c:if test="${startDate <= today}">
						<tr>
							<td>${status.index+1}</td>
							<td>${reservation.user_name}</td>
							<td>${reservation.phone}</td>
							<td>${reservation.reservation_personnel}</td>
							<td>${reservation.camp_site_type}</td>
							<td><fmt:formatDate value="${reservation.register_date}"
									pattern="yyyy년MM월dd일" /></td>
							<td>${startDate}</td>
							<td><fmt:formatDate value="${reservation.end_date}"
									pattern="yyyy년MM월dd일" /></td>
							<td>${reservation.amount}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<h5 style="margin: 10px 0;">예약내역(클릭시 선택됩니다.)</h5>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>#</th>
					<th>예약자명</th>
					<th>예약자번호</th>
					<th>인원</th>
					<th>캠핑명</th>
					<th>예약등록일</th>
					<th>예약 시작일</th>
					<th>예약 종료일</th>
					<th>금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reservationList}" var="reservation"
					varStatus="status">
					<fmt:formatDate value="${reservation.start_date}"
						pattern="yyyy년MM월dd일" var="startDate" />
					<c:if test="${startDate > today}">
						<tr role="button" style="cursor: pointer;" class="over_res" onclick="reservationFunc()">
							<td>${reservation.reservation_id}</td>
							<td>${reservation.user_name}</td>
							<td>${reservation.phone}</td>
							<td>${reservation.reservation_personnel}</td>
							<td>${reservation.camp_site_type}</td>
							<td><fmt:formatDate value="${reservation.register_date}"
									pattern="yyyy년MM월dd일" /></td>
							<td>${startDate}</td>
							<td><fmt:formatDate value="${reservation.end_date}"
									pattern="yyyy년MM월dd일" /></td>
							<td>${reservation.amount}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
			function reservationFunc() {
				$(".over_res").click(function() {
					$(this).css("background-color", "royalblue");
					$(this).css("color", "white");
					$(this).addClass("select_res");
				});

				$(".select_res").click(function() {
					$(this).css("background-color", "white");
					$(this).css("color", "black");
					$(this).removeClass("select_res");
				});
			}
		</script>
		<div style="float: right;">
			<button
				onclick="deleteRes()"
				class="btn btn-primary">예약취소</button>
			<script type="text/javascript">
				function deleteRes() {
					var str = "";
					$(".select_res").each(function () {
						str += $(this).children().eq(0).text() + ",";
					});
					location.href='${root}/reservation/delete.do?user_num=${memberDto.user_num}&deleteList='+str;
					//console.log('${root}/reservation/update.do?user_num=${user_num}&deleteList='+str);
				}
			</script>
		</div>
	</div>
</body>
</html>