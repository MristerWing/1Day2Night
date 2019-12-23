package com.odtn.reservation.service;

import org.springframework.web.servlet.ModelAndView;

public interface ReservationService {

	public void reservationSelect(ModelAndView modelAndView);

	public void reservationPay(ModelAndView modelAndView);
}
