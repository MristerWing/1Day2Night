package com.odtn.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.owner.service.OwnerService;

/**
 * @author KimJinsu
 * @date 2019/12/30
 * @apiNote 사업자 컨트롤러
 */
@Controller
public class OwnerController {

	@Autowired
	OwnerService ownerService;

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

		HttpSession session = request.getSession();

		int user_num = (session.getAttribute("user_num") != null
				? (Integer) session.getAttribute("user_num")
				: 0);

		modelAndView.addObject("request", request);
		if (user_num > 0) {
			modelAndView.addObject("user_num", user_num);
			modelAndView.setViewName("owner/login.tiles");
			LogAspect.logger.info(LogAspect.logMsg + user_num);
		} else {
			modelAndView.setViewName("member/login.tiles");
		}
		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/loginOk.do", method = RequestMethod.POST)
	public ModelAndView ownerLoginOk(@RequestParam int owner_key,
			@RequestParam int user_num) {
		ModelAndView modelAndView = ownerService.ownerLoginOk(owner_key,
				user_num);
		modelAndView.setViewName("owner/loginOk.empty");

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
