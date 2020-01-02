package com.odtn.camping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.camping.dao.CampingDao;

@Component
public class CampingServiceImp implements CampingService {
	
	@Autowired
	private CampingDao campingDao;

	@Override
	public void getInfo(ModelAndView mav) {
		
		mav.addObject("campingDto", campingDao.getCampingDto());
		mav.addObject("campingList", campingDao.getCampingList());
	}
}
