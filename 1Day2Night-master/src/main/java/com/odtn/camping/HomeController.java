package com.odtn.camping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.camping.service.CampingService;


@Controller
public class HomeController {
	
	@Autowired
	private CampingService campingService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		campingService.getInfo(mav);
		
		mav.setViewName("index.empty");
		
		return mav;
	}
}
