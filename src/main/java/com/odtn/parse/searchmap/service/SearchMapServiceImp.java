package com.odtn.parse.searchmap.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.parse.searchmap.dao.SearchMapDao;

@Component
public class SearchMapServiceImp implements SearchMapService {
	@Autowired
	private SearchMapDao searchMapDao;

	@Override
	public void search(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		mav.setViewName("searchmap/search");
	}
	
}

