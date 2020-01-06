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
<%-- <script type="text/javascript" src="${root}/resources/javascript/member/member.js"></script> --%>
<%-- <script src="${root}/resources/css/member/vendors/base/vendor.bundle.base.js"></script> --%>
<script src="${root}/resources/javascript/member/js/off-canvas.js"></script>
<script src="${root}/resources/javascript/member/js/hoverable-collapse.js"></script>
<script src="${root}/resources/javascript/member/js/template.js"></script>
<script src="${root}/resources/javascript/member/js/todolist.js"></script>
<script type="text/javascript">
	
	var emailCheck = 0;
	var passwordEqual = 0;
	var passwordBoolean = false;
	var userNameCheck = false;
	var phoneNumCheck = false;
	
	// 비밀번호 유효성 검사
	function passwordCheckm() {
		var password=$("#password").val();
		var email = $("#email").val();
		console.log(email);
		console.log(password);
// 		$("#password-type-false").hide();
		$.ajax({
			type:'POST',
			url: '${root}/member/passwordCheck.json',
			data: { password: password, email:email},
			dataType: 'json',
			success:function(data){
				
				if(data == 0) {
					$("#password_check").text("비밀번호 형식이 틀립니다.")
					$("#password_check").css("color","red");
					$("#submit").prop("disabled", true);
					passwordBoolean = false;
					
				} else if(data == -1){
					$("#password_check").text("비밀번호에 Email이 포함되어 있습니다.")
					$("#password_check").css("color","red");
					passwordBoolean = false;
					$("#submit").prop("disabled", true);
					/* if(password == "") {
						passwordCheckTxt2.innerHTML="";
						$("#submit").prop("disabled", true);
						passwordBoolean = false;
					} 
					if(passwordCheckTxt4 != ""){
						passwordCheckTxt4.innerHTML="";
						$("#submit").prop("disabled", true);
						passwordBoolean = false;
					} */
					
				} else if(data == -2){
					$("#password_check").text("비밀번호에 공백이 포함되어 있습니다")
					$("#password_check").css("color","red");
					$("#submit").prop("disabled", true);
					
					/* if(password==""){
						passwordCheckTxt3.innerHTML ="";
					}
					if(passwordCheckTxt4 != ""){
						passwordCheckTxt4.innerHTML = "";
						$("#submit").prop("disabled", true);
						passwordBoolean = false;
					} */
				} else if(data == 1){
					$("#password_check").text("사용가능한 비밀번호입니다.")
					$("#password_check").css("color","green");
					
					passwordBoolean=true;
					passwordEqual = passwordEqual+1;
					/* if(emailCheck==1 && passwordCheck>1 && passwordBoolean == true){ 
						if(userNameCheck ==true && phoneNumCheck==true){
							$("#submit").prop("disabled", false);
						}
					} */
				}
			},
			error:function(request, status){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}
	
	// 이메일 유효성 검사
	function emailDupCheck() {
		var email = $("#email").val();
		console.log(email);
		
		$.ajax({
			data:{email:email},
			url:'${root}/member/emailDupCheck.json',
			type: 'post',
			dataType: 'json',
			success: function(data){
				//alert(JSON.stringify(data));
				if(email==""){
					$("#submit").prop("disabled", true);
					$("#email_check").css("color","black");
					$("#email_check").text("Email을 입력해주세요");
					emailCheck = 0;
				} else if($.trim(data) == -1){
					$("#email_check").text("Email 형식이 틀립니다.");
					$("#email_check").css("color","red");
					$("#submit").prop("disabled", true);
					emailCheck = 0;
				} else if($.trim(data) == 0){
					$("#email_check").css("color", "green");
					$("#email_check").text("사용 가능한 Email입니다. ");
					emailCheck = 1;
					/* if(emailCheck==1 && passwordEqual>1 && passwordBoolean == true
							&& userNameCheck == true && phoneNumCheck == true){
						$("#submit").prop("disabled", false);
					} */
				} else if($.trim(data) == 1){
					$("#submit").prop("disabled", true);
					$("#email_check").text("사용 중인 Email입니다.");
					$("#email_check").css("color", "red");
					emailCheck=0;
				}
			}, error:function(){
				alert("emailDupCheck() error");
			}
		});
	}
	
	$(function() {
		$('[data-toggle="tooltip"]').tooltip();
		
		// 비밀번호 일치여부
		$("input").keyup(function(){
			var password = $("#password").val();
			var passwordCheck =$("#passwordCheck").val();
			if(password != ""){
				if(passwordCheck == "") {
					$("#password_equal").text("비밀번호가 일치하지 않습니다.");
					$("#password_equal").css("color","red");
					passwordEqual = 0;
					$("#submit").prop("disabled", true);
					
				} else if(password == passwordCheck && passwordBoolean == true){
					$("#password_equal").text("비밀번호가 일치합니다.");
					$("#password_equal").css("color","green");
					passwordEqual = passwordEqual+1;
					/* if(emailCheck == 1 && passwordEqual > 1 && passwordBoolean==true){
						if(userNameCheck==true && phoneNumCheck==true){
							$("#submit").removeAttr("disabled");	
						}
					} */
				} else if(password != passwordCheck) {
					$("#password_equal").text("비밀번호가 일치하지 않습니다.");
					$("#password_equal").css("color","red");
					$("#submit").prop("disabled", true);
					passwordEqual = 0;
				}
			}
			if(password != "" || passwordCheck != ""){
				
				if(password == passwordCheck && passwordBoolean == true){
					$("#password_equal").text("비밀번호가 일치합니다.");
					$("#password_equal").css("color","green");
					passwordEqual = 1;
				} else {
					$("#password_equal").text("비밀번호가 일치하지 않습니다.");
					$("#password_equal").css("color","red");
					$("#submit").prop("disabled", true);
					passwordEqual = 0;
				}
			}
		});

		$("#user_name").on('keyup', function(event){
			user_name = $("#user_name").val();
			console.log(user_name);
			if(user_name == ""){
				$("#user_name_check").css("color", "red");
				$("#user_name_check").text("이름을 입력해 주세요");
				userNameCheck=false;
				$("#submit").prop("disabled", true);
			} 
			if(user_name.length == 1){
				$("#user_name_check").css("color", "red");
				$("#user_name_check").text("이름을 2자 이상 써주십시오");
				userNameCheck=false;
				$("#submit").prop("disabled", true);
			} else if(user_name.length>1){
				$("#user_name_check").css("color", "green");
				$("#user_name_check").text("사용 가능한 이름입니다.");
				userNameCheck=true;
			}
		});
	
	
	
		$("#phone_num").on('keyup', function(event){
			//숫자만 입력되게하기
// 			var reg_num = /^[0-9]}*$/;
// 			var reg_num = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			var reg_num = /^[0-9]{10,13}$/;

			var phone_num = $("#phone_num").val();
			
			// 휴대폰 유효성 검사
			if(phone_num == ""){
				$("#phone_check").text("번호를 입력해주세요.");
				$("#phone_check").css("color","red");
				phoneNumCheck=false;
				$("#submit").prop("disabled", true);
			}
			if(reg_num.test(phone_num)==false){
				console.log("숫자만 입력하세요");
				$("#phone_num").val(phone_num.replace(/[^0-9]/g,""));
				$("#phone_check").css("color", "red");
				$("#phone_check").text("숫자만 입력해 주세요");
				phoneNumCheck=false;
				$("#submit").prop("disabled", true);
			} 
			if(phone_num.length>0 && phone_num.length<10){
				$("#phone_check").css("color", "red");
				$("#phone_check").text("번호 길이를 다시 확인해 주세요.");
				phoneNumCheck=false;
				$("#submit").prop("disabled", true);
			}
			if(phone_num.length >= 10 && phone_num.length <= 11){
				$("#phone_check").css("color", "green");
				$("#phone_check").text("사용 가능한 번호입니다.");
				phoneNumCheck=true;
			} 
		});
		
// 		$("body > div > div.container > div:nth-child(2) > form > table > tbody input").focusout(function() {
// 			if(emailCheck==1 && passwordEqual == 1 && passwordBoolean == true
// 					&& userNameCheck == true && phoneNumCheck == true){
				
// 				$("#submit").prop("disabled", false);
// 			}
// 		});
		
		$("body > div > div.container > div:nth-child(2) > form > table > tbody input").on('keyup', function(event) {
			if(emailCheck==1 && passwordEqual == 1 && passwordBoolean == true
					&& userNameCheck == true && phoneNumCheck == true){
				
				$("#submit").prop("disabled", false);
			}
		});
		
	});
</script>
<style>
	body > div > div.container > div:nth-child(2) > form > table > tbody > tr > td:nth-child(1) {
		width:180px;
		text-align:center;
	}
	
	body > div > div.container > div:nth-child(2) > form > table > tbody > tr > td {
		border:0px;
	}
	
	body h5 {
		font-size:14px;
	}
	
	body > div > div.container > div:nth-child(2) > form > table > tbody > tr > td > div > span {
		width:200px;
	}
	
	#email_check, #user_name_check, #password_check, #password_equal {
		line-height:47px;
		margin-left:5px;
		font-size: 14px;
	} 
</style>
</head>
<body>

	<div class="container" style="margin-top:10px; margin-bottom:10px; width:850px;">
		
		<!-- Header -->
		<div>
			<h3>회원가입</h3>
		</div>
		
		<!-- 회원가입 내용 부분 -->
		<div style="margin-top:15px;">
			<form action="${root}/member/registerOk.do" method="post">
				<table class="table table-borderless">
				    <tbody style="border-top:2px solid #474747; border-bottom: 1px solid #474747; background-color: #f9fafb;">
					    <tr>
					        <td style="line-height:48px;">
					        	이메일<a href="#" data-toggle="tooltip" title="ex. akgkfk3@naver.com">  <i class="fa fa-question-circle" aria-hidden="true"></i></a>
					        </td>
					        <td>
					        	<div class="input-group">
					        	<div class="input-group-prepend bg-transparent" style="background-color: white;">
		                      	<span class="input-group-text bg-transparent border-right-0">
			                    <i class="ti-email text-primary"></i>
			                    </span>
			                    </div>
			                    <input type="text" style="ime-mode:disabled" class="form-control form-control-lg border-left-0" placeholder="Email" name="email" id="email" maxlength="32" oninput="emailDupCheck()">
								<span id="email_check"></span>
								</div>
					        </td>
					    </tr>
				    	<tr>
						    <td style="line-height:48px;">이름</td>
						    <td style="margin-top:20px;">
						    	<div class="input-group">
                    			<div class="input-group-prepend bg-transparent">
                    		    <span class="input-group-text bg-transparent border-right-0" style="width:42px;">
                          		<i class="fa fa-user" aria-hidden="true" style="color:dodgerblue;"></i>
                     		    </span>
                                </div>
                  			    <input type="text" style="IME-MODE:active" class="form-control form-control-lg border-left-0" placeholder="이름" name="user_name" id="user_name" maxlength="10">
                  			    <span id="user_name_check"></span>
                			    </div>
						    </td>
				   		</tr>
				    	<tr>
						    <td style="line-height:48px;">
						   		비밀번호<a href="#" data-toggle="tooltip" title="비밀번호는 공백없이 11자 이상 20자 이하로 특수문자 1개, 숫자 1개, 대문자가 1개가 포함되어야 합니다.">  <i class="fa fa-question-circle" aria-hidden="true"></i></a>
						    </td>
						    <td>
						    	<div class="input-group">
                   			    <div class="input-group-prepend bg-transparent">
                   			    <span class="input-group-text bg-transparent border-right-0">
                    		    <i class="ti-lock text-primary"></i>
                     			</span>
                  				</div>
                  				<input type="password" class="form-control form-control-lg border-left-0" id="password" name="password" placeholder="password" maxlength="20" oninput="passwordCheckm()"/><br/>
                  				<span id="password_check"></span>
                  			</div>
						    </td>
				   		</tr>
				    	<tr>
						    <td style="line-height:48px;">비밀번호 확인</td>
						    <td>
						    	<div class="input-group">
                   			    <div class="input-group-prepend bg-transparent">
                   			    <span class="input-group-text bg-transparent border-right-0">
                    		    <i class="ti-lock text-primary"></i>
                     			</span>
                  				</div>
                  				<input type="password" class="form-control form-control-lg border-left-0" id="passwordCheck" name="passwordCheck" placeholder="passwordCheck" maxlength="20"/><br/>
                  				<span id="password_equal"></span>
                  				</div>
						    </td>
				   		</tr>
				    	<tr>
						    <td style="line-height:48px;">
						    	휴대폰 번호<a href="#" data-toggle="tooltip" title="휴대폰 번호는 '-'없이 번호만 입력해주세요.">  <i class="fa fa-question-circle" aria-hidden="true"></i></a>
						    </td>
						    <td>
						    	<div class="input-group">
                 			    <div class="input-group-prepend bg-transparent">
                    		    <span class="input-group-text bg-transparent border-right-0">
                                <i class="fa fa-phone" aria-hidden="true" style="color:dodgerblue;"></i>
                     		    </span>
                  			    </div>
                  			    <input type="text" class="form-control form-control-lg border-left-0" placeholder="폰번호" name="phone_num" id="phone_num" maxlength="11">
						    	<span id="phone_check"></span>
						    	</div>
						    </td>
				   		</tr>
			    	</tbody>
				</table>
				<h5><i class="fa fa-exclamation-circle" aria-hidden="true" style="color:deeppink"></i>  이메일 회원가입은 이메일 인증을 하셔야만 회원가입이 완료됩니다.</h5>
				<h5 style="margin-top:15px;"><i class="fa fa-exclamation-circle" aria-hidden="true" style="color:deeppink"></i>  아래 회원가입 버튼을 누르신 후 입력하신 이메일 주소에서 인증 메일을 확인 하여 주시기 바랍니다.</h5>
				<input type="submit" id="submit" class="btn btn-secondary" value="회원가입" style="width:170px; height:50px;margin-left:300px; margin-top:15px;" disabled="disabled"/>
			</form>
		</div>
	</div>

  <%--  <div class="container-scroller">
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
                    <input type="text" style="ime-mode:disabled" class="form-control form-control-lg border-left-0" placeholder="Email" name="email" id="email" oninput="emailDupCheck()" maxlength="320">
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
                    <input type="password" class="form-control form-control-lg border-left-0" id="password" name="password" placeholder="password" oninput="passwordCheckm(password.value)" maxlength="20"/><br/>
                    <input type="password" class="form-control form-control-lg border-left-0" id="passwordCheck" name="passwordCheck" placeholder="passwordCheck" maxlength="20"/><br/>
                    <div style="color:green" class="alert password-equals-true" id="password-equals-true">비밀번호가 일치합니다.</div>
                    <div style="color:red" class="alert password-equals-false" id="password-equals-false">비밀번호가 일치하지 않습니다.</div>
                    <div style="color:violet" class="alert password-contains=email" id="password-contains-email"></div>
                    <div style="color:green" class="alert password-type-true" id="password-type-true"></div>
                    <div class="alert password-type-false" id="password-type-false"></div>
                    <div id="passwordCheckTxt" style="color: #FF6600; margin: 0;"></div>
                    <div id="passwordCheckTxt2" style="color: #FF6600; margin: 0;"></div>
                    <div id="passwordCheckTxt3" style="color: #FF6600; margin: 0;"></div>
                    <div id="passwordCheckTxt4" style="color: #FF6600; margin: 0;"></div>

                    
                <div class="form-group">
                  <label>이름</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
<!--                         <i class="ti-email text-primary"></i> -->
                      </span>
                    </div>
                    <input type="text" style="IME-MODE:active" class="form-control form-control-lg border-left-0" placeholder="이름" name="user_name" id="user_name" maxlength="10" required="required">
					<div id="user_name_man">이름은 한글 10자까지 입력 가능합니다. 본명을 써 주십시오. 예약 시 불이익이 있을 수 있습니다.</div>
					<div id="user_name_check"></div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label>핸드폰번호</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
<!--                         <i class="ti-email text-primary"></i> -->
                      </span>
                    </div>
                    <input type="text" class="form-control form-control-lg border-left-0" placeholder="폰번호" name="phone_num" id="phone_num" maxlength="11" required="required">
					<div id="phone_check"></div>
					<div id="phone_check1"> - 없이 숫자만 정확하게 입력해 주십시오. 예약 시 연락을 취할 번호입니다.</div>
                  </div>
                </div>
                    
                    
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
</c:if>  --%>
</body>

</html>