package com.odtn.board.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.board.dao.CampInfoDao;

@Component
public class CampInfoServiceImp implements CampInfoService{
	@Autowired
	private CampInfoDao campInfoDao;
	
	@Override
	public void write(ModelAndView mav) {
		
	mav.setViewName("board/campInfo/write");	
	}
}
