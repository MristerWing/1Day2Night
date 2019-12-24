package com.odtn.reservation.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ReservationService {

	public void reservationSelect(ModelAndView modelAndView);

	public void datePicker(String isSoldOut, HttpServletRequest request,
			HttpServletResponse response);

	public void reservationPay(ModelAndView modelAndView);
}
