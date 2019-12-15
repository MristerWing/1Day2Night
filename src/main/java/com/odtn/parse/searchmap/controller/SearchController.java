package com.odtn.parse.searchmap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.parse.searchmap.service.SearchMapService;

@Controller
public class SearchController {

	@Autowired
	private SearchMapService searchMapService;
	
	@RequestMapping(value = "/parse/searchmap.do",method = RequestMethod.GET)
	public ModelAndView search(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("request",request);
		searchMapService.search(mav);
		return mav;
	}
}
