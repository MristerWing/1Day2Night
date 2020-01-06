package com.odtn.reservation.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ReservationService {

	public void reservationSelect(ModelAndView modelAndView);

	public ArrayList<HashMap<String, Object>> datePicker(
			HttpServletRequest request, HttpServletResponse response);

	public void reservationPay(ModelAndView modelAndView);

	public String reservationDoPay(Map<String, Object> reservationMap);

	public String getOwnerName(String camp_id);

	public void reservationCheck(int user_num, ModelAndView modelAndView);

	public void reservationDelete(int user_num, String deleteList,
			ModelAndView modelAndView);
}
