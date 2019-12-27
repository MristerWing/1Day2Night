package com.odtn.boardComment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;
import com.odtn.board.service.CampReviewService;
import com.odtn.boardComment.dto.ReviewCommentDto;
import com.odtn.boardComment.service.ReviewCommentService;
import com.odtn.member.dto.MemberDto;

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

}
