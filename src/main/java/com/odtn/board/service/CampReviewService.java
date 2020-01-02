package com.odtn.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.odtn.member.dto.MemberDto;

public interface CampReviewService {
	// 리뷰작성
	public void write(ModelAndView mav, HttpSession session,
			MemberDto memberDto);

	// 리뷰작성확인
	public void writeOk(ModelAndView mav, MemberDto memberDto);

	// 목록
	public void list(ModelAndView mav, HttpSession session,
			MemberDto memberDto);

	// 검색목록
	public void searchList(ModelAndView mav);

	// 읽기
	public void read(ModelAndView mav);

	// 삭제
	public void delete(ModelAndView mav);

	// 수정
	public void update(ModelAndView mav, MemberDto memberDto,
			HttpSession session);

	// 수정확인
	public void updateOk(ModelAndView mav);
}
