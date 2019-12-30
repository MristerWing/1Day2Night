package com.odtn.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.owner.dto.OwnerDto;
import com.odtn.owner.service.OwnerService;

/**
 * @author KimJinsu
 * @date 2019/12/30
 * @apiNote 사업자 컨트롤러
 */
@Controller
public class OwnerController {

	@Autowired
	private OwnerService ownerService;

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
	public ModelAndView ownerLoginOk(HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();

		String owner_key = request.getParameter("owner_key");

		int user_num = (session.getAttribute("user_num") != null
				? (Integer) session.getAttribute("user_num")
				: 0);

		ModelAndView modelAndView = ownerService.ownerLoginOk(owner_key,
				user_num);
		modelAndView.setViewName("owner/loginOk.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/register.do", method = RequestMethod.GET)
	public ModelAndView ownerRegister(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("owner/register.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/checkOwnerKey.do", method = RequestMethod.GET)
	@ResponseBody
	public String ownerCheckOwnerKey(HttpServletRequest request,
			HttpServletResponse response) {
		return ownerService.checkOwnerKey(
				Long.parseLong(request.getParameter("owner_key")));
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/write.do", method = RequestMethod.GET)
	public ModelAndView ownerWrite(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("owner_key", request.getParameter("owner-key"));
		modelAndView.setViewName("owner/write.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/owner/mainPage.do", method = RequestMethod.POST)
	public ModelAndView ownerMainPage(HttpServletRequest request,
			OwnerDto ownerDto) {

		LogAspect.logger.info(LogAspect.logMsg + "owner" + ownerDto.toString());

		ModelAndView modelAndView = ownerService.ownerMainpage(ownerDto);
		modelAndView.setViewName("owner/mainPage.tiles");

		return modelAndView;
	}
}
