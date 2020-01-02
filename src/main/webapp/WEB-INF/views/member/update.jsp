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
  <script src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
  
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
  	
  	
  	
  	
  	
  	
  	
  	var emailCheck = 0;
  	var passwordEqual = 0;
  	var passwordBoolean = false;
  	var userNameCheck = false;
  	var phoneNumCheck = false;

  		function emailDupCheck(){
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
  						$("#email_check").text("이메일을 입력해주세요");
  						emailCheck = 0;
  					} else if($.trim(data) == -1){
  						$("#email_check").css("color", "red");
  						$("#email_check").text("이메일 형식에 맞지 않습니다. (xxx~@yyyy~.zzz)");
  						$("#submit").prop("disabled", true);
  						emailCheck = 0;
  					} else if($.trim(data) == 0){
  						$("#email").css("background-color", "#B0F6AC");
  						$("#email_check").css("color", "green");
  						$("#email_check").text("사용 가능한 이메일입니다.");
  						emailCheck = 1;
  						if(emailCheck==1 && passwordEqual>1 && passwordBoolean == true
  								&& userNameCheck == true && phoneNumCheck == true){
  							$("#submit").prop("disabled", false);
//  	 						$("#submit").css("background-color", "#4CAF50");
  						}
  					} else if($.trim(data) == 1){
  						$("#submit").prop("disabled", true);
//  	 					$("#submit").css("background-color", "#AAAAAA");
  						$("#email").css("background-color", "#FFCECE");
  						$("#email_check").text("이미 사용중인 이메일입니다.");
  						$("#email_check").css("color", "red");
  						emailCheck=0;
  					}
  				}, error:function(){
  					alert("emailDupCheck() error");
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
//  	 					$("#submit").removeAttr("disabled");
  						passwordEqual = passwordEqual+1;
  						if(emailCheck == 1 && passwordEqual > 1 && passwordBoolean==true){
  							if(userNameCheck==true && phoneNumCheck==true){
  								$("#submit").removeAttr("disabled");	
  							}
  						}
  					} else if(password != passwordCheck) {
  						$("#password-equals-true").hide();
  						$("#password-equals-false").show();
  						$("#submit").attr("disabled", "disabled");
  					}
  				}
//  	 			if(password != "" || passwordCheck != ""){
  					
//  	 				if(password == passwordCheck){
//  	 					$("#password-equals-true").show();
//  	 					$("#password-equals-false").hide();
//  	 					$("#submit").removeAttr("disabled");
//  	 				} else {
//  	 					$("#password-equals-true").hide();
//  	 					$("#password-equals-false").show();
//  	 					$("#submit").attr("disabled", "disabled");
//  	 				}
//  	 			}
  			});
  		});
  		
  		function passwordCheckm(){
  			var password=$("#password").val();
  			var email = $("#email").val();
  			console.log(email);
  			console.log(password);
//  	 		$("#password-type-false").hide();
  			$.ajax({
  				type:'POST',
  				url: '${root}/member/passwordCheck.json',
  				data: { password: password, email:email},
  				dataType: 'json',
  				success:function(data){
  					if(data == 0){
//  	 					$("#password_type_false").text("비밀번호는 공백없이 11자 이상 20자 이하로 특수문자 1개, 숫자 1개, 대문자가 1개가 포함되어야 합니다.");
  						passwordCheckTxt.innerHTML ="비밀번호는 공백없이 11자 이상 20자 이하로 특수문자 1개, 숫자 1개, 대문자가 1개가 포함되어야 합니다.";
  						passwordCheckTxt.style="color:red";
  						if(passwordCheckTxt4 != ""){
  							passwordCheckTxt4.innerHTML="";
  							$("#submit").prop("disabled", true);
  							passwordBoolean = false;
  						}
  					} else if(data == -1){
  						passwordCheckTxt2.innerHTML="비밀번호에 이메일이 포함되면 쉽게 개인 정보가 유출될 수 있습니다.";
  						passwordCheckTxt2.style="color:violet";
  						if(password == "") {
  							passwordCheckTxt2.innerHTML="";
  							$("#submit").prop("disabled", true);
  							passwordBoolean = false;
  						}
  						if(passwordCheckTxt4 != ""){
  							passwordCheckTxt4.innerHTML="";
  							$("#submit").prop("disabled", true);
  							passwordBoolean = false;
  						}
  						
  					} else if(data == -2){
  						passwordCheckTxt3.innerHTML ="비밀번호에 공백이 포함될 수 없습니다.";
  						passwordCheckTxt3.style="color:red";
  						if(password==""){
  							passwordCheckTxt3.innerHTML ="";
  						}
  						if(passwordCheckTxt4 != ""){
  							passwordCheckTxt4.innerHTML = "";
  							$("#submit").prop("disabled", true);
  							passwordBoolean = false;
  						}
  					} else if(data == 1){
  						passwordCheckTxt4.innerHTML ="사용가능한 비밀번호입니다.";
  						passwordCheckTxt4.style= "color:green";
  						passwordCheckTxt3.innerHTML="";
  						passwordCheckTxt2.innerHTML="";
  						passwordCheckTxt.innerHTML="";
  						passwordBoolean=true;
  						passwordEqual = passwordEqual+1;
  						if(emailCheck==1 && passwordCheck>1 && passwordBoolean == true){ 
  							if(userNameCheck ==true && phoneNumCheck==true){
  								$("#submit").prop("disabled", false);
  								$("#submit").css("background-color", "#4CAF50");
  							}
  						}
  					}
  				},
  				error:function(request, status){
  					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
  				}
  			});
  		}
  		
  		
  		$(function() {
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
  					$("#user_name_check").text("써도 되는 이름(?)입니다.");
  					userNameCheck=true;
  				}
  			});
  		
  		
  		
  			$("#phone_num").on('keyup', function(event){
  				//숫자만 입력되게하기
//  	 			var reg_num = /^[0-9]}*$/;
//  	 			var reg_num = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
  				var reg_num = /^[0-9]{10,13}$/;

  				var phone_num = $("#phone_num").val();
  				
  				if(phone_num == ""){
  					$("#phone_check").text("");
  					phoneNumCheck=false;
  					$("#submit").prop("disabled", true);
  				}
  				if(reg_num.test(phone_num)==false){
  					console.log("숫자만 입력하세요");
  					$("#phone_num").val(phone_num.replace(/[^0-9]/g,""));
//  	 				$("#phone_check").css("color", "red");
//  	 				$("#phone_check").text("숫자만 입력해 주세요");
  					phoneNumCheck=false;
  					$("#submit").prop("disabled", true);
  				} 
  				if(phone_num.length<10){
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
  		});
  		
  		
  		
  		
  		function nicknameDuplCheck(){
  			var nickname = $("#nickname").val();
  			console.log(nickname);
  			
  			$.ajax({
  				data:{nickname:nickname},
  				url:'${root}/member/nicknameDuplCheck.json',
  				type: 'post',
  				dataType: 'json',
  				success: function(data){
  					//alert(JSON.stringify(data));
  					if(nickname==""){
  						//$("#submit").prop("disabled", true);
  						$("#nickname_check").text("혹시 닉네임을 입력해주실 수 있나요? 쓰지 않으셔도 괜찮아요");
  						//nicknameCheck = false;
  						//$("#submit").prop("disabled", false);
  					} else if($.trim(data) == -1){
  						$("#nickname_check").css("color", "red");
  						$("#nickname_check").text("닉네임은 20자(한글, 영대문자는 한글자당 2자 차지)까지 쓰실 수 있습니다.");
  						//$("#submit").prop("disabled", true);
  						//nicknameCheck = 0;
  					} else if($.trim(data) == 0){
//   						$("#nickname").css("background-color", "#B0F6AC");
  						$("#nickname_check").css("color", "green");
  						$("#nickname_check").text("사용 가능한 닉네임입니다.");
//   						nicknameCheck = 1;
//   						if(emailCheck==1 && passwordEqual>1 && passwordBoolean == true
//   								&& userNameCheck == true && phoneNumCheck == true){
//   							$("#submit").prop("disabled", false);
// //  	 						$("#submit").css("background-color", "#4CAF50");
//   						}
  					} else if($.trim(data) >= 1){
//   						$("#submit").prop("disabled", true);
//  	 					$("#submit").css("background-color", "#AAAAAA");
  						$("#nickname").css("background-color", "#FFCECE");
  						$("#nickname_check").text("이미 사용중인 닉네임입니다.");
  						$("#nickname_check").css("color", "red");
  						nicknameCheck=0;
  					}
  				}, error:function(){
  					alert("nicknameDuplCheck() error");
  				}
  			});
  		}
  		

  </script>
  
</head>

<body>
<c:if test="${memberDto != null}">
  <div class="container-scroller">

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      
      
      <!-- partial -->
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
           
            
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">회원 정보 수정/탈퇴</h4>
                  <p class="card-description">
                    회원 정보 수정
                  </p>
                  <form class="forms-sample" action="${root}/member/updateOk.do" method="post"
                  	enctype="multipart/form-data" name="updateForm" onsubmit="modifyForm(this)">
                    <div class="form-group">
                      <label for="exampleInputName1">이름</label>
                      <input type="hidden" name="user_nameHidden" value="${memberDto.user_name}"/>
                      <input type="text" style="ime-mode:active" class="form-control" id="user_name" name="user_name" placeholder="Name" value="${memberDto.user_name}" oninput="userNameCheck()" />
                      
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">이메일</label>
<%--                       <input type="hidden" name="emailHidden" value="${memberDto.email}"/> --%>
                      <input type="email" style="ime-mode:disabled" class="form-control" id="emaildis" name="emaildis" placeholder="Email" value="${memberDto.email}" oninput="emailDupCheck()" maxlength="320" disabled/>
<!--                       <input type="hidden" name="email"/> -->
                      
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">비밀번호</label>
                      <input type="hidden" name="passwordHidden" value="${memberDto.password}"/>
                      <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${memberDto.password}" oninput="passwordCheckm(password.value)" maxlength="20"/>
                      <input type="hidden" name="passwordh"/>
                    </div>
                    <div class="form-group">
                    	<label for="exampleInputNickname5">닉네임</label>
                    	<input type="hidden" name="nicknameHidden" value="${memberDto.nickname}"/>
                    	<input type="text" style="IME-MODE:active" class="form-control" id="nickname" name="nickname" placeholder="nickname" value="${memberDto.nickname}" oninput="nicknameDuplCheck()" size="20"/>
                    	<input type="hidden" name="nicknameh"/>
                    	<div id="nickname_check"></div>
<!--                       <label for="exampleSelectGender">Gender</label> -->
<!--                         <select class="form-control" id="exampleSelectGender"> -->
<!--                           <option>Male</option> -->
<!--                           <option>Female</option> -->
<!--                         </select> -->
                    </div>
                    <div class="form-group">
                    	<label for="exampleInputPhoneNum6">핸드폰번호( - 없이 숫자만 입력해 주세요)</label>
                    	<input type="hidden" name="phone_numHidden" value="${memberDto.phone_num}"/>
                    	<input type="text" class="form-control" id="phone_num" name="phone_num" placeholder="PhoneNumber" value="${memberDto.phone_num}" oninput="phoneDuplCheck()" size="11"/>
                    	<input type="hidden" name="phoneNumh"/>
                    </div>
                    <br/>
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
                    <div class="form-group">
                      <label>프로필 사진 파일 업로드</label>
                      <input type="file" name = "profile_image" class="file-upload-default" size="255"/>
<!--                       <div class="input-group col-xs-12"> -->
<%--                       	<input type="hidden" name="profile_imageHidden" value="${memberDto.profile_image}"/> --%>
<!--                         <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image"/> -->
                        
<!--                         <span class="input-group-append"> -->
<!--                           <button class="file-upload-browse btn btn-primary" type="button">Upload</button> -->
<!--                         </span> -->
<!--                       </div> -->
                    </div>
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
                    
                    <button type="submit" class="btn btn-primary mr-2">수정</button>
<!--                     <button class="btn btn-light">Cancel</button> -->

					<button type="button" class="btn btn-danger" id="">탈퇴</button>
	
                  </form>
                </div>
              </div>
            </div>
            
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <a href="https://www.templatewatch.com/" target="_blank">Templatewatch</a>. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../../js/file-upload.js"></script>
  <!-- End custom js for this page-->
</c:if>

<c:if test="${memberDto == null}">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		location.href="${root}/index.jsp";
	</script>
</c:if>
</body>

</html>
