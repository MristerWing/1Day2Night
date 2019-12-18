package com.odtn.search.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;

@Controller
public class SearchController {

	/*
	 * @Autowired private SearchService searchService;
	 */

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
				} else if (key.equals("detailSearchMainFacilities")) {
					searchMap.put(key, data.get(key)[0].split(","));
				} else
					searchMap.put(key, data.get(key)[0]);
			}
		}
		// searchService.searchList(searchMap);

		System.out.println(request.getParameter("tag") + "aaa");

		LogAspect.logger.info(LogAspect.logMsg
				+ request.getParameter("detailSearchLocationType"));

		mav.addObject(searchMap);
		mav.setViewName("search/list");

		return mav;
	}

	@RequestMapping(value = "/search/read.do", method = RequestMethod.GET)
	public ModelAndView searchRead(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/read");
		request.setAttribute("readPage", request.getParameter("readPage"));
		return mav;
	}
}
