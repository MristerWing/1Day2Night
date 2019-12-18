package com.odtn.parse.searchmap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.parse.searchmap.dto.SearchMapDto;
import com.odtn.parse.searchmap.service.SearchMapService;

import oracle.net.aso.s;

@Controller
public class SearchController {

	@Autowired
	private SearchMapService searchMapService;
	
	@RequestMapping(value = "/parse/searchmap.do",method = RequestMethod.GET)
	public ModelAndView search(HttpServletRequest request,HttpServletResponse response,SearchMapDto searchMapDto ) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		
		searchMapService.search(mav);
		
//		mav.addObject("searchMapDto",searchMapDto);
//		searchMapService.map(mav);
		
		searchMapService.page(mav);
		
		
//		searchMapService.getAddres(mav);
		
		return mav;
	}
	@RequestMapping(value = "/parse/map.do",method = RequestMethod.GET)
	public ModelAndView map(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request",request);
		searchMapService.search(mav);
		
//		searchMapService.getAddres(mav);
		
		return mav;
	
	}
	
}