package com.odtn.boardComment.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewCommentService {
	//댓글 작성
	public void insert(ModelAndView mav);
	//리스트
	public Map<String, Object> list(HttpServletRequest request);
}
