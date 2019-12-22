package com.odtn.board.controller;

import javax.management.MalformedObjectNameException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;
import com.odtn.board.service.CampReviewService;

@Controller
public class CampReviewController {

	@Autowired
	private CampReviewService campReviewService;
	//리뷰작성
	@RequestMapping (value = "board/campReview/write.do",method = RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campReviewService.write(mav);
		return mav;
	}
	//리뷰작성확인
	@RequestMapping (value = "board/campReview/writeOk.do",method = RequestMethod.POST)
	public ModelAndView writeOk(HttpServletRequest request,HttpServletResponse response,
								CampReviewDto campReviewDto,CampReviewFileDto campReviewFileDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("campReviewDto", campReviewDto);
		mav.addObject("campReviewFileDto", campReviewFileDto);
		campReviewService.writeOk(mav);
		return mav;
	}
	//리뷰 목록 확인
	@RequestMapping (value = "board/campReview/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response,
							 CampReviewDto campReviewDto ) {
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			campReviewService.list(mav);
			return mav;
	}
	//글 읽기
	@RequestMapping(value = "board/campReview/read.do",method = RequestMethod.GET  )
	public ModelAndView read(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
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
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campReviewService.update(mav);
		return mav;
	}
	// 글 수정 확인
	@RequestMapping(value="board/campReview/updateOk.do",method=RequestMethod.POST)
	public ModelAndView updateOk(HttpServletRequest request, HttpServletResponse response,
								 CampReviewDto campReviewDto, CampReviewFileDto campReviewFileDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campReviewService.updateOk(mav);
		return mav;
	}
}
