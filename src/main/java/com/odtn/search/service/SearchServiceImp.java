package com.odtn.search.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.search.dao.SearchDao;
import com.odtn.search.dto.SearchDto;
import com.odtn.search.dto.SearchPaymentDto;

@Component
public class SearchServiceImp implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@Override
	public void searchList(Map<String, Object> searchMap) {

		String pageNumber = (String) searchMap.get("pageNumber");
		String filter = (String) searchMap.get("filter");

		if (pageNumber == null)
			pageNumber = "1";
		if (filter == null)
			filter = "regisDate";

		int currentPage = Integer.parseInt(pageNumber);
		int count = searchDao.getCount(searchMap);

		// LogAspect.logger.info(LogAspect.logMsg + "Count : " + count);

		int boardSize = 10;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		List<SearchDto> searchList = null;

		searchMap.put("startRow", startRow);
		searchMap.put("endRow", endRow);
		searchMap.put("filter", filter);
		if (count > 0)
			searchList = searchDao.list(searchMap);

		// LogAspect.logger.info(LogAspect.logMsg + "searchList.Size : "
		// +searchList.size());

		searchMap.put("count", count);
		searchMap.put("boardSize", boardSize);
		searchMap.put("searchList", searchList);
		searchMap.put("currentPage", currentPage);
	}

	/**
	 * @author KimJinsu
	 * @date 2019/12/19
	 * @see SearchDao.getCamp
	 * @apiNote 캠프를 읽어옵니다. readPage는 read.do내부 페이지가 변화되는 것을 감지합니다.
	 */
	@Override
	public void searchRead(ModelAndView mav) {
		Map<String, Object> modelMap = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) modelMap
				.get("request");
		int camp_id = Integer.parseInt(request.getParameter("camp-id"));
		String readPage = request.getParameter("readPage");

		int check = 0;

		if (readPage == null) {
			// 조회수 증가
			check = searchDao.updateReadCount(camp_id);
		} else {
			// 요금정보 일경우 요금정보 호출
			if (readPage.equals("2")) {
				List<SearchPaymentDto> paymentList = searchDao
						.getPayment(camp_id);
				LogAspect.logger.info(LogAspect.logMsg + paymentList);
				mav.addObject("paymentList", paymentList);
			}
		}

		LogAspect.logger.info(LogAspect.logMsg + check);

		// 정보 호출
		SearchDto searchDto = searchDao.getCamp(camp_id);

		/*
		 * else if (readPage.equals("3")) {
		 * 
		 * }
		 */

		mav.addObject("searchDto", searchDto);
		mav.addObject("readPage", readPage);

	}
}
