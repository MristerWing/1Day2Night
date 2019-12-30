package com.odtn.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author KimJinsu
 * @date 2019/12/30
 * @apiNote 사업자 컨트롤러
 */
@Controller
public class OwnerController {

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/login.do", method = RequestMethod.GET)
	public ModelAndView ownerLogin(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("request", request);
		modelAndView.setViewName("owner/login.tiles");
		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/mainPage.do", method = RequestMethod.GET)
	public ModelAndView ownerMainPage(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("request", request);
		modelAndView.setViewName("owner/mainPage.tiles");
		return modelAndView;
	}
}
