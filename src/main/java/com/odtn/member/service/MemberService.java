package com.odtn.member.service;

import org.springframework.web.servlet.ModelAndView;

import com.odtn.member.dto.MemberDto;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberService {
	public void memberWriteOk(ModelAndView mav);
	public void getDtoEmailAuth(ModelAndView mav);
	public void emailSender(ModelAndView mav);
	public MemberDto updateEmail_auth_status(ModelAndView mav);
	
	public int emailDupCheck(String email);
	public int passwordCheck(String email, String password);
	public void memberLoginOk(ModelAndView mav);
	public void memberDeleteOk(ModelAndView mav);
	public void kakaoDeleteOk(ModelAndView mav);
	
	public String kakaoGetAccessToken(String authorize_code);
	public void kakaoGetUserInfo(String access_Token, ModelAndView mav);
	public void kakaoLogout(String access_Token);
	
//	public void memberUpdate(ModelAndView mav);
	public void memberUpdateP(ModelAndView mav);
	public void memberUpdateOk(ModelAndView mav, HttpSession session);
	public void memberKakaoUpdate(ModelAndView mav, HttpSession session);
	public void kakaoMemberUpdateOk(ModelAndView mav, HttpSession session);
	public int nicknameDuplCheck(String nickname);
}