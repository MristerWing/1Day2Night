package com.odtn.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;
import com.odtn.board.service.CampInfoService;
import com.odtn.member.dto.MemberDto;

@Controller
public class CampInfoController {
	
	@Autowired
	private CampInfoService campInfoService;
	
	//글작성
	@RequestMapping(value = "board/campInfo/write.do", method = RequestMethod.GET)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		campInfoService.write(mav,memberDto,session);
		return mav;
	}
	//글 작성확인
	@RequestMapping(value= "board/campInfo/writeOk.do", method=RequestMethod.POST)
	public ModelAndView writeOk(HttpServletRequest request,HttpServletResponse response,
								CampInfoDto campInfoDto, CampInfoFileDto campInfoFileDto,MemberDto memberDto){
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("campInfoDto",campInfoDto);
		mav.addObject("campInfoFileDto", campInfoFileDto);
		campInfoService.writeOk(mav,memberDto);
		return mav;
		
	}
	//목록
	@RequestMapping(value = "board/campInfo/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response,HttpSession session,MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campInfoService.list(mav,session,memberDto);
		return mav;
	}
	//검색해서 목록찾기
	@RequestMapping(value = "board/campInfo/searchList.do", method = RequestMethod.GET)
	public ModelAndView serchList(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
	
		mav.addObject("request",request);
		campInfoService.serchList(mav);
		return mav;
	}
	//글 읽기
	@RequestMapping(value = "board/campInfo/read.do", method = RequestMethod.GET)
	public ModelAndView read(HttpServletRequest request,HttpServletResponse response,MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campInfoService.read(mav,memberDto);
		
		return mav;
	}
	//파일 다운로드
	@RequestMapping(value = "board/campInfo/downLoad.do",method = RequestMethod.GET)
	public ModelAndView downLoad(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		campInfoService.downLoad(mav);
		return mav;
	}
	//삭제게시판
	@RequestMapping(value = "board/campInfo/delete.do",method = RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		campInfoService.delete(mav);
		return mav;
	}
	//수정=> 내용불러오기
	@RequestMapping(value = "board/campInfo/update.do",method = RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response,
							   HttpSession session,MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		campInfoService.update(mav,session,memberDto);
		return mav;
	}
	//수정확인
	@RequestMapping(value = "board/campInfo/updateOk.do",method = RequestMethod.POST)
	public ModelAndView updateOk(HttpServletRequest request, HttpServletResponse response, CampInfoDto campInfoDto, CampInfoFileDto campInfoFileDto) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("campInfoDto",campInfoDto);
		mav.addObject("campInfoFileDto", campInfoFileDto);
		campInfoService.updateOk(mav);
		return mav;
	}
}
