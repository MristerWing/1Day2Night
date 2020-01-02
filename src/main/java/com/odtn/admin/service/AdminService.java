package com.odtn.admin.service;

import org.springframework.web.servlet.ModelAndView;

public interface AdminService {
	public void adminCheck(ModelAndView mav);
	
	public void memberList(ModelAndView mav);
	public void update(ModelAndView mav);
	public void updateOk(ModelAndView mav);
	public void delete(ModelAndView mav);
	public void deleteOk(ModelAndView mav);
	
	public void boardInfo(ModelAndView mav);
	public void boardReview(ModelAndView mav);
	public void boardQnA(ModelAndView mav);
	public void QnAdelete(ModelAndView mav);
	public void QnAdeleteOk(ModelAndView mav);
	public void reviewDelete(ModelAndView mav);
	public void reviewDeleteOk(ModelAndView mav);
	public void campInfodelete(ModelAndView mav);
	public void campInfodeleteOk(ModelAndView mav);
}
