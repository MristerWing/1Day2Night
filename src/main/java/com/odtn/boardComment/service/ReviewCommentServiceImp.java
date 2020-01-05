package com.odtn.boardComment.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public Map<String, Object> insert(ReviewCommentDto reviewCommentDto,HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
	    System.out.println("+++++++여기");
	   
		int review_num=Integer.parseInt(request.getParameter("review_num"));
		int comment_num=reviewCommentDao.getMaxNum(review_num);
		
		reviewCommentDto.setComment_num(comment_num+1);
		reviewCommentDto.setWrite_date(new Date());
		LogAspect.logger.info(LogAspect.logMsg + "댓글입력+++++" + reviewCommentDto.toString());
		int check = reviewCommentDao.insert(reviewCommentDto);
		
		map.put("check", check);
		map.put("reviewCommentDto", reviewCommentDto);
 
		LogAspect.logger.info(LogAspect.logMsg + "해당 글 번호:: " + reviewCommentDto.getComment_num());
		return map;
	}

	// 리스트
	@Override
	public Map<String, Object> list(HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
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

			for (int i = 0; i < reviewCommentList.size(); i++) {
				System.out.println("댓글 인덱스: " + i + reviewCommentList.get(i));
				int user_num = reviewCommentList.get(i).getUser_num();
				System.out.println("댓글 사용자번호" + user_num);
				String writer = reviewCommentDao.getUserName(user_num);
				if (writer == null) {
					writer = reviewCommentDao.getEmail(user_num);
					if (writer == null) {
						writer = reviewCommentDao.getNickName(user_num);
						System.out.println("리스트안의 작성자 " + writer);
					}
				}
				writerList.add(writer);
			}

		}
		map.put("reviewCommentList", reviewCommentList);
		map.put("writerList", writerList);
		return map;
	}
	//삭제
	@Override
	public int delete(int comment_num) {
		 return reviewCommentDao.delete(comment_num);
	}
	//수정확인
	@Override
	public int update(ReviewCommentDto reviewCommentDto) {
		
		return reviewCommentDao.update(reviewCommentDto);
	}
}