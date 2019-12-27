package com.odtn.boardComment.controller;

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
		@RequestMapping(value ="reviewComment/list.do",method = RequestMethod.POST)
		public ModelAndView list(HttpServletRequest request,HttpServletResponse respons) {
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			reviewCommentService.list(mav);
			return mav;
		}
}
