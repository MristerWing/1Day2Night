package com.odtn.boardComment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.boardComment.dto.ReviewCommentDto;
import com.odtn.boardComment.service.ReviewCommentService;

@Controller
public class ReviewCommentController {

	@Autowired
	private ReviewCommentService reviewCommentService;
	
	//글 작성확인
		@RequestMapping(value= "reviewComment/insert.do", method=RequestMethod.POST)
		public ModelAndView insert(HttpServletRequest request,HttpServletResponse response,
								ReviewCommentDto reviewCommentDto){
			
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("reviewCommentDto",reviewCommentDto);
			reviewCommentService.insert(mav);
			return mav;	
		}
		
	//글 리스트
		@ResponseBody
		@RequestMapping(value ="reviewComment/list.do",method = RequestMethod.GET)
		public Map<String, Object> list(HttpServletRequest request,HttpServletResponse response) {
			
			return reviewCommentService.list(request);
		}
	//해당 댓글삭제 
		@ResponseBody
		@RequestMapping(value ="reviewComment/delete.do",method= RequestMethod.GET)
		public int delete(int comment_num) {
			return reviewCommentService.delete(comment_num);
		}
	//해당 댓글 수정확인
		@ResponseBody
		@RequestMapping(value="reviewComment/update.do",method = RequestMethod.POST)
		public int update(ReviewCommentDto reviewCommentDto) {
			return reviewCommentService.update(reviewCommentDto);
		}
		
}
