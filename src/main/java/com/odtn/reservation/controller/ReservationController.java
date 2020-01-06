package com.odtn.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.reservation.service.ReservationService;

/**
 * @author KimJinsu
 * @date 2019/12/22
 * @apiNote 예약 컨트롤러
 */
@Controller
public class ReservationController {

	@Autowired
	ReservationService reservationService;

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/reservation/select.do", method = RequestMethod.GET)
	public ModelAndView reservationSelect(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("request", request);

		reservationService.reservationSelect(modelAndView);

		modelAndView.setViewName("reservation/makeReservation.tiles");
		return modelAndView;
	}

	/**
	 * @request
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/reservation/dateSold.json", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> reservationDatePicker(
			HttpServletRequest request, HttpServletResponse response) {
		return reservationService.datePicker(request, response);
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value = "/reservation/pay.do", method = RequestMethod.GET)
	public ModelAndView reservationPay(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("request", request);

		reservationService.reservationPay(modelAndView);

		modelAndView.setViewName("reservation/payReservation.tiles");

		return modelAndView;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @description - JackSon 라이브러리의 단일 파라미터 (String)의 매핑 구조가 아직 정확히 알아보지 않았기에
	 *              결론적으로 String 값으로 ResponseBody 어노테이션으로 보낼 때 JavaScript에서
	 *              JSON.parse를 이용해도 인식하지 못함. - 따라서, @jsonProperty 어노테이션을 이용해야
	 *              하는데 이것 또한, 클래스에서 멤버변수로 설정한 뒤 멤버변수 위에 적어주고 getter 메서드도 만들어줘야
	 *              하기에 기존에 만든 ReservationMap을 이용하기로 하였음.
	 */
	@RequestMapping(value = "/reservation/Finalpay.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reservationDoPay(HttpServletRequest request,
			HttpServletResponse response) {

		@SuppressWarnings("unchecked")
		Map<String, String[]> dataMap = request.getParameterMap();
		Map<String, Object> reservationMap = new HashMap<String, Object>();

		Iterator<String> keyIter = dataMap.keySet().iterator();

		while (keyIter.hasNext()) {
			String key = keyIter.next();

			if (key.equals("start_date") || key.equals("end_date")) {
				try {
					reservationMap.put(key, new SimpleDateFormat("yyyy-MM-dd")
							.parse(dataMap.get(key)[0]));
				} catch (ParseException e) {
					e.printStackTrace();
				}

			} else {
				reservationMap.put(key, dataMap.get(key)[0]);
			}
			LogAspect.logger.info(LogAspect.logMsg + reservationMap.get(key));
		}

		reservationMap.put("check",
				reservationService.reservationDoPay(reservationMap));

		return reservationMap;
	}

	@RequestMapping(value = "/reservation/payInfo.do", method = RequestMethod.GET)
	public ModelAndView reservationPayInfo(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("user_name", request.getParameter("user_name"));
		modelAndView.addObject("phone", request.getParameter("phone"));
		modelAndView.addObject("owner_name", reservationService
				.getOwnerName(request.getParameter("camp_id")));
		modelAndView.setViewName("reservation/finishedPay.tiles");

		return modelAndView;
	}

	@RequestMapping(value = "/reservation/check.do", method = RequestMethod.GET)
	public ModelAndView reservationCheck(@RequestParam int user_num) {
		ModelAndView modelAndView = new ModelAndView();

		reservationService.reservationCheck(user_num, modelAndView);

		modelAndView.setViewName("reservation/check.tiles");

		return modelAndView;
	}

	@RequestMapping(value = "/reservation/delete.do", method = RequestMethod.GET)
	public ModelAndView reservationDelete(@RequestParam int user_num,
			@RequestParam String deleteList) {
		ModelAndView modelAndView = new ModelAndView();

		reservationService.reservationDelete(user_num, deleteList,
				modelAndView);

		modelAndView.setViewName("reservation/delete.tiles");

		return modelAndView;
	}

}
