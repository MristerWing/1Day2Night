<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>  

<html lang="utf-8">

<head>
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/board/boardRead.css">
   	<script type="text/javascript">
		   addEventListener("load", function() {
		       setTimeout(hideURLbar, 0);
		   }, false);
		
		   function hideURLbar() {
		       window.scrollTo(0, 1);
		   };
		   /*댓글*/
		 	$(document).ready(function(){
		  		showCommentList();
		  	});
			
		  	function showCommentList(){
		  		var review_num = ${campReviewDto.review_num};
		  		var url="${root}/reviewComment/list.do?review_num="+review_num;
		  			var indexNum = 0;
		  		$.ajax({
		  			type:'GET',
		  			url:url,
		  			dataType: 'json',
		  			success:function(data){
		  				console.log(data.reviewCommentList[0], data.writerList[0]);
		  				
		  				
						var htmls="";
		  				if (data.lenth<1) {
							html.push("등록된 댓글이 없습니다.");
							alert("data < 1");
						}else{
							$(data.reviewCommentList).each(function(){
				  				var day = new Date(data.reviewCommentList[indexNum].write_date);
				  				console.log(day);
								var year = day.getFullYear();
								var month = day.getMonth() + 1;
								var date = day.getDate();
								var formatDate = year + "년 " + month + "월 " + date + "일 "; 
								
							     htmls += '<div class="num'+this.comment_num+' media text-muted pt-3" id="rid' + data.writerList[indexNum] + '">';

			                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

			                     htmls += '<title>Placeholder</title>';

			                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

			                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

			                     htmls += '</svg>';

			                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

			                     htmls += '<span class="d-block">';

			                     htmls += '<strong class="text-gray-dark">' + data.writerList[indexNum] + '</strong>';

			                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
								 
			                     if(data.reviewCommentList[indexNum].user_num == ${sessionScope.user_num!=null?sessionScope.user_num:-1}){
			                    	 
			                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' +this.comment_num + ',\'' + this.comment_content + '\')" style="padding-right:5px">수정</a>';

			                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.comment_num + ')" >삭제</a>';
			                     }

			                     htmls += '</span>';

			                     htmls += '</span>';

			                     htmls += this.comment_content;
			                 
			                     htmls += formatDate;
 
			                     htmls += '</p>';

			                     htmls += '</div>';
			                     
			                     $("#commentList").append(htmls);
			                     htmls = "";
			                     indexNum++;
							});
						}
		  			}
		  		});
		  	}
		  	 /*댓글 등록 */
		  	//댓글 저장 버튼 클릭 이벤트
		
			 function insert_reply(review_num,user_num){
		
				var replyContent = $('#comment_content').val();
		
				var paramData = {"comment_content": replyContent
		
						, "user_num": user_num,"review_num":review_num
				};
						
					alert(paramData);
				$.ajax({
		
					url: "${root}/reviewComment/insert.do"
		
					, data : paramData
		
					, type : 'POST'
		
					, dataType : 'json'
		
					, success: function(result){
		
		
						$('#comment_content').val('');
		
						$('#user_num').val('');
						//$('#.num'+comment_num).prepend(result.html);
						alert("등록완료");
						showCommentList();
						
						
					}
		
					, error: function(error){
		
						console.log("에러 : " + error);
		
					}
		
				});
		
			}
		
		
				  	
			/*댓글 삭제*/
		  	function fn_deleteReply(comment_num){

				var paramData = {"comment_num": comment_num};	

				$.ajax({

					url: "${root}/reviewComment/delete.do"
					
					, data : paramData

					, type : 'GET'

					, dataType : 'text'

					, success: function(result){
						$(".num"+comment_num).remove();

					}

					, error: function(error){

						console.log("에러 : " + error);

					}

				});
	
			}
		
			/*댓글 수정*/
		function fn_editReply(comment_num, comment_content){
		var htmls = "";

		htmls += '<div class="media text-muted pt-3" id="comment_num' + comment_num + '">';

		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

		htmls += '<title>Placeholder</title>';

		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

		htmls += '</svg>';

		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

		htmls += '<span class="d-block">';

		htmls += '<strong class="text-gray-dark">' +comment_num+ '</strong>';

		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + comment_num + ')" style="padding-right:5px">저장</a>';

		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

		htmls += '</span>';

		htmls += '</span>';		

		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

		htmls += comment_content;

		htmls += '</textarea>';

		

		htmls += '</p>';

		htmls += '</div>';

		

		$('.num' + comment_num).replaceWith(htmls);

		$('.num' + comment_num + ' #editContent').focus();

	}
	 	/*댓글 수정 확인*/
		function fn_updateReply(comment_num){

			var replyEditContent = $('#editContent').val();
				alert(replyEditContent);
				
			var paramData = {"comment_content": replyEditContent
											, "comment_num": comment_num
			};
		

			$.ajax({

				url: "${root}/reviewComment/update.do"
			
				, data : paramData

				, type : 'POST'

				, dataType : 'json'

				, success: function(result){

	              console.log(result);
				
					$("#comment_num"+comment_num).remove();
					showCommentList()
				}

				, error: function(error){

					console.log("에러 : " + error);

				}

			});

		}


    </script>  

</head>

<body>
    
    <!-- //main-content -->
  <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
             <div class="info_content" >
				<!--본문 -->
				<!--댓글작성 form-->
	
			<input type="hidden" name="review_num" value="${campReviewDto.review_num}">
			<!--세션스콥받아오는 작업해주고 고치기-->
<%-- 			<input type="hidden" name="user_num" value="${sessionScope.sessionID}">--%>			
<section class="about py-lg-5 py-md-5 py-5">
		<div class="container">
			<div class="inner-sec-w3pvt py-lg-5 py-3">
				<h4 class="tittle text-center mb-lg-5 mb-3 px-lg-5">[${campReviewDto.camp_id}]${campReviewDto.title}</h4>
				<article>

									<div class="container" role="main">

										<div class="contents_form">

											<div class="writer">
												<span> 작성자:</span>&nbsp;<span>${writer}</span> &nbsp;&nbsp;
												<fmt:formatDate value="${campReviewDto.write_date}"
													pattern="yyyy-MM-dd" />
											</div>

											<div class="summernote_content">
												<span> <c:out value="${campReviewDto.content}"
														escapeXml="false"></c:out>
												</span>
											</div>
										</div>



										<div class="button_form"  style="margin-top: 20px" align="center">
											<c:if
												test="${sessionScope.user_num ==campReviewDto.user_num}">
												<button type="button" class="btn btn-sm btn-primary"
													id="btnUpdate"
													onclick="location.href='${root}/board/campReview/update.do?review_num=${campReviewDto.review_num}&user_num=${campReviewDto.user_num}&pageNumber=${pageNumber}'">수정</button>

												<button type="button" class="btn btn-sm btn-primary"
													id="btnDelete"
													onclick="location.href='${root}/board/campReview/delete.do?review_num=${campReviewDto.review_num}'">삭제</button>
											</c:if>
											<button type="button" class="btn btn-sm btn-primary"
												id="btnList"
												onclick="location.href='${root}/board/campReview/list.do?pageNumber=${pageNumber}'">목록</button>

										</div>

										<div class="comment">
											<!--댓글 작성 란-->

											<c:if test="${sessionScope.user_num != null}">

												<div class="my-3 p-3 bg-white rounded shadow-sm"
													style="padding-top: 10px">

													<input type="hidden" id="review_num" name="review_num"
														value="${campReviewDto.review_num}" /> <input
														type="hidden" id="user_num" name="user_num"
														value="${sessionScope.user_num}" />

													<div class="row">

														<div class="col-sm-10">

															<textarea name="comment_content" id="comment_content"
																class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>

														</div>

														<div class="col-sm-2">
															<input name="${sessionScope.user_num}"
																class="form-control" id="user_num" type="hidden"></input>
															<button class="btn btn-sm btn-primary" id="btnReplySave"
																style="width: 100%; margin-top: 10px"
																onclick="insert_reply('${campReviewDto.review_num}','${sessionScope.user_num}')">
																저 장</button>

														</div>

													</div>


												</div>

											</c:if>
											<!--++++++++++++++댓글리스트++++++++++++++++-->
											
												<div class="my-3 p-3 bg-white rounded shadow-sm"
													style="padding-top: 10px">

													<h6 class="border-bottom pb-2 mb-0">댓글목록</h6>

													<div id="commentList"></div>
												</div>
										

										</div>

									</div>



								</article>

			</div>
		</div>
	</section>


</body>

</html>
