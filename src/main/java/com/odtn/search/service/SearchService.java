package com.odtn.search.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public interface SearchService {

	void searchList(Map<String, Object> searchMap);

	void searchRead(ModelAndView mav);
}
