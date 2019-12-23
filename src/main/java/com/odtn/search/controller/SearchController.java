package com.odtn.search.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.search.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;

	@RequestMapping(value = "/search/list.do", method = RequestMethod.GET)
	public ModelAndView searchList(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		@SuppressWarnings("unchecked")
		Map<String, String[]> data = request.getParameterMap();

		Iterator<String> iter = data.keySet().iterator();

		Map<String, Object> searchMap = new HashMap<String, Object>();

		while (iter.hasNext()) {
			String key = iter.next();

			if (data.get(key)[0].equals("")) {
				searchMap.put(key, null);
			} else {
				if (key.equals("tag")) {
					searchMap.put(key, data.get(key)[0].split(","));
				} else if (key.equals("detailSearchOperationType")) {
					searchMap.put(key, data.get(key)[0].split(","));
				} else if (key.equals("detailSearchLocationType")) {
					searchMap.put(key, data.get(key)[0].split(","));
				} else if (key.equals("detailSearchCampType")) {
					searchMap.put(key, data.get(key)[0].split(","));
				} else if (key.equals("detailSearchBottomType")) {
					searchMap.put(key, data.get(key)[0].split(","));
				} else if (key.equals("detailSearchMainFacities")) {
					searchMap.put(key, data.get(key)[0].split(","));
				} else
					searchMap.put(key, data.get(key)[0]);
			}
		}
		searchService.searchList(searchMap);

		Iterator<String> Reiter = data.keySet().iterator();

		while (Reiter.hasNext()) {
			String key = Reiter.next();

			if (data.get(key)[0].equals("")) {
				searchMap.put(key, null);
			} else {
				if (key.equals("tag")) {
					searchMap.put(key, data.get(key)[0]);
				} else if (key.equals("detailSearchOperationType")) {
					searchMap.put(key, data.get(key)[0]);
				} else if (key.equals("detailSearchLocationType")) {
					searchMap.put(key, data.get(key)[0]);
				} else if (key.equals("detailSearchCampType")) {
					searchMap.put(key, data.get(key)[0]);
				} else if (key.equals("detailSearchBottomType")) {
					searchMap.put(key, data.get(key)[0]);
				} else if (key.equals("detailSearchMainFacities")) {
					searchMap.put(key, data.get(key)[0]);
				} else
					searchMap.put(key, data.get(key)[0]);
			}
		}

		// 지도면
		if (request.getParameter("isMap") != null) {
			mav.addObject("isMap", request.getParameter("isMap"));
		}

		mav.addObject("searchMap", searchMap);
		mav.setViewName("search/list");

		return mav;
	}

	/**
	 * @author KimJinsu
	 * @date 2019/12/18
	 * @param request
	 * @param response
	 * @see searchService.searchRead
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/search/read.do", method = RequestMethod.GET)
	public ModelAndView searchRead(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		searchService.searchRead(mav);
		mav.setViewName("search/read");

		return mav;
	}
}
