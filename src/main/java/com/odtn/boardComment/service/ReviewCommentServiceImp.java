package com.odtn.boardComment.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

	// 리스트
	@Override
	public void list(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "해당 글 번호:: " + review_num);

		int count = reviewCommentDao.listCount();
		LogAspect.logger.info(LogAspect.logMsg + "전체 글 개수: " + count);

		// 글목록 리스트로받기
		List<String> writerList = new ArrayList<String>();
		List<ReviewCommentDto> reviewCommentList = null;
		if (count > 0) {
			reviewCommentList = reviewCommentDao.getCommentList(review_num);
			LogAspect.logger.info(LogAspect.logMsg + "댓글 리스트 사이즈: "
					+ reviewCommentList.size());

			/*
			 * for (int i = 0; i < reviewCommentList.size(); i++) {
			 * System.out.println("댓글 인덱스: "+i+reviewCommentList.get(i)); int
			 * user_num=reviewCommentList.get(i).getUser_num();
			 * System.out.println("댓글 사용자번호"+user_num); String
			 * writer=reviewCommentDao.getUserName(user_num); if(writer==null) {
			 * writer=reviewCommentDao.getEmail(user_num); if (writer==null) {
			 * writer=reviewCommentDao.getNickName(user_num);
			 * System.out.println("리스트안의 작성자 "+writer); } }
			 * writerList.add(writer); }
			 */
		}
	}
}