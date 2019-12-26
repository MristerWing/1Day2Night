package com.odtn.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.odtn.member.dto.MemberDto;

public interface CampInfoService {
	//작성
	public void write(ModelAndView mav,MemberDto memberDto,HttpSession session); 
	//작성확인
	public void writeOk(ModelAndView mav,MemberDto memberDto);
	//목록보기
	public void list(ModelAndView mav,HttpSession session,MemberDto memberDto);
	//읽기
	public void read(ModelAndView mav,MemberDto memberDto);
	//파일다운로드
	public void downLoad(ModelAndView mav);
	//삭제메소드
	public void delete(ModelAndView mav);
	//수정
	public void update(ModelAndView mav,HttpSession session,MemberDto memberDto);
	//수정확인
	public void updateOk(ModelAndView mav);
	
}
