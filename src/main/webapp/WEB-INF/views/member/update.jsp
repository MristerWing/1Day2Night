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
  
  <script type="text/javascript">
  	function modifyForm(obj){
  		//interest를 받기 위해 만듬
  		alert("modFormOk");
  		var str="";
  		var cnt=0;
  		for(var i=0;i<obj.interest.length;i++){
  			if(obj.interest[i].checked==true){
  				str += obj.interest[i].value+",";
  				cnt++;
  			}
  		}
  		alert("interestStr: "+str);
  		obj.interesth.value=str;
  		
  		var gen="";
  		for(var i=0;i<obj.gender.length;i++){
  			if(obj.gender[i].checked==true) {
  				gen += obj.gender[i].value;
  			}
  		}
  		alert("genderStr: "+gen);
  		obj.genderh.value=gen;
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
                  <h4 class="card-title">회원 정보 수정</h4>
                  <p class="card-description">
                    회원 정보 수정
                  </p>
                  <form class="forms-sample" action="${root}/member/updateOk.do" method="post"
                  	enctype="multipart/form-data" name="updateForm" onsubmit="modifyForm(this)">
                    <div class="form-group">
                      <label for="exampleInputName1">이름</label>
                      <input type="hidden" name="user_nameHidden" value="${memberDto.user_name}"/>
                      <input type="text" class="form-control" id="exampleInputName1" name="user_name" placeholder="Name" value="${memberDto.user_name}"/>
                      
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail3">이메일</label>
                      <input type="hidden" name="emailHidden" value="${memberDto.email}"/>
                      <input type="email" class="form-control" id="exampleInputEmail3" name="email" placeholder="Email" value="${memberDto.email}"/>
                      
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword4">비밀번호</label>
                      <input type="hidden" name="passwordHidden" value="${memberDto.password}"/>
                      <input type="password" class="form-control" id="exampleInputPassword4" name="password" placeholder="Password" value="${memberDto.password}"/>
                      
                    </div>
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
                            	<input type="checkbox" class="form-check-input" id="check-01" name="interest" value="mountain">
                            	엄홍길
                            </label>
                            <label class="form-check-label" for="check-02">
                            	<input type="checkbox" class="form-check-input" id="check-02" name="interest" value="sea">
                            	박태환
                            </label>
                            <label class="form-check-label" for="check-03">
                            	<input type="checkbox" class="form-check-input" id="check-03" name="interest" value="mountain">
                            	김병만
                            </label>
                            <input type="hidden" name="interesth"/>
                    	 </div>
                    </div>
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
                    <div class="form-group">
                      <label>성별</label>
                      <input type="radio" name = "gender" value="m">
                      <label>남</label>
                      <input type="radio" name = "gender" value="f">
                      <label>여</label>
                      <input type="hidden" name="radioh"/>
                    
                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
<!--                     <button class="btn btn-light">Cancel</button> -->
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
