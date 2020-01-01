<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>ODTN</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<style>
			.background {
				background-color:#dbdbdb;
			}
			
			#order > div {
				overflow:hidden;
			}
			
			#order h3 {
				float:left;
			}
			
			.or_no, .or_info, .pay_info {
				margin-top:30px;
				border-bottom: 1px solid white;
			}

			#order > div > div {
				margin-left:200px;
			}
		</style>
		<script>
			$(function() {
				
				$("body > div > div.container.background > button").click(function() {
					
					location.href="${root}/search/list.do";
				});
			});
		</script>
	</head>
	<body>
		<div class="container background">
		    <h1>주문이 확인되었습니다.</h1>
		
		    <!-- 주문정보 -->
		    <div id="order" style="overflow: hidden;">
		
		      <!-- 주문번호 -->
		      <div class="or_no">
		        <h3>주문번호</h3>
		        <div>
		          <p>20200101131324184</p>
		        </div>
		      </div>
		
		      <!-- 주문자정보 -->
		      <div class="or_info">
		        <h3>주문자정보</h3>
		        <div>
		          <p>${user_name}</p>
		          <p>${phone}</p>
		        </div>
		      </div>
		
		      <!-- 결제정보 -->
		      <div class="pay_info">
		        <h3>결제정보</h3>
		        <div>
		          <p>무통장입금</p>
		          <p>입금은행 : ${bank}(933502-00-412333)</p>
		          <p>예금주 : 1Day2Night</p>
		          <p>입금기한 : 2020.01.16</p>
		        </div>
		      </div>
		    </div>
		    <button type="button" class="btn btn-primary" style="margin-top: 20px; width:200px; height:100px; font-size: 40px;">홈 가기</button>
	 	</div>
	</body>
</html>