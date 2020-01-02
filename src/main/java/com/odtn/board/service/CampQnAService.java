package com.odtn.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.board.dto.CampQnADto;
import com.odtn.member.dto.MemberDto;

public interface CampQnAService {
	public void write(ModelAndView mav,MemberDto memberDto,HttpSession session,CampQnADto campQnADto);
	//작성확인
	public void writeOk(ModelAndView mav);
	//리스트
	public void list(ModelAndView mav,HttpSession session,MemberDto memberDto);
	//글읽rl
	public void read(ModelAndView mav,MemberDto memberDto);
	//글삭제
	public void delete(ModelAndView mav);
	//글 수정
	public void update(ModelAndView mav,MemberDto memberDto);
	//글 수정확인
	public void updateOk(ModelAndView mav);
	//답글작성 
	public void writeAnswer(ModelAndView mav,MemberDto memberDto);
	//답글 작성 확인
	public void writeAnswerOk(ModelAndView mav);
	//비밀번호 입력 후 
	public void pwdCheck(ModelAndView mav);
}
