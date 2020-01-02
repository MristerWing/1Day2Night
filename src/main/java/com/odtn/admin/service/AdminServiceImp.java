package com.odtn.admin.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.admin.dao.AdminDao;
import com.odtn.admin.dto.AdminDto;
import com.odtn.aop.LogAspect;
import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampQnADto;
import com.odtn.board.dto.CampReviewDto;
import com.odtn.member.dto.MemberDto;

@Component
public class AdminServiceImp implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	
	@Override
	public void adminCheck(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		AdminDto adminDto = new AdminDto();
		
		int user_num = (Integer) map.get("user_num");
		
		LogAspect.logger.info(LogAspect.logMsg+ user_num);
		adminDto.setUser_num(user_num);
		
		int adminCheck = adminDao.adminCheck(adminDto);
		LogAspect.logger.info(LogAspect.logMsg+adminCheck);
		
		mav.addObject("adminCheck",adminCheck);
		mav.setViewName("admin/adminCheck.empty");
	}
	
	
	@Override
	public void memberList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		

			List<MemberDto> memberList = null;
		
			memberList = adminDao.memberList();
			LogAspect.logger.info(LogAspect.logMsg+memberList);
		
		request.setAttribute("memberList", memberList);

		mav.setViewName("admin/list.empty");
		
	}

	@Override
	public void update(ModelAndView mav) {
		// TODO Auto-generated method stub
		//회원 , 게시판 수정 삭제 시 테이블의 PK값 을 가지고와서
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int user_num =Integer.parseInt(request.getParameter("user_num"));
		
		MemberDto memberDto=adminDao.adminRead(user_num);
		LogAspect.logger.info(LogAspect.logMsg+memberDto.toString());
		
		mav.addObject("memberDto",memberDto);
		
		mav.setViewName("admin/update.empty");
		
	}
	
	@Override
	public void updateOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto =  (MemberDto) map.get("memberDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int check = adminDao.updateOk(memberDto);
		LogAspect.logger.info(LogAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.setViewName("admin/updateOk.empty");
	}
	
	@Override
	public void delete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int user_num=Integer.parseInt(request.getParameter("user_num"));
		
		MemberDto memberDto = adminDao.adminRead(user_num);
		LogAspect.logger.info(LogAspect.logMsg+memberDto.toString());
		
		mav.addObject("memberDto",memberDto);

		mav.setViewName("admin/delete.empty");
	}
	@Override
	public void deleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int user_num=Integer.parseInt(request.getParameter("user_num"));
		
		//AdminDto adminDto = adminDao.adminRead(user_num);
		
		int check = adminDao.deleteOk(user_num);
		LogAspect.logger.info(LogAspect.logMsg+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("admin/deleteOk.empty");
		
	}
	
	@Override
	public void boardInfo(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<CampInfoDto> BoardInfoList = null;
		
		BoardInfoList = adminDao.BoardInfoList();
		LogAspect.logger.info(LogAspect.logMsg+BoardInfoList);
	
		request.setAttribute("BoardInfoList", BoardInfoList);

		mav.setViewName("admin/boardinfo.empty");
	}
	
	@Override
	public void boardReview(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<CampReviewDto> boardReviewList = null;
		
		boardReviewList = adminDao.boardReviewList();
		LogAspect.logger.info(LogAspect.logMsg+boardReviewList);
	
		request.setAttribute("boardReviewList", boardReviewList);
	
		mav.setViewName("admin/boardreview.empty");
	}
	
	@Override
	public void boardQnA(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<CampQnADto> boardQnAList = null;
		
		boardQnAList = adminDao.boardQnAList();
		LogAspect.logger.info(LogAspect.logMsg+boardQnAList);
	
		request.setAttribute("boardQnAList", boardQnAList);
	
		mav.setViewName("admin/boardqna.empty");
	}
	
	@Override
	public void QnAdelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int qna_num=Integer.parseInt(request.getParameter("qna_num"));
		
		CampQnADto campQnADto = adminDao.QnARead(qna_num);
		LogAspect.logger.info(LogAspect.logMsg+campQnADto.toString());
		

		mav.addObject("campQnADto",campQnADto);
		mav.setViewName("admin/QnAdelete.empty");
	}
	
	@Override
	public void QnAdeleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int qna_num=Integer.parseInt(request.getParameter("qna_num"));
		
		int check = adminDao.QnAdeleteOk(qna_num);
		LogAspect.logger.info(LogAspect.logMsg+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("admin/QnAdeleteOk.empty");
		
	}
	
	@Override
	public void reviewDelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int review_num=Integer.parseInt(request.getParameter("review_num"));
		
		CampReviewDto campReviewDto = adminDao.campReviewRead(review_num);
		LogAspect.logger.info(LogAspect.logMsg+campReviewDto.toString());
		

		mav.addObject("campReviewDto",campReviewDto);
		mav.setViewName("admin/reviewDelete.empty");
	}
	
	@Override
	public void reviewDeleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int review_num=Integer.parseInt(request.getParameter("review_num"));
		
		int check = adminDao.reviewdeleteOk(review_num);
		LogAspect.logger.info(LogAspect.logMsg+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("admin/reviewDeleteOk.empty");
	}
	
	@Override
	public void campInfodelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int info_num=Integer.parseInt(request.getParameter("info_num"));
		
		CampInfoDto campInfoDto = adminDao.campInfoRead(info_num);
		LogAspect.logger.info(LogAspect.logMsg+campInfoDto.toString());
		

		mav.addObject("campInfoDto",campInfoDto);
		mav.setViewName("admin/infoDelete.empty");
	}
	
	@Override
	public void campInfodeleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object>map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int info_num=Integer.parseInt(request.getParameter("info_num"));
		
		int check = adminDao.infodeleteOk(info_num);
		LogAspect.logger.info(LogAspect.logMsg+check);
		
		mav.addObject("check",check);
		
		mav.setViewName("admin/reviewDeleteOk.empty");
	}
	
}
