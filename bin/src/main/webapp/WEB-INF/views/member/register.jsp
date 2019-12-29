<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원 가입</title>
<link rel="stylesheet" src="${root}/resources/css/member/style.css"/>

<link rel="stylesheet" href="${root}/resources/css/member/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${root}/resources/css/member/vendors/base/vendor.bundle.base.css">
<link rel="shortcut icon" href="${root}/resources/css/member/images/favicon.png" />
<script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
<%-- <script type="text/javascript" src="${root}/resources/javascript/member/member.js"></script> --%>
<%-- <script src="${root}/resources/css/member/vendors/base/vendor.bundle.base.js"></script> --%>
<script src="${root}/resources/javascript/member/js/off-canvas.js"></script>
<script src="${root}/resources/javascript/member/js/hoverable-collapse.js"></script>
<script src="${root}/resources/javascript/member/js/template.js"></script>
<script src="${root}/resources/javascript/member/js/todolist.js"></script>
<script type="text/javascript">

var emailCheck = 0;
var passwordEqual = 0;

	function emailDupCheck(){
		var email = $("#email").val();
		console.log(email);
		
		$.ajax({
			data:{email:email},
			url:'${root}/member/emailDupCheck.do',
			type: 'post',
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data));
				if(email==""){
					$("#submit").prop("disabled", true);
					$("#email_check").text("이메일을 입력해주세요");
					emailCheck = 0;
				} else if($.trim(data) == -1){
					$("#email_check").css("color", "red");
					$("#email_check").text("이메일 형식에 맞지 않습니다. (xxx~@yyyy~.zzz)");
				} else if($.trim(data) == 0){
					$("#email").css("background-color", "#B0F6AC");
					$("#email_check").css("color", "green");
					$("#email_check").text("사용 가능한 이메일입니다.");
					emailCheck = 1;
					if(emailCheck==1 && passwordEqual == 1){
						$("#submit").prop("disabled", false);
						$("#submit").css("background-color", "#4CAF50");
					}
				} else if($.trim(data) == 1){
					$("#submit").prop("disabled", true);
					$("#submit").css("background-color", "#AAAAAA");
					$("#email").css("background-color", "#FFCECE");
					$("#email_check").text("이미 사용중인 이메일입니다.");
					$("#email_check").css("color", "red");
					emailCheck=0;
				}
			}, error:function(){
				alert("error");
			}
		});
	}

	$(function(){
		$("#password-equals-true").hide();
		$("#password-equals-false").hide();
		$("input").keyup(function(){
			var password = $("#password").val();
			var passwordCheck =$("#passwordCheck").val();
			if(password != ""){
				if(passwordCheck == "") {
					$("#password-equals-true").hide();
					$("#password-equals-false").hide();
				} else if(password == passwordCheck){
					$("#password-equals-true").show();
					$("#password-equals-false").hide();
					$("#submit").removeAttr("disabled");
					passwordEqual = 1;
				} else if(password != passwordCheck) {
					$("#password-equals-true").hide();
					$("#password-equals-false").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
// 			if(password != "" || passwordCheck != ""){
				
// 				if(password == passwordCheck){
// 					$("#password-equals-true").show();
// 					$("#password-equals-false").hide();
// 					$("#submit").removeAttr("disabled");
// 				} else {
// 					$("#password-equals-true").hide();
// 					$("#password-equals-false").show();
// 					$("#submit").attr("disabled", "disabled");
// 				}
// 			}
		});
	});
	
	function passwordCheckm(){
		var password=$("#password").val();
		var email = $("#email").val();
		console.log(email);
		console.log(password);
// 		$("#password-type-false").hide();
		$.ajax({
			type:'POST',
			url: '${root}/member/passwordCheck.do',
			data: { password: password, email:email},
			dataType: 'json',
			success:function(data){
				if(data == 0){
					$("#password-type-false").text("비밀번호는 공백없이 11자 이상 20자 이하로 특수문자 1개, 숫자 1개, 대문자가 1개가 포함되어야 합니다.");
				} else if(data == -1){
					$("#password-contains-email").text("비밀번호에 이메일이 포함되면 쉽게 개인 정보가 유출될 수 있습니다.");
					if($("#password").val()=="") {
						$("#password-contains-email").text("");
					}
					
				} else if(data == -2){
					$("#password-contains-email").text("비밀번호에 공백이 포함될 수 없습니다.");
					$("#password-contains-email").css("color", "pink");
				} else if(data == 1){
					$("#password-contains-email").text("사용가능한 비밀번호입니다.");
					$("#password-contains-email").css("color", "green");
				}
			},
			error:function(request, status){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
// 	$("#email").blur(function(){
// 		var email = $("#email").val();
		
// 		$.ajax({
// 			url : '${root}/member/emailDupCheck.do?email='+email,
// 			type: 'get',
// 			success: function(data){
// 				console.log("중복=1 / 안중복=0 : "+data);
				
// 				if(data==1){
// 					//1:이메일이 중복인 경우
// 					$("#email_check").text("이미 사용중인 이메일입니다.");
// 					$("#email_check").css("color", "red");
// 					$("#submit").attr("disabled", true);
// 				} else{
// 					if(email==""){
// 						$("#email_check").text("아이디를 입력해 주세요");
// 						$("#email_check").css("color", "red");
// 						$("#submit").attr("disabled", true);
// 					}
// 				}
// 			}, error: function(){
// 				console.log("실패");
// 			}
// 		});
// 	});
	
</script>
</head>
<body>

  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
        <div class="row flex-grow">
          <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="auth-form-transparent text-left p-3">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
              </div>
              <h4>New here?</h4>
              <h6 class="font-weight-light">Join us today! It takes only few steps</h6>
              <form class="pt-3" action="${root}/member/registerOk.do" method="POST">
                
                <div class="form-group">
                  <label>Email</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="ti-email text-primary"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control form-control-lg border-left-0" placeholder="Email" name="email" id="email" oninput="emailDupCheck()" maxlength="320">
<!--                     <div style="color:red" class = "alert email-duplicate-true" id="email-duplicate-true">중복된 이메일 입니다.</div> -->
<!--                     <div style="color:blue" class= "alert email-type-true" id="email-type-true">이메일 형식에 맞습니다.</div> -->
<!--                     <div style="color:yellow" class="alert email-type-false" id="email-type-false">이메일 형식에 맞지 않습니다.</div> -->
					<div id="email_check"></div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label>Password</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="ti-lock text-primary"></i>
                      </span>
                    </div>
                    <input type="password" class="form-control form-control-lg border-left-0" id="password" name="password" placeholder="password" oninput="passwordCheckm()" maxlength="20"/><br/>
                    <input type="password" class="form-control form-control-lg border-left-0" id="passwordCheck" name="passwordCheck" placeholder="passwordCheck" maxlength="20"/><br/>
                    <div style="color:green" class="alert password-equals-true" id="password-equals-true">비밀번호가 일치합니다.</div>
                    <div style="color:red" class="alert password-equals-false" id="password-equals-false">비밀번호가 일치하지 않습니다.</div>
                    <div style="color:violet" class="alert password-contains=email" id="password-contains-email"></div>
                    <div style="color:green" class="alert password-type-true" id="password-type-true"></div>
                    <div class="alert password-type-false" id="password-type-false"></div>
                    <input type="submit" id="submit" class="form-control form-control-lg border-left-0" value="가입하기" disabled/>           
                  </div>
                </div>
                <div class="mb-4">
                  
                </div>
                <div class="mt-3">
<!--                   <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN UP</a> -->
                </div>
                <div class="text-center mt-4 font-weight-light">
                  이미 가입한 계정이 있으신가요? <a href="${root}/member/login.do" class="text-primary">로그인</a>
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-6 register-half-bg d-flex flex-row">
            <p class="text-white font-weight-medium text-center flex-grow align-self-end">Copyright &copy; 2018  All rights reserved.</p>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

<c:if test="${register_type != null}">
	<c:if test="${register_type == 'KAKAO'}">
		<script type="text/javascript">
			alert("이미 같은 이메일을 사용하는 카카오 계정이 있습니다.");
		</script>
	</c:if>
</c:if>
<c:if test="${isNewMember != null}">
	<c:if test="${isNewMember == 'f'}">
		<script type="text/javascript">
			alert("이미 같은 이메일을 사용하는 계정이 있습니다.");
		</script>
	</c:if>
</c:if>
</body>

</html>