package com.odtn.boardComment.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.odtn.boardComment.dto.ReviewCommentDto;

public interface ReviewCommentService {
	//댓글 작성
	public Map<String, Object> insert (ReviewCommentDto reviewCommentDto, HttpServletRequest request);
	//리스트
	public Map<String, Object> list(HttpServletRequest request);
	//삭제
	public int delete(int comment_num);
	//업데이트
	public int update(ReviewCommentDto reviewCommentDto);
}
