package com.odtn.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;
import com.odtn.board.service.CampReviewService;
import com.odtn.member.dto.MemberDto;

@Controller
public class CampReviewController {

	@Autowired
	private CampReviewService campReviewService;
	//리뷰작성
	@RequestMapping (value = "board/campReview/write.do",method = RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response,HttpSession session,MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campReviewService.write(mav,session,memberDto);
		return mav;
	}
	//리뷰작성확인
	@RequestMapping (value = "board/campReview/writeOk.do",method = RequestMethod.POST)
	public ModelAndView writeOk(HttpServletRequest request,HttpServletResponse response,
								CampReviewDto campReviewDto,CampReviewFileDto campReviewFileDto,MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("campReviewDto", campReviewDto);
		mav.addObject("campReviewFileDto", campReviewFileDto);
		campReviewService.writeOk(mav,memberDto);
		return mav;
	}
	//리뷰 목록 확인
	@RequestMapping (value = "board/campReview/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response,
							 CampReviewDto campReviewDto,HttpSession session,MemberDto memberDto) {
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			campReviewService.list(mav,session,memberDto);
			return mav;
	}
	//글 읽기
	@RequestMapping(value = "board/campReview/read.do",method = RequestMethod.GET  )
	public ModelAndView read(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("memberDto",memberDto);
		campReviewService.read(mav);
		return mav;
	}
	//글삭제
	@RequestMapping(value="board/campReview/delete.do",method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campReviewService.delete(mav);
		return mav;
	}
	//글 수정
	@RequestMapping(value="board/campReview/update.do",method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campReviewService.update(mav,memberDto,session);
		return mav;
	}
	// 글 수정 확인
	@RequestMapping(value="board/campReview/updateOk.do",method=RequestMethod.POST)
	public ModelAndView updateOk(HttpServletRequest request, HttpServletResponse response,
								 CampReviewDto campReviewDto, CampReviewFileDto campReviewFileDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("campReviewDto",campReviewDto);
		mav.addObject("campReviewFileDto",campReviewFileDto);
		campReviewService.updateOk(mav);
		return mav;
	}
}
