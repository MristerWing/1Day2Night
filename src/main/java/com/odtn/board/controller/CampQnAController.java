package com.odtn.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;
import com.odtn.board.dto.CampQnADto;
import com.odtn.board.service.CampQnAService;
import com.odtn.member.dto.MemberDto;

@Controller
public class CampQnAController {
	
	@Autowired
	private CampQnAService campQnAService;
	
	//글작성 
	@RequestMapping(value = "board/campQnA/write.do", method = RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto,HttpSession session,CampQnADto campQnADto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campQnAService.write(mav,memberDto,session,campQnADto);
		return mav;
	}
	
	//글 작성확인
		@RequestMapping(value= "board/campQnA/writeOk.do", method=RequestMethod.POST)
		public ModelAndView writeOk(HttpServletRequest request,HttpServletResponse response,
									CampQnADto campQnADto){
		
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("campQnADto",campQnADto);
			campQnAService.writeOk(mav);
			return mav;			
		}
	//작성글 리스트
		@RequestMapping (value = "board/campQnA/list.do", method = RequestMethod.GET)
		public ModelAndView list(HttpServletRequest request, HttpServletResponse response,
								CampQnADto campQnADto,HttpSession session,MemberDto memberDto) {
				ModelAndView mav=new ModelAndView();
				mav.addObject("request",request);
				campQnAService.list(mav,session,memberDto);
				return mav;
		}
	//해당 글 검색 (작성자로 검색)
		@RequestMapping(value = "board/campQnA/searchList.do", method = RequestMethod.GET)
		public ModelAndView searchList(HttpServletRequest request,HttpServletResponse response) {
			ModelAndView mav=new ModelAndView();
			System.out.println("컨트롤러");
			mav.addObject("request",request);
			campQnAService.searchList(mav);
			return mav;
		}
		
	// 해당 글 읽기
		@RequestMapping(value = "board/campQnA/read.do",method = RequestMethod.GET  )
		public ModelAndView read(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto) {
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			campQnAService.read(mav,memberDto);
			return mav;
		}
		
	//해당 글 삭제
		@RequestMapping(value = "board/campQnA/delete.do",method=RequestMethod.GET)
		public ModelAndView delete (HttpServletRequest request, HttpServletResponse response) {
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			campQnAService.delete(mav);
			return mav;
		}
	//수정 글 읽어오기
		@RequestMapping (value = "board/campQnA/update.do",method = RequestMethod.GET)
		public ModelAndView upadate(HttpServletRequest request,HttpServletResponse response,MemberDto memberDto) {
			ModelAndView mav=new ModelAndView();
			mav.addObject("request", request);
			campQnAService.update(mav,memberDto);
			return mav;
		}
		
	//수정확인 
		@RequestMapping(value = "board/campQnA/updateOk.do",method = RequestMethod.POST)
		public ModelAndView updateOk(HttpServletRequest request, HttpServletResponse response, CampQnADto campQnADto) {
			
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("campQnADto",campQnADto);
			campQnAService.updateOk(mav);
			return mav;
		}
	//답글달기
		@RequestMapping(value = "board/campQnA/writeAnswer.do", method = RequestMethod.GET)
		public ModelAndView writeAnswer(HttpServletRequest request,HttpServletResponse response,MemberDto memberDto) {
			ModelAndView mav=new ModelAndView();
			System.out.println("답글컨트롤러");
			mav.addObject("request",request);
			campQnAService.writeAnswer(mav,memberDto);
			return mav;
		}
	//답글 작성 확인
		@RequestMapping(value= "board/campQnA/writeAnswerOk.do", method=RequestMethod.POST)
		public ModelAndView writeAnswerOk(HttpServletRequest request,HttpServletResponse response,
									CampQnADto campQnADto){
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("campQnADto",campQnADto);
			campQnAService.writeAnswerOk(mav);
			return mav;			
		}
	//목록에서 비밀번호 입력하고 글 얻어오기 
		@RequestMapping(value ="board/campQnA/pwdCheck.do",method = RequestMethod.GET)
		public ModelAndView pwdCheck(HttpServletRequest request, HttpServletResponse response,CampQnADto campQnADto) {
	
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			mav.addObject("campQnADto",campQnADto);
			campQnAService.pwdCheck(mav);
			return mav;
		}
}
