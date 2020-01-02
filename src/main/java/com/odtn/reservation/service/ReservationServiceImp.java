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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.member.dao.MemberDao;
import com.odtn.member.dto.MemberDto;
import com.odtn.reservation.dao.ReservationDao;
import com.odtn.reservation.dto.ReservationDto;
import com.odtn.search.dao.SearchDao;
import com.odtn.search.dto.SearchDto;
import com.odtn.search.dto.SearchPaymentDto;
import java.time.*;

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
		HttpServletRequest request = (HttpServletRequest) modelMap.get("request");

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
	public ArrayList<HashMap<String, Object>> datePicker(HttpServletRequest request, HttpServletResponse response) {
		int camp_id = Integer.parseInt(request.getParameter("camp-id"));
		String campingName = request.getParameter("camp_fee");
		Date startDate = null;
		Date endDate = null;
		int peopleOfNum = Integer.parseInt(request.getParameter("people"));

		try {
			startDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startDate"));
			endDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endDate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ArrayList<HashMap<String, Object>> result = reservationDao.getCampingSoldOutMap(camp_id, campingName, startDate,
				endDate, peopleOfNum);

		return result;
	}

	/**
	 * @apiNote 예약 결제, 예약번호는 고유값. 유저번호는 세션에서 가져옴
	 * @apiNote 7~8 은 성수기, 그외 비성수기
	 */
	@Override
	public void reservationPay(ModelAndView modelAndView) {
		Map<String, Object> modelMap = modelAndView.getModelMap();
		HttpServletRequest request = (HttpServletRequest) modelMap.get("request");

		int cost = 0;
		SearchDto camp = searchDao.getCamp(Integer.parseInt(request.getParameter("camp-id")));

		List<SearchPaymentDto> payList = searchDao.getPayment(Integer.parseInt(request.getParameter("camp-id")));

		LocalDate reservationStartDate = LocalDate.parse(request.getParameter("startDate"));
		LocalDate reservationEndDate = LocalDate.parse(request.getParameter("endDate"));
		
		Map<String, Integer> holiday = new HashMap<String, Integer>();
		holiday.put("6", 6);
		holiday.put("7", 7);
		Map<String, Integer> peakSeasons = new HashMap<String, Integer>();
		peakSeasons.put("8", 8);
		peakSeasons.put("7", 7);
		peakSeasons.put("12", 12);
		
		for (SearchPaymentDto pay : payList) {

			if (pay.getFee_name().equals(request.getParameter("camp_fee"))) {

				while (!reservationStartDate.equals(reservationEndDate)) {
					int weekOfDay = reservationStartDate.getDayOfWeek().getValue();
					int month = reservationStartDate.getMonthValue();
					int tmpCost = 0;

					boolean isHoliday = holiday.containsValue(weekOfDay);
					boolean isPeakSeasons = peakSeasons.containsValue(month);
					
					if(isHoliday && isPeakSeasons) {
						tmpCost += pay.getPeak_season_holidays_fee();
					}
					else if (isHoliday && !isPeakSeasons) {
						tmpCost += pay.getNormal_season_holidays_fee();
					}
					else if (!isHoliday && isPeakSeasons) {
						tmpCost += pay.getPeak_season_weekdays_fee();
					}
					else {
						tmpCost += pay.getNormal_season_weekdays_fee();
					}
					
					if(tmpCost == 0) {
						cost += pay.getNormal_season_weekdays_fee();
					} else {
						cost += tmpCost;
					}
					
					LogAspect.logger.info(LogAspect.logMsg + cost);
					reservationStartDate = reservationStartDate.plusDays(1);
				}
			}
		}
		
		HttpSession session = request.getSession();
		
		MemberDto memberDto = reservationDao.getMemberDto((Integer)session.getAttribute("user_num"));
		
		modelAndView.addObject(memberDto);
		modelAndView.addObject("camp", camp);
		modelAndView.addObject("cost", cost);
		modelAndView.addObject("camp_fee", request.getParameter("camp_fee"));
		modelAndView.addObject("people", request.getParameter("people"));
		modelAndView.addObject("startDate", request.getParameter("startDate"));
		modelAndView.addObject("endDate", request.getParameter("endDate"));
	}

	@Override
	public String reservationDoPay(Map<String, Object> reservationMap) {
		
		int check = reservationDao.reservationDoPay(reservationMap);
		
		if(check > 0) return "성공"; 
		else return "실패";
		
	}
}
