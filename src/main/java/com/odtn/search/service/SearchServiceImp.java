package com.odtn.search.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.aop.LogAspect;
import com.odtn.search.dao.SearchDao;
import com.odtn.search.dto.SearchDto;

@Component
public class SearchServiceImp implements SearchService {
	
	@Autowired
	private SearchDao searchDao;

	@Override
	public void searchList(Map<String, Object> searchMap) {
		
		String pageNumber = (String) searchMap.get("pageNumber");
		
		if(pageNumber == null) {
			pageNumber = "1";
		}
		
		int currentPage = Integer.parseInt(pageNumber);
		int count = searchDao.getCount(searchMap);
		
		//LogAspect.logger.info(LogAspect.logMsg + "Count : " + count);
		
		int boardSize = 10;
		int startRow = (currentPage-1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		List<SearchDto> searchList = null;
		
		searchMap.put("startRow", startRow);
		searchMap.put("endRow", endRow);
		if(count > 0) searchList = searchDao.list(searchMap);
		
		//LogAspect.logger.info(LogAspect.logMsg + "searchList.Size : " +searchList.size());
		
		searchMap.put("count", count);
		searchMap.put("boardSize", boardSize);
		searchMap.put("searchList", searchList);
		searchMap.put("currentPage", currentPage);
	}
}
