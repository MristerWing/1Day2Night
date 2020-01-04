<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원 가입 방법 선택</title>
	<script type="text/javascript">
		$(function(){
			$("body > div > div.container > div:nth-child(2) > ul > li:nth-child(1) > button").click(function() {
				location.href="${root}/member/privacyPolicyAgreement.do";
			});
			
			$("body > div > div.container > div:nth-child(2) > ul > li:nth-child(2) > button").click(function() {
				location.href="https://kauth.kakao.com/oauth/authorize?client_id=06ef11d13082c0f6655eada1dec1670a&redirect_uri=http://192.168.14.30:8181/camping/member/kakaoLogin.do&response_type=code";
			});
		})
	</script>
	</head>
	<body>
		<div class="container" style="margin-top:20px; margin-bottom:20px;">
		
			<div style="text-align:center; border-top:1px solid #dedede;">
				<h2 style="margin-top:30px;">회원가입</h2>
				<span>회원가입을 하시면 다양한 서비스와 이벤트를 확인하실 수 있습니다.</span>
			</div>
		
			<div style="text-align:center; border: 1px solid #dedede; margin-top:20px;">
				<p>
					<i class="fa fa-shield" aria-hidden="true" style="font-size:7em; margin-top:30px;"></i>
				</p>
				<h6 style="margin-top:10px;">이메일과 SNS으로 간편하게 가입하고 편리하게 사용하세요.</h6>
				<br/>
				<span>
					ODTN 은 무료 회원제 입니다.<br/>
					아래의 회원가입 방식 중 하나를 선택해 주세요.
				</span>
				<ul style="list-style: none; overflow:hidden; margin-top:20px;">
					<!-- 이메일로 회원가입 -->
					<li style="float:left; margin-left:150px;">
						<button type="button" class="btn btn-secondary" style="width:400px; height:50px;">
							<i class="fa fa-envelope-o" aria-hidden="true"></i>   이메일로 가입
						</button>
					</li>
					
					<!-- 카카오로 로그인 -->
					<li style="float:left; margin-left:10px;">
						<button type="button" class="btn btn-warning" style="width:400px; height:50px;">
							<i class="fa fa-comment" aria-hidden="true"></i> 카카오로 가입
						</button>
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>