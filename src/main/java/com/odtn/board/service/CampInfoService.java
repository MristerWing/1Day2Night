package com.odtn.board.service;

import org.springframework.web.servlet.ModelAndView;

public interface CampInfoService {
	//작성
	public void write(ModelAndView mav); 
	//작성확인
	public void writeOk(ModelAndView mav);
	//목록보기
	public void list(ModelAndView mav);
	//읽기
	public void read(ModelAndView mav);
	//파일다운로드
	public void downLoad(ModelAndView mav);
	//삭제메소드
	public void delete(ModelAndView mav);
	//수정
	public void update(ModelAndView mav);
	//수정확인
	public void updateOk(ModelAndView mav);
	
}
