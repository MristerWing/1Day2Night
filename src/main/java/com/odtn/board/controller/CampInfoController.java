package com.odtn.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.odtn.board.service.CampInfoService;

@Controller
public class CampInfoController {
	
	@Autowired
	private CampInfoService campInfoService;
	
	@RequestMapping(value = "board/campInfo/write.do", method = RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		campInfoService.write(mav);
		return mav;
	}
	
	
	
}
