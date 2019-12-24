package com.odtn.reservation.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ReservationService {

	public void reservationSelect(ModelAndView modelAndView);

	public ArrayList<HashMap<String, Object>> datePicker(
			HttpServletRequest request, HttpServletResponse response);

	public void reservationPay(ModelAndView modelAndView);
}
