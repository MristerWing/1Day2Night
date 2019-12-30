package com.odtn.search.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public interface SearchService {

	void searchList(Map<String, Object> searchMap);

	void searchRead(ModelAndView mav);

	List<Map<String, Object>> searchAutoComplete(String parameter);
}
