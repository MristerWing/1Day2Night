<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
 
</head>
<link rel="stylesheet" href="${root}/resources/css/styles/footer.css">

<body>
    <!-- copyright -->
   <!--footer -->
	<footer>
	<script type="text/javascript">
	$( document ).ready( function() {
		$( window ).scroll( function() { 
			if ( $( this ).scrollTop() > 200 ) { 
				$( '.btn_top' ).fadeIn(); 
			} 
			else { 
				$( '.btn_top' ).fadeOut(); 
				} 
			} ); 
		
		$( '.btn_top' ).click( function() { 
			$( 'html, body' ).animate( { scrollTop : 0 }, 400 ); 
			return false; 
			} ); 
		} );
	 
	function makeBold(){
		document.getElementById("btn").style.color="red";
		
	}
	function makeOut() {
		document.getElementById("btn").style.color="white";
	}
	</script>
		<div class="f_info_w">
		<div class="layout">
			<div class="f_logo">
				<span>ODTN</span>
			</div>
			<ul class="f_menu" style="float: left;">
				<li class="privacy"><a href="#" onclick="return false">개인정보처리방침</a></li>
				<li><a href="#" onclick="return false">전자우편무단수집거부</a></li>
				<li><a href="${root}/owner/login.do">캠핑장 등록안내</a></li>
				<li><a href="${root}/admin/adminCheck.do" id="btn" onmouseover="makeBold()" onmouseout="makeOut()">관리자 페이지</a></li>
			</ul>
			
			<div class="btn_top">상단으로</div>
		</div>
	</div>
	</footer>
	<!-- //footer -->
	<!-- copyright -->
	<div class="f_link_w">
		
		<div class="layout">
			<!--하단주소-->
			<div class="f_addr">
				<div class="addr">
					<div>서울특별시 구로구 구로동 디지털로34길 43 한국관광공사</div>
					<div>TEL : 02-0000-0000</div>
					<div>EMAIL : <a href="mailto:webmaster@gocamping.or.kr" class="f_mail">KITRI@Camping.or.kr</a></div>
				</div>
				<p class="copyright">
					Copyrights(c) 2020 <span>KOREA TOURISM ORGANIZATION</span> ALL RIGHTS RESERVED.
				</p>
			</div>
			<!--//f_addr-->
			<!--//하단주소--> 
			<script type="text/javascript">
			$(document).ready(function() {
				// 하단 관련사이트 슬라이드
				$("#myDropdown").hide();
				$(".dropbtn").click(function() {
					$("#myDropdown").slideToggle(500);
				});

			});
			</script>
			<div class="f_link"> 
				<div class="dropdown">
					<button class="f_link_tt dropbtn" onclick="myFunction()">관련사이트</button>
					<div id="myDropdown" class="dropdown-content" style="display: none;">
						<a href="http://kto.visitkorea.or.kr/kor.kto" target="_BLANK">한국관광공사</a>
						<a href="http://korean.visitkorea.or.kr/kor/bz15/addOn/main/publish/index.jsp" target="_BLANK">대한민국 구석구석</a>
						<a href="http://www.durunubi.kr/" target="_BLANK">두루누비</a>
						<a href="http://www.smartoutbound.or.kr/main/main.do" target="_BLANK">지구촌스마트여행</a>
						<a href="http://korean.visitkorea.or.kr/kor/tt/pr_gallery/new_photo_gallery/main/main.jsp" target="_BLANK">관광사진 갤러리</a>
					  </div>
				</div>
			</div>
			<!--//f_link-->
			 
		</div>
	</div>
	<!-- //copyright -->
    <!-- //copyright -->

</body>

</html>
