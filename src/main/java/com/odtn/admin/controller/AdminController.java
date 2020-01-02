package com.odtn.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.admin.service.AdminService;
import com.odtn.aop.LogAspect;
import com.odtn.board.dto.CampInfoDto;
import com.odtn.member.dto.MemberDto;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService; 
	
	@RequestMapping(value = "/admin/adminCheck.do", method = RequestMethod.GET)
	public ModelAndView adminCheck(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user_num", request.getSession().getAttribute("user_num"));

		adminService.adminCheck(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/list.do", method = RequestMethod.GET)
	public ModelAndView adminMemberList(HttpServletRequest request,HttpServletResponse response,MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("request", request);

		adminService.memberList(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/boardList.do", method = RequestMethod.GET)
	public ModelAndView adminBoardList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("request", request);
		
		adminService.boardInfo(mav);
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/boardreview.do", method = RequestMethod.GET)
	public ModelAndView adminBoardreview(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("request", request);
		
		adminService.boardReview(mav);

		return mav;
		
	}
	
	@RequestMapping(value = "/admin/boardQnA.do", method = RequestMethod.GET)
	public ModelAndView adminBoardQnA(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("request", request);
		
		adminService.boardQnA(mav);

		return mav;
		
	}
	
	@RequestMapping(value = "/admin/update.do", method = RequestMethod.GET)
	public ModelAndView adminUpdate(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.update(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/updateOk.do", method = RequestMethod.POST)
	public ModelAndView adminUpdateOk(HttpServletRequest request,HttpServletResponse response,MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("memberDto",memberDto);
		
		adminService.updateOk(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/delete.do", method = RequestMethod.GET)
	public ModelAndView adminSearch(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.delete(mav);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/deleteOk.do", method = RequestMethod.POST)
	public ModelAndView adminDeleteOk(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.deleteOk(mav);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/QnAdelete.do", method = RequestMethod.GET)
	public ModelAndView adminQnAdelete(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.QnAdelete(mav);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/QnAdeleteOk.do", method = RequestMethod.POST)
	public ModelAndView adminQnAdeleteOk(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.QnAdeleteOk(mav);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/reviewDelete.do", method = RequestMethod.GET)
	public ModelAndView reviewDelete(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.reviewDelete(mav);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/reviewDeleteOk.do", method = RequestMethod.POST)
	public ModelAndView reviewDeleteOk(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.reviewDeleteOk(mav);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/campInfodelete.do", method = RequestMethod.GET)
	public ModelAndView campInfodelete(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.campInfodelete(mav);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "/admin/infoDeleteOk.do", method = RequestMethod.POST)
	public ModelAndView infoDeleteOk(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		adminService.campInfodeleteOk(mav);
		
		
		return mav;
		
	}
	

}
