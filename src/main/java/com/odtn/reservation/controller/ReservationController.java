package com.odtn.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	
	@RequestMapping(value = "/reservation/list.do", method = RequestMethod.GET)
	public ModelAndView reservationRead(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reservation/makeReservation");

		return mav;
		
	}
}
