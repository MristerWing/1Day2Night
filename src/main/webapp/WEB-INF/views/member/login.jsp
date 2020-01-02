<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Login</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${root}/resources/css/member/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${root}/resources/css/member/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${root}/resources/css/member/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${root}/resources/css/member/images/favicon.png" />
  <script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
  <script type="text/javascript">
  	$(function(){
  		
  		$("#email").focusout(function() {
  			
  			var emailCheck = $("#email").val();
  			
  			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  			
  			if(emailCheck.match(regExp) != null) {
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(1) > div > i").show();
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(1) > div.alert.alert-danger.alert-dismissible.fade.show").hide();
  			} else {
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(1) > div.alert.alert-danger.alert-dismissible.fade.show").show();
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(1) > div > i").hide();
  			}
  			
  		});
  		
  		$("#password").focusout(function() {
  			
  			var pwdCheck = $("#password").val();
  			
  			if(pwdCheck == "") {
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(2) > div.alert.alert-danger.alert-dismissible.fade.show").show();
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(2) > div.input-group > i").hide();
  			} else {
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(2) > div.alert.alert-danger.alert-dismissible.fade.show").hide();
  				$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(2) > div.input-group > i").show();
  			}
  			
  		});

  		// 카카오 로그인
  		$("body > div > div.container > div:nth-child(2) > form > ul > li:nth-child(4) > button").click(function() {
  			
  			location.href="https://kauth.kakao.com/oauth/authorize?client_id=06ef11d13082c0f6655eada1dec1670a&redirect_uri=http://localhost:8181/camping/member/kakaoLogin.do&response_type=code";
  			
  		});
  		
	  	$("body > div > div.container > div:nth-child(2) > form").submit(function(event) {
	  		
			var emailCheck = $("#email").val();
  			
  			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  		
  			var pwdCheck = $("#password").val();
  			
	  		if (emailCheck.match(regExp) != null && pwdCheck != "") {
	  			
	  		} else  {
	  			event.preventDefault();
	  		}
	  	});
  	})
  	
  </script>
</head>

<body>

	<div class="container">
		
		<!-- Header -->
		<div style="text-align:center; margin-top:15px;">
			<h3>로그인</h3>
			<span>고캠핑의 다양한 서비스와 혜택을 누리세요.</span>
		</div>
		
		<!-- Login Form -->
		<div align="center" style="margin: 15px 0px 15px;">
			<form action="${root}/member/loginOk.do" method="post" style="width:500px; border: 1px solid #dedede;">
				<ul style="list-style:none; margin-top:15px;">
					<!-- ID -->
					<li>
	                 	<div class="input-group" style="width:354px; height:50px; vertical-align: middle;">
		                    <div class="input-group-prepend bg-transparent">
			                    <span class="input-group-text bg-transparent border-right-0">
			                  	  <i class="ti-user text-primary"></i>
			                    </span>
		                    </div>
		                    <input type="text" class="form-control form-control-lg border-left-0" name="email" id="email" placeholder="email"/>
							<i class="fa fa-check" aria-hidden="true" style="margin-top: 23px; margin-left:10px; color:green; display:none;"></i>
	                  	</div>
	                  	<div class="alert alert-danger alert-dismissible fade show" style="width:354px; margin-top:15px; display:none;">
							<strong>이메일 형식이 틀렸습니다.</strong>
						</div>
					</li>
					
					<!-- PWD -->
					<li style="margin-top:15px;">
	                	<div class="input-group" style="width:354px; height:50px;">
		                    <div class="input-group-prepend bg-transparent">
			                    <span class="input-group-text bg-transparent border-right-0">
			                    	<i class="ti-lock text-primary"></i>
			                    </span>
		                    </div>
		                    <input type="password" name="password" class="form-control form-control-lg border-left-0" id="password" placeholder="Password">                        
	                  		<i class="fa fa-check" aria-hidden="true" style="margin-top: 23px; margin-left:10px; color:green; display:none;"></i>
	                  	</div>
	                  	<div class="alert alert-danger alert-dismissible fade show" style="width:354px; margin-top:15px; display:none;">
							<strong>비밀번호를 입력해주세요.</strong>
						</div>
					</li>
					<!-- Login -->
					<li style="margin-top:15px;">
						<input style="width:354px;height:50px;" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" id="submit" value="로그인"/>
					</li>
					
					<!-- KaKao Login -->
					<li style="margin-top:15px;">
						<button type="button" class="btn btn-warning" style="width:354px; height:50px;">
							<i class="fa fa-comment" aria-hidden="true"></i> 카카오로 로그인
						</button>
					</li>
					
					<!-- Register -->
					<li style="margin-top:15px;">
						가입하지 않으셨나요? <a href="${root}/member/beforeRegister.do" class="text-primary">가입하기</a>
					</li>
				</ul>
			</form>
		</div>
		
	</div> 
  	
  	<c:if test="${login_fail == 't'}">
  		<script>
  			alert("아이디 혹은 비밀번호가 틀렸습니다.");
  		</script>
  	</c:if>
  	
	<%-- <c:if test="${email_auth_status != null}">
		<script type="text/javascript">
			alert("이메일 인증을 하셔야 로그인 하실 수 있습니다.");
			location.href="${root}/index.jsp";
		</script>
		<% session.invalidate(); %>
	</c:if> --%>
  
  	<c:if test="${register_type == 'KAKAO'}">
	  	<script type="text/javascript">
		  	alert("이미 카카오 연동 로그인이 되어 있습니다.");
		  	location.href="${root}/index.jsp";
	  	</script>
  	</c:if>
</body>
</html>