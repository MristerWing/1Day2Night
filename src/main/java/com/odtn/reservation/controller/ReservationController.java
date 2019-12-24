package com.odtn.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

		modelAndView.setViewName("reservation/makeReservation");
		return modelAndView;
	}

	/**
	 * @request
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/reservation/dateSold.do", method = RequestMethod.GET)
	@ResponseBody
	public String reservationDatePicker(HttpServletRequest request,
			HttpServletResponse response) {
		String isSoldOut = "";

		reservationService.datePicker(isSoldOut, request, response);

		return isSoldOut;
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

		modelAndView.setViewName("reservation/resolvationPay");
		return modelAndView;
	}
}
