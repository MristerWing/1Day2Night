package com.odtn.member.service;

import org.springframework.web.servlet.ModelAndView;

import com.odtn.member.dto.MemberDto;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberService {
	public void memberWriteOk(ModelAndView mav);
	public void getDtoEmailAuth(ModelAndView mav);
	public MemberDto updateEmail_auth_status(ModelAndView mav);
	
	public void memberLoginOk(ModelAndView mav);
	public void memberDeleteOk(ModelAndView mav);
	public void kakaoDeleteOk(ModelAndView mav);
	
	public String kakaoGetAccessToken(String authorize_code);
	public void kakaoGetUserInfo(String access_Token, ModelAndView mav);
	public void kakaoLogout(String access_Token);
	
	public void memberWriteInfo(ModelAndView mav);
	
}