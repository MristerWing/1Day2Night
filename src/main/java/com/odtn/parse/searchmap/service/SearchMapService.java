package com.odtn.parse.searchmap.service;

import org.springframework.web.servlet.ModelAndView;

public interface SearchMapService {
	public void search(ModelAndView mav);
	public void getAddres(ModelAndView mav);
	public void map(ModelAndView mav);
}
