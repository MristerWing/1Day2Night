package com.odtn.board.service;

import org.springframework.web.servlet.ModelAndView;

public interface CampReviewService {
	//리뷰작성
	public void write(ModelAndView mav);
	//리뷰작성확인
	public void writeOk(ModelAndView mav);
	//목록
	public void list(ModelAndView mav);
	//읽기
	public void read(ModelAndView mav);
	//삭제
	public void delete(ModelAndView mav);
	//수정
	public void update(ModelAndView mav);
	//수정확인
	public void updateOk(ModelAndView mav);
}
