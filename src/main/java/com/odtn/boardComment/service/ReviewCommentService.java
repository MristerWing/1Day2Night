package com.odtn.boardComment.service;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewCommentService {
	//댓글 작성
	public void insert(ModelAndView mav);
	//리스트
	public void list(ModelAndView mav);
}