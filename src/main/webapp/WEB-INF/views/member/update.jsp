<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>회원 정보 수정</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../../resources/css/member/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../../resources/css/member/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../../resources/css/member/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../../resources/css/member/images/favicon.png" />
<%--   <script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script> --%>
<link rel="stylesheet" src="${root}/resources/css/member/style.css"/>

<link rel="stylesheet" href="${root}/resources/css/member/vendors/ti-icons/css/themify-icons.css">
<link rel="shortcut icon" href="${root}/resources/css/member/images/favicon.png" />
<%-- <script type="text/javascript" src="${root}/resources/javascript/member/member.js"></script> --%>
<%-- <script src="${root}/resources/css/member/vendors/base/vendor.bundle.base.js"></script> --%>
<script src="${root}/resources/javascript/member/js/off-canvas.js"></script>
<script src="${root}/resources/javascript/member/js/hoverable-collapse.js"></script>
<script src="${root}/resources/javascript/member/js/template.js"></script>
<script src="${root}/resources/javascript/member/js/todolist.js"></script>

  
  <script type="text/javascript">
  	function modifyForm(obj){
  		//interest를 받기 위해 만듬
  		//alert("modFormOk");
  		var str="";
  		var cnt=0;
  		for(var i=0;i<obj.interest.length;i++){
  			if(obj.interest[i].checked==true){
  				str += obj.interest[i].value+",";
  				cnt++;
  			}
  		}
  		//alert("interestStr: "+str);
  		obj.interesth.value=str;
  		
//   		var gen="";
//   		for(var i=0;i<obj.gender.length;i++){
//   			if(obj.gender[i].checked==true) {
//   				gen += obj.gender[i].value;
//   			}
//   		}
//   		alert("genderStr: "+gen);
//   		obj.genderh.value=gen;
  	}
  	
  	
  	
//   	var emailCheck = 0;
	var passwordEqual = 0;
	var passwordBoolean = false;
// 	var userNameCheck = false;
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
// 	function emailDupCheck() {
// 		var email = $("#email").val();
// 		console.log(email);
		
// 		$.ajax({
// 			data:{email:email},
// 			url:'${root}/member/emailDupCheck.json',
// 			type: 'post',
// 			dataType: 'json',
// 			success: function(data){
// 				//alert(JSON.stringify(data));
// 				if(email==""){
// 					$("#submit").prop("disabled", true);
// 					$("#email_check").css("color","black");
// 					$("#email_check").text("Email을 입력해주세요");
// 					emailCheck = 0;
// 				} else if($.trim(data) == -1){
// 					$("#email_check").text("Email 형식이 틀립니다.");
// 					$("#email_check").css("color","red");
// 					$("#submit").prop("disabled", true);
// 					emailCheck = 0;
// 				} else if($.trim(data) == 0){
// 					$("#email_check").css("color", "green");
// 					$("#email_check").text("사용 가능한 Email입니다. ");
// 					emailCheck = 1;
// 					/* if(emailCheck==1 && passwordEqual>1 && passwordBoolean == true
// 							&& userNameCheck == true && phoneNumCheck == true){
// 						$("#submit").prop("disabled", false);
// 					} */
// 				} else if($.trim(data) == 1){
// 					$("#submit").prop("disabled", true);
// 					$("#email_check").text("사용 중인 Email입니다.");
// 					$("#email_check").css("color", "red");
// 					emailCheck=0;
// 				}
// 			}, error:function(){
// 				alert("emailDupCheck() error");
// 			}
// 		});
// 	}
	
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

// 		$("#user_name").on('keyup', function(event){
// 			user_name = $("#user_name").val();
// 			console.log(user_name);
// 			if(user_name == ""){
// 				$("#user_name_check").css("color", "red");
// 				$("#user_name_check").text("이름을 입력해 주세요");
// 				userNameCheck=false;
// 				$("#submit").prop("disabled", true);
// 			} 
// 			if(user_name.length == 1){
// 				$("#user_name_check").css("color", "red");
// 				$("#user_name_check").text("이름을 2자 이상 써주십시오");
// 				userNameCheck=false;
// 				$("#submit").prop("disabled", true);
// 			} else if(user_name.length>1){
// 				$("#user_name_check").css("color", "green");
// 				$("#user_name_check").text("사용 가능한 이름입니다.");
// 				userNameCheck=true;
// 			}
// 		});
	
	
	
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
			if(passwordEqual == 1 && passwordBoolean == true
			 && phoneNumCheck == true){
				
				$("#submit").prop("disabled", false);
			}
		});
		
		
// 		$("#leaveBtn").click(function(){
// 			var leaveConfirm = confirm("정말로 탈퇴하시겠습니까?");
// 			if (leaveConfirm){
// 				var password = "${memberDto.password}";
// 				$.post("{root}/member/deleteOk.do?",password, function()){
					
// 				}
					

// 			} else {}
// 		});
		
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
<c:if test="${memberDto != null}">
	<div class="container" style="margin-top:10px; margin-bottom:10px; width:850px;">
		
		<!-- Header -->
		<div>
			<h3>정보 수정</h3>
		</div>
		
		<!-- 정보수정 내용 부분 -->
		<div style="margin-top:15px;">
			<form method="post">
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
			                    <input type="text" style="ime-mode:disabled" class="form-control form-control-lg border-left-0" placeholder="Email" name="email" id="email" maxlength="32"
			                    disabled="disabled" value="${memberDto.email}">
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
                  			    <input type="text" style="IME-MODE:active" class="form-control form-control-lg border-left-0" placeholder="이름" 
                  			    name="user_name" id="user_name" maxlength="10" value="${memberDto.user_name}" disabled="disabled"/>
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

<%-- 				<input type="hidden" name="nickname" value="${memberDto.nickname}"/> --%>
<%-- 				<input type="hidden" name="interest" value="${memberDto.interest}"/> --%>
<%-- 				<input type="hidden" name="profile_image" value="${memberDto.profile_image}"/> --%>
				

				<input type="submit" id="submit" class="btn btn-primary" value="수정" formaction="${root}/member/updateOk.do" style="width:100px; height:50px;margin-left:300px; margin-top:15px;" disabled="disabled" />
				<input type="submit" id="leaveBtn" class="btn btn-danger" value="탈퇴" formaction="${root}/member/deleteOk.do" style="width:100px; height:50px;margin-left:300px; margin-top:15px;"/>
			</form>
		</div>
	</div>
	

</c:if>
<!--   <div class="container-scroller"> -->

<!--     partial -->
<!--     <div class="container-fluid page-body-wrapper"> -->
      
      
<!--       partial -->
<!--       <div class="main-panel">         -->
<!--         <div class="content-wrapper"> -->
<!--           <div class="row"> -->
           
            
<!--             <div class="col-12 grid-margin stretch-card"> -->
<!--               <div class="card"> -->
<!--                 <div class="card-body"> -->
<!--                   <h4 class="card-title">회원 정보 수정/탈퇴</h4> -->
<!--                   <p class="card-description"> -->
<!--                     회원 정보 수정 -->
<!--                   </p> -->
<%--                   <form class="forms-sample" action="${root}/member/updateOk.do" method="post" --%>
<!--                   	enctype="multipart/form-data" name="updateForm" onsubmit="modifyForm(this)"> -->
<!--                     <div class="form-group"> -->
<!--                       <label for="exampleInputName1">이름</label> -->
<%--                       <input type="hidden" name="user_nameHidden" value="${memberDto.user_name}"/> --%>
<%--                       <input type="text" style="ime-mode:active" class="form-control" id="user_name" name="user_name" placeholder="Name" value="${memberDto.user_name}" oninput="userNameCheck()" /> --%>
                      
<!--                     </div> -->
<!--                     <div class="form-group"> -->
<!--                       <label for="exampleInputEmail3">이메일</label> -->
<%--                       <input type="hidden" name="emailHidden" value="${memberDto.email}"/> --%>
<%--                       <input type="email" style="ime-mode:disabled" class="form-control" id="emaildis" name="emaildis" placeholder="Email" value="${memberDto.email}" oninput="emailDupCheck()" maxlength="320" disabled/> --%>
<!--                       <input type="hidden" name="email"/> -->
                      
<!--                     </div> -->
<!--                     <div class="form-group"> -->
<!--                       <label for="exampleInputPassword4">비밀번호</label> -->
<%--                       <input type="hidden" name="passwordHidden" value="${memberDto.password}"/> --%>
<%--                       <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${memberDto.password}" oninput="passwordCheckm(password.value)" maxlength="20"/> --%>
<!--                       <input type="hidden" name="passwordh"/> -->
<!--                     </div> -->
<!--                     <div class="form-group"> -->
<!--                     	<label for="exampleInputNickname5">닉네임</label> -->
<%--                     	<input type="hidden" name="nicknameHidden" value="${memberDto.nickname}"/> --%>
<%--                     	<input type="text" style="IME-MODE:active" class="form-control" id="nickname" name="nickname" placeholder="nickname" value="${memberDto.nickname}" oninput="nicknameDuplCheck()" size="20"/> --%>
<!--                     	<input type="hidden" name="nicknameh"/> -->
<!--                     	<div id="nickname_check"></div> -->
<!--                       <label for="exampleSelectGender">Gender</label> -->
<!--                         <select class="form-control" id="exampleSelectGender"> -->
<!--                           <option>Male</option> -->
<!--                           <option>Female</option> -->
<!--                         </select> -->
<!--                     </div> -->
<!--                     <div class="form-group"> -->
<!--                     	<label for="exampleInputPhoneNum6">핸드폰번호( - 없이 숫자만 입력해 주세요)</label> -->
<%--                     	<input type="hidden" name="phone_numHidden" value="${memberDto.phone_num}"/> --%>
<%--                     	<input type="text" class="form-control" id="phone_num" name="phone_num" placeholder="PhoneNumber" value="${memberDto.phone_num}" oninput="phoneDuplCheck()" size="11"/> --%>
<!--                     	<input type="hidden" name="phoneNumh"/> -->
<!--                     </div> -->
<!--                     <br/> -->
<!--                     <div class="form-group"> -->
<!--                     	<div class="form-check form-check-primary"> -->
<!--                             <h3>흥미 있는 키워드들을 선택해주세요 </h3> -->
<!--                             <label class="form-check-label" for="check-01"> -->
<!--                             	<input type="checkbox" class="form-check-input" id="check-01" name="interest" value="mountain"> -->
<!--                             	엄홍길 -->
<!--                             </label> -->
<!--                             <label class="form-check-label" for="check-02"> -->
<!--                             	<input type="checkbox" class="form-check-input" id="check-02" name="interest" value="sea"> -->
<!--                             	박태환 -->
<!--                             </label> -->
<!--                             <label class="form-check-label" for="check-03"> -->
<!--                             	<input type="checkbox" class="form-check-input" id="check-03" name="interest" value="valley"> -->
<!--                             	김병만 -->
<!--                             </label> -->
<!--                             <input type="hidden" name="interesth"/> -->
<!--                     	 </div> -->
<%--                     	 <c:forTokens var="interest" items="${memberDto.interest}" delims=","> --%>
<!--                     	 	<script type="text/javascript"> -->
<!--                      	 		for(var i=0; i<updateForm.interest.length;i++){ -->
<%--                      	 			if(updateForm.interest[i].value=="${interest}"){ --%>
<!--                      	 				updateForm.interest[i].checked=true; -->
<!--                      	 			} -->
<!--                      	 		} -->
<!--                     	 	</script> -->
<%--                     	 </c:forTokens> --%>
<!--                     </div> -->
<!--                     <div class="form-group"> -->
<!--                       <label>프로필 사진 파일 업로드</label> -->
<!--                       <input type="file" name = "profile_image" class="file-upload-default" size="255"/> -->
<!-- <!--                       <div class="input-group col-xs-12"> --> -->
<%-- <%--                       	<input type="hidden" name="profile_imageHidden" value="${memberDto.profile_image}"/> --%> --%>
<!-- <!--                         <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image"/> --> -->
                        
<!-- <!--                         <span class="input-group-append"> --> -->
<!-- <!--                           <button class="file-upload-browse btn btn-primary" type="button">Upload</button> --> -->
<!--                         </span> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="form-group"> -->
<!--                       <label>성별</label> -->
<!--                       <input type="radio" name = "gender" value="m"> -->
<!--                       <label>남</label> -->
<!--                       <input type="radio" name = "gender" value="f"> -->
<!--                       <label>여</label> -->
<!--                       <input type="hidden" name="genderh"/> -->
<!--                     </div> -->
<!--                     <script type="text/javascript"> -->
<!--                      	for(var i=0;i<updateForm.gender.length;i++){ -->
<%--                      		if(updateForm.gender[i].value=="${memberDto.gender}"){ --%>
<!--                      			updateForm.gender[i].checked=true; -->
<!--                      		} -->
<!--                      	} -->
<!--                     </script> -->
                    
<!--                     <button type="submit" class="btn btn-primary mr-2">수정</button> -->
<!--                     <button class="btn btn-light">Cancel</button> -->

<!-- 					<button type="button" class="btn btn-danger" id="leaveAccount">탈퇴</button> -->
	
<!--                   </form> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
            
<!--                     </div> -->
<!--                   </form> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         content-wrapper ends -->
<!--         partial:../../partials/_footer.html -->
<!--         <footer class="footer"> -->
<!--           <div class="d-sm-flex justify-content-center justify-content-sm-between"> -->
<!--             <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <a href="https://www.templatewatch.com/" target="_blank">Templatewatch</a>. All rights reserved.</span> -->
<!--             <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span> -->
<!--           </div> -->
<!--         </footer> -->
<!--         partial -->
<!--       </div> -->
<!--       main-panel ends -->
<!--     </div> -->
<!--     page-body-wrapper ends -->
<!--   </div> -->
  <!-- container-scroller -->
  <!-- plugins:js -->
<!--   <script src="../../vendors/base/vendor.bundle.base.js"></script> -->
  <!-- endinject -->
  <!-- inject:js -->
<!--   <script src="../../js/off-canvas.js"></script> -->
<!--   <script src="../../js/hoverable-collapse.js"></script> -->
<!--   <script src="../../js/template.js"></script> -->
<!--   <script src="../../js/todolist.js"></script> -->
  <!-- endinject -->
  <!-- Custom js for this page -->
<!--   <script src="../../js/file-upload.js"></script> -->
  <!-- End custom js for this page -->
<%-- </c:if> --%>

<c:if test="${memberDto == null}">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		location.href="${root}/index.jsp";
	</script>
</c:if>
</body>

</html>
