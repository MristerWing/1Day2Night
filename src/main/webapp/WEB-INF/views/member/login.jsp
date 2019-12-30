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
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
        <div class="row flex-grow">
          <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="auth-form-transparent text-left p-3">
              <div class="brand-logo">
                <img src="${root}/resources/css/member/images/logo.svg" alt="logo">
              </div>
              <h4>Welcome back!</h4>
              <h6 class="font-weight-light">Happy to see you again!</h6>
              <form class="pt-3" action="${root}/member/loginOk.do" method="POST">
                <div class="form-group">
                  <label for="email">E-mail</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="ti-user text-primary"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control form-control-lg border-left-0" name="email" id="email" placeholder="email">
                  </div>
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="ti-lock text-primary"></i>
                      </span>
                    </div>
                    <input type="password" name="password" class="form-control form-control-lg border-left-0" id="password" placeholder="Password">                        
                  </div>
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      Keep me signed in
                    </label>
                  </div>
                  <a href="#" class="auth-link text-black">Forgot password?</a>
                </div>
                <div class="my-3">
<%--                   <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="${root}/member/loginOk.do">LOGIN</a> --%>
					<input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="로그인"/>
                </div>
                <div class="mb-2 d-flex">
                	<a href="https://kauth.kakao.com/oauth/authorize?client_id=06ef11d13082c0f6655eada1dec1670a&redirect_uri=http://localhost:8181/camping/member/kakaoLogin.do&response_type=code">
					<img src="${root}/resources/images/kr_02_medium_press.png" alt="카카오 로그인"/>
					</a>&nbsp;&nbsp;
                 	</button>
<!--                   <button type="button" class="btn btn-facebook auth-form-btn flex-grow mr-1"> -->
<!--                     <i class="ti-facebook mr-2"></i>Facebook -->
<!--                   </button> -->
<!--                   <button type="button" class="btn btn-google auth-form-btn flex-grow ml-1"> -->
<!--                     <i class="ti-google mr-2"></i>Google -->
<!--                   </button> -->
                </div>
                <div class="text-center mt-4 font-weight-light">
                  가입하지 않으셨나요? <a href="${root}/member/register.do" class="text-primary">가입하기</a>
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-6 login-half-bg d-flex flex-row">
            <p class="text-white font-weight-medium text-center flex-grow align-self-end">Copyright &copy; 2018  All rights reserved.</p>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${root}/resources/css/member/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="${root}/resources/javascript/member/js/off-canvas.js"></script>
  <script src="${root}/resources/javascript/member/js/hoverable-collapse.js"></script>
  <script src="${root}/resources/javascript/member/js/template.js"></script>
  <script src="${root}/resources/javascript/member/js/todolist.js"></script>
  <!-- endinject -->
  
  <c:if test="${memberDto == null}">
		<c:if test="${login_fail == 't'}">
			<script type="text/javascript">
				alert("아이디 혹은 비밀번호를 확인해 주십시오.");
				//location.href="${root}/login.jsp";
			</script>
		</c:if>
	</c:if>
  
  <c:if test="${email_auth_status != null}">
  	<script type="text/javascript">
  		alert("이메일 인증을 하셔야 로그인 하실 수 있습니다.");
  		location.href="${root}/index.jsp";
  	</script>
  	<% session.invalidate(); %>
  </c:if>
  
  <c:if test="${register_type == 'KAKAO'}">
  	<script type="text/javascript">
  		alert("이미 카카오 연동 로그인이 되어 있습니다.");
  		location.href="${root}/index.jsp";
  	</script>
  </c:if>
</body>
</html>