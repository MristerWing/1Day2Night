package com.odtn.member.service;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.member.dao.MemberDao;

import javax.servlet.http.HttpServletRequest;
@Component
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public void memberWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String email_id = request.getParameter("email_id");
		String password = request.getParameter("password");
		
	}
}