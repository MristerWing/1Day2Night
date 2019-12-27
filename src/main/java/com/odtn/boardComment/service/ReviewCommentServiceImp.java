package com.odtn.boardComment.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.boardComment.dao.ReviewCommentDao;
import com.odtn.boardComment.dto.ReviewCommentDto;

@Component
public class ReviewCommentServiceImp implements ReviewCommentService {
	@Autowired
	private ReviewCommentDao reviewCommentDao;

	// 댓글작성
	@Override
	public void insert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		ReviewCommentDto reviewCommentDto = (ReviewCommentDto) map
				.get("reviewCommentDto");
		reviewCommentDto.setWrite_date(new Date());
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger.info(LogAspect.logMsg + "pageNumber : " + pageNumber);
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "원글 번호: " + review_num);
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "원글 작성 user_num: " + user_num);
		LogAspect.logger.info(LogAspect.logMsg + "원글 작성 user_num: " + user_num);
		reviewCommentDto.setUser_num(user_num);
		reviewCommentDto.setReview_num(review_num);

		LogAspect.logger
				.info(LogAspect.logMsg + "입력내용" + reviewCommentDto.toString());
		// 자료저장확인용 check
		int check = reviewCommentDao.insert(reviewCommentDto);
		LogAspect.logger.info(LogAspect.logMsg + "check값: " + check);

		mav.addObject("review_num", review_num);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("check", check);
		mav.setViewName("comment/reviewComment/insertOk.tiles");
	}
}
