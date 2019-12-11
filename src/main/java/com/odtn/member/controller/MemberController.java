package com.odtn.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="member/register.do", method=RequestMethod.GET)
	public ModelAndView memberWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/register");
		LogAspect.logger.info(LogAspect.logMsg+"MC.mW.OK");
		
		return mav;
	}
	
	@RequestMapping(value="member/registerOk.do", method=RequestMethod.POST)
	public ModelAndView memberWriteOk(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.logger.info(LogAspect.logMsg+"MC.mWO.OK");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		memberService.memberWriteOk(mav);
		return mav;
	}
	
}
