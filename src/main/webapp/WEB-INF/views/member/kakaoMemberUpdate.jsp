<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>카카오 연동 회원 정보 수정</title>
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
  <script type="text/javascript" src="${root}/resources/javascript/modules/jquery-3.4.1.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$("#emailAuthBtn").click(function(){
  			var emailAddr = $("#exampleInputEmail3").val();
  			if(emailAddr != ""){
  				var url = "${root}/member/emailAuthKey.do?"+emailAddr;
  			}
  		});
  	})
  </script>
  
</head>

<body>
<c:if test="${memberDto_null = 't'}">
	<script type="text/javascript">
		alert("정보를 제대로 불러오지 못했습니다.");
	</script>
</c:if>
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
                  <h4 class="card-title">카카오 연동 회원 정보 수정</h4>
                  <p class="card-description">
                    카카오 연동 회원 정보 수정
                  </p>
                  <form class="forms-sample" action="${root}/member/kakaoMemberUpdateOk.do" method="post"
                  enctype="multipart/form-data">
                    <div class="form-group">
                      <label for="exampleInputName1">이름</label>
                      <input type="hidden" name="user_nameHidden" value="${memberDto.user_name}"/>
                      <input type="text" class="form-control" id="exampleInputName1" name="user_name" placeholder="Name" value="${memberDto.user_name}"/>
                      
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">이메일</label>
                      <input type="hidden" name="emailHidden" value="${memberDto.email}"/>
                      <input type="email" class="form-control" id="exampleInputEmail3" name="email" placeholder="Email" value="${memberDto.email}"/>
                      <input type="button" class="btn btn-primary mr-2" id="emailAuthBtn" value="이메일 인증"/>
                    </div>
<!--                     <div class="form-group"> -->
<!--                       <label for="exampleInputPassword4">비밀번호</label> -->
<%--                       <input type="hidden" name="passwordHidden" value="${memberDto.password}"/> --%>
<%--                       <input type="password" class="form-control" id="exampleInputPassword4" name="password" placeholder="Password" value="${memberDto.password}"/> --%>
                      
<!--                     </div> -->
                    <div class="form-group">
                    	<label for="exampleInputNickname5">닉네임</label>
                    	<input type="hidden" name="nicknameHidden" value="${memberDto.nickname}"/>
                    	<input type="text" class="form-control" id="exampleInputNickname5" name="nickname" placeholder="nickname" value="${memberDto.nickname}"/>
                    	
<!--                       <label for="exampleSelectGender">Gender</label> -->
<!--                         <select class="form-control" id="exampleSelectGender"> -->
<!--                           <option>Male</option> -->
<!--                           <option>Female</option> -->
<!--                         </select> -->
                    </div>
                    <div class="form-group">
                    	<label for="exampleInputPhoneNum6">핸드폰번호(숫자만 입력해 주세요)</label>
                    	<input type="hidden" name="phone_numHidden" value="${memberDto.phone_num}"/>
                    	<input type="text" class="form-control" id="exampleInputPhoneNum5" name="phone_num" placeholder="PhoneNumber" value="${memberDto.phone_num}"/>
                    	
                    </div>
                    <br/>
                    <div class="form-group">
                    	<div class="form-check form-check-primary">
                    		<h3>흥미 있는 키워드들을 선택해주세요 </h3>
                            <label class="form-check-label" for="check-01">
                            	<input type="checkbox" class="form-check-input" id="check-01" name="interestValue" value="mountain">
                            	엄홍길
                            </label>
                            <label class="form-check-label" for="check-02">
                            	<input type="checkbox" class="form-check-input" id="check-02" name="interestValue" value="sea">
                            	박태환
                            </label>
                            <label class="form-check-label" for="check-03">
                            	<input type="checkbox" class="form-check-input" id="check-03" name="interestValue" value="mountain">
                            	김병만
                            </label>
                            <input type="hidden" name="interestHidden" value="interest"/>
                    	 	</div>
                    	 </div>
                
                    <div class="form-group">
                      <label>프로필 사진 파일 업로드<br/>
                      	<h5>카카오와 다른 사진을 사용하고 싶다면 파일을 선택하신 후 확인을 눌러주십시오.</h6>
                      </label>
                      
                      <input type="file" name="profile_image" class="file-upload-default" size="255"/>
<!--                       <div class="input-group col-xs-12"> -->
<%--                       	<input type="hidden" name="profile_imageHidden" value="${memberDto.profile_image}"/> --%>
<%--                         <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image" name = "profile_image_" value="${memberDto.profile_image}"/> --%>
                        
<!--                         <span class="input-group-append"> -->
<!--                           <button class="file-upload-browse btn btn-primary" type="button">Upload</button> -->
<!--                         </span> -->
<!--                       </div> -->
                    </div>
                    
                    <button type="submit" class="btn btn-primary mr-2">확인</button>
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
  <script src="${root}/resources/css/member/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="${root}/resources/javascript/member/js/off-canvas.js"></script>
  <script src="${root}/resources/javascript/member/js/hoverable-collapse.js"></script>
  <script src="${root}/resources/javascript/member/js/template.js"></script>
  <script src="${root}/resources/javascript/member/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${root}/resources/javascript/member/js/file-upload.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
