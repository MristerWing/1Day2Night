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
	private SearchMapDao searchMap;

	@Override
	public void page(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber); // 시작 - 끝
		int count = searchMap.getCount();
		LogAspect.logger.info(LogAspect.logMsg+count);
		int boardSize = 10;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		List<SearchMapDto> maplist = null;
		
		if (count > 0) {
			maplist = searchMap.searchList(startRow, endRow);
			LogAspect.logger.info(LogAspect.logMsg+maplist);
		}
		
		request.setAttribute("boardSize", boardSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("count", count);
		request.setAttribute("maplist", maplist);

		mav.setViewName("searchmap/search");
	}
}

