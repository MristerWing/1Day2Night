package com.odtn.parse.searchmap.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.parse.searchmap.dao.SearchMapDao;
import com.odtn.parse.searchmap.dto.SearchMapDto;

@Component
public class SearchMapServiceImp implements SearchMapService {
	@Autowired
	private SearchMapDao searchMapDao;

	@Override
	public void search(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int count = searchMapDao.getCount();
		LogAspect.logger.info(LogAspect.logMsg+count);
		
		//request.setAttribute("count",count);
		
		
		
		mav.addObject("count",count);
		mav.setViewName("searchmap/search");
	}
	
	
	@Override
	public void getAddres(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		int check = searchMapDao.addrescount();
//		LogAspect.logger.info(LogAspect.logMsg+check);
		
	}
	
	@Override
	public void map(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		SearchMapDto searchMapDto=(SearchMapDto) map.get("searchMapDto");
		
		List<SearchMapDto> maplist = searchMapDao.mapList(searchMapDto);
		LogAspect.logger.info(LogAspect.logMsg+maplist);
		
		mav.addObject("maplist",maplist);
		mav.setViewName("searchmap/search");
		
	}
	
}

