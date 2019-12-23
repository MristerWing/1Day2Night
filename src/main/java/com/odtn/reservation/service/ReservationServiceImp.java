package com.odtn.reservation.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.reservation.dao.ReservationDao;

/**
 * @author KimJinsu
 * @date 2019/12/22
 * @apiNote 예약 서비스 객체
 */
@Component
public class ReservationServiceImp implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	/**
	 * @apiNote 예약 선택
	 */
	@Override
	public void reservationSelect(ModelAndView modelAndView) {
		Map<String, Object> modelMap = modelAndView.getModelMap();
		HttpServletRequest request = (HttpServletRequest) modelMap
				.get("request");

		int camp_id = Integer.parseInt(request.getParameter("camp-id"));
		LogAspect.logger.info(LogAspect.logMsg + camp_id);

		List<String> campList = reservationDao.getCampingList(camp_id);
		LogAspect.logger.info(LogAspect.logMsg + campList);

		modelAndView.addObject("campList", campList);

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
					.parse(request.getParameter("selectDate"));
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		LogAspect.logger.info(LogAspect.logMsg + selectDate);

	}
}
