package com.odtn.search.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface SearchService {

	void searchList(Map<String, Object> searchMap);

	void searchRead(ModelAndView mav);

	List<Map<String, Object>> searchAutoComplete(String parameter);
	
	String campRecommand(String campId, String id);

	String campChoice(String parameter, String parameter2);
	
}
