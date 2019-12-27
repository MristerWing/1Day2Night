package com.odtn.reservation.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.reservation.dao.ReservationDao;
import com.odtn.search.dao.SearchDao;
import com.odtn.search.dto.SearchDto;

/**
 * @author KimJinsu
 * @date 2019/12/22
 * @apiNote 예약 서비스 객체
 */
@Component
public class ReservationServiceImp implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	@Autowired
	private SearchDao searchDao;

	/**
	 * @apiNote 예약 선택
	 */
	@Override
	public void reservationSelect(ModelAndView modelAndView) {
		Map<String, Object> modelMap = modelAndView.getModelMap();
		HttpServletRequest request = (HttpServletRequest) modelMap
				.get("request");

		int camp_id = Integer.parseInt(request.getParameter("camp-id"));
		SearchDto camp = searchDao.getCamp(camp_id);
		LogAspect.logger.info(LogAspect.logMsg + camp);

		List<String> campingList = reservationDao.getCampingList(camp_id);
		LogAspect.logger.info(LogAspect.logMsg + campingList);

		modelAndView.addObject("campingList", campingList);
		modelAndView.addObject("camp", camp);

	}

	/**
	 * @author KimJinsu
	 * @date 2019. 12. 23.
	 * @apiNote 날짜 선택시 매진여부 확인 (매진: soldOut, 성공시: ok)
	 * @return ArrayList<HashMap<String, Object>> result
	 */
	@Override
	public ArrayList<HashMap<String, Object>> datePicker(
			HttpServletRequest request, HttpServletResponse response) {
		int camp_id = Integer.parseInt(request.getParameter("camp-id"));
		String campingName = request.getParameter("camp_fee");
		Date startDate = null;
		Date endDate = null;
		int peopleOfNum = Integer.parseInt(request.getParameter("people"));

		try {
			startDate = new SimpleDateFormat("yyyy-MM-dd")
					.parse(request.getParameter("startDate"));
			endDate = new SimpleDateFormat("yyyy-MM-dd")
					.parse(request.getParameter("endDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		LogAspect.logger.info(LogAspect.logMsg + camp_id + campingName
				+ startDate + endDate + peopleOfNum);

		ArrayList<HashMap<String, Object>> result = reservationDao
				.getCampingSoldOutMap(camp_id, campingName, startDate, endDate,
						peopleOfNum);

		return result;
	}

	/**
	 * @apiNote 예약 결제, 예약번호는 고유값. 유저번호는 세션에서 가져옴
	 */
	@Override
	public void reservationPay(ModelAndView modelAndView) {
		Map<String, Object> modelMap = modelAndView.getModelMap();
		HttpServletRequest request = (HttpServletRequest) modelMap
				.get("request");

		LogAspect.logger
				.info(LogAspect.logMsg + request.getParameter("selectDate"));

		Date selectDate = null;

		try {
			selectDate = new SimpleDateFormat("yyyy-MM-dd")
					.parse(request.getParameter("startDate"));
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		LogAspect.logger.info(LogAspect.logMsg + selectDate);

	}
}
