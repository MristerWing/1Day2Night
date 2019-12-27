package com.odtn.board.service;

import java.io.File;
import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.board.dao.CampQnADao;
import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;
import com.odtn.board.dto.CampQnADto;
import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;
import com.odtn.member.dto.MemberDto;

@Component
public class CampQnAServiceImp implements CampQnAService {
	
	@Autowired
	private CampQnADao campQnADao; 
	
	//문의글 작성
	@Override
	public void write(ModelAndView mav, MemberDto memberDto, HttpSession session,CampQnADto campQnADto) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		LogAspect.logger.info(LogAspect.logMsg+"user_num"+request.getSession().getAttribute("user_num"));
		int user_num=(Integer) request.getSession().getAttribute("user_num");
		String writer=campQnADao.getNickName(user_num);
		if(writer==null) {
			writer=campQnADao.getProfileName(user_num);
		}
		System.out.println(writer);
		
		int qna_num=0;
		int group_num=1;
		int sequence_num=0;
		int sequence_level=0;
		
		if(request.getParameter("qna_num")!=null) {
			qna_num=Integer.parseInt(request.getParameter("qna_num"));
			group_num=Integer.parseInt(request.getParameter("group_num"));
			sequence_num=Integer.parseInt(request.getParameter("sequence_num"));
			sequence_level=Integer.parseInt(request.getParameter("sequence_level"));	
		}
		
		
		request.setAttribute("writer", writer);
		request.setAttribute("qna_num", qna_num);
		request.setAttribute("group_num", group_num);
		request.setAttribute("sequence_num", sequence_num);
		request.setAttribute("sequence_level", sequence_level);
		mav.setViewName("board/campQnA/write");	
	}
	//글 작성확인
	@Override
	public void writeOk(ModelAndView mav) {
		Map<String, Object>map=mav.getModelMap();
		CampQnADto campQnADto=(CampQnADto)map.get("campQnADto");
		//HttpServletRequest request=(HttpServletRequest)map.get("request");
		campQnAwriteNum(campQnADto);
		campQnADto.setWrite_date(new Date());
		campQnADto.setRead_count(0);
		LogAspect.logger.info(LogAspect.logMsg+"입력: "+campQnADto.toString());
		
		int check=campQnADao.writeOk(campQnADto);
		LogAspect.logger.info(LogAspect.logMsg+"입력확인 check: "+check);
		
		mav.addObject("check",check);
		mav.setViewName("board/campQnA/writeOk");	
	}
	
	//글작성시 답글 작성을 위해서 열리는 메소드
	public void campQnAwriteNum(CampQnADto campQnADto) {
		int qna_num=campQnADto.getQna_num();
		int group_num=campQnADto.getGroup_num();
		int sequence_num=campQnADto.getSequence_num();
		int sequence_level=campQnADto.getSequence_level();
		if(qna_num == 0) {
			int maxNum=campQnADao.getQnAMaxNum();
			LogAspect.logger.info(LogAspect.logMsg+"maxNum: "+maxNum);
			if(maxNum != 0) 
				campQnADto.setGroup_num(maxNum+1);
		}
		LogAspect.logger.info(LogAspect.logMsg+qna_num+" "+group_num+" "+sequence_num+" "+sequence_level);
	}
	//리스트
	@Override
	public void list(ModelAndView mav, HttpSession session, MemberDto memberDto) {
		LogAspect.logger.info(LogAspect.logMsg+"세션되어있는 user_num: "+session.getAttribute("user_num"));
		
		  Map<String,Object> map=mav.getModel(); 
		  HttpServletRequest request=(HttpServletRequest)map.get("request");
		  //작성자 찾기
		  String pageNumber=request.getParameter("pageNumber"); 
		  if(pageNumber==null ||pageNumber=="") pageNumber="1";
		  
		  int currentPage = Integer.parseInt(pageNumber);
		  
		  int count=campQnADao.getCount(); 
		 LogAspect.logger.info(LogAspect.logMsg+"전체 글 개수: "+count);
			
		 int boardSize=10;
		 int startRow=(currentPage-1)*boardSize+1;
		 LogAspect.logger.info(LogAspect.logMsg+"startRow : "+startRow);
		 int endRow=currentPage*boardSize;
		 LogAspect.logger.info(LogAspect.logMsg+"endRow : "+endRow);
		 
		 //글목록 리스트로받기
		 List<String> writerList=new ArrayList<String>();
		 List<CampQnADto> campQnAList=null;
		 if(count>0) {
			 campQnAList=campQnADao.getCampQnAList(startRow,endRow);
			 LogAspect.logger.info(LogAspect.logMsg+"리뷰 리스트 사이즈: "+campQnAList.size());
			 LogAspect.logger.info(LogAspect.logMsg+"endRow : "+endRow);
			for (int i = 0; i < campQnAList.size(); i++) {
				System.out.println("리스트 인덱스: "+i+campQnAList.get(i));
				int user_num=campQnAList.get(i).getUser_num();
				System.out.println("리스트안의 usernum"+user_num);
				String writer=campQnADao.getNickName(user_num);
				if(writer==null) {
					writer=campQnADao.getProfileName(user_num);
				}
					writerList.add(writer);
				System.out.println("리스트안의 작성자 "+writer);
			}
		 }
		 
		 request.setAttribute("currentPage",currentPage);
		 request.setAttribute("count",count);
		 request.setAttribute("boardSize",boardSize);
		 request.setAttribute("campQnAList",campQnAList);
		 request.setAttribute("writerList",writerList);
		 
		 mav.setViewName("board/campQnA/list");
	}	
	//글 읽기
	@Override
	public void read(ModelAndView mav, MemberDto memberDto) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
	
		  int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		  LogAspect.logger.info(LogAspect.logMsg + "글번호: " + qna_num);
		  
		  int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		  LogAspect.logger.info(LogAspect.logMsg + "페이지: " + pageNumber);
		  
		  CampQnADto campQnADto = campQnADao.read(qna_num);
		  
		  int user_num=campQnADto.getUser_num();
		  LogAspect.logger.info(LogAspect.logMsg + "글번호: " + user_num);
		  String writer=campQnADao.getNickName(user_num);
		  LogAspect.logger.info(LogAspect.logMsg+"설정된 user_name: "+writer);
		  if(writer==null) {
			  writer=campQnADao.getProfileName(user_num);
		  }
		  LogAspect.logger.info(LogAspect.logMsg + "불러온 글: " +
				  campQnADto.toString());
		  
		  mav.addObject("campQnADto",campQnADto);
		  mav.addObject("writer",writer);
		  mav.addObject("pageNumber",pageNumber);
		  mav.setViewName("board/campQnA/read");
	}
	//글삭제
	@Override
	public void delete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		LogAspect.logger.info(LogAspect.logMsg + "게시글 번호: " + qna_num);

		int check = campQnADao.delete(qna_num);

		mav.addObject("check", check);
		mav.setViewName("board/campReview/delete");	
		
		mav.setViewName("board/campQnA/delete");
	}
	//글 수정
	@Override
	public void update(ModelAndView mav, MemberDto memberDto) {
		
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정할글 번호:  " + qna_num);
		// 페이지번호
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger.info(LogAspect.logMsg + "수정할 글의 페이지번호:  " + pageNumber);

		CampQnADto campQnADto =campQnADao.update(qna_num);
		LogAspect.logger.info(LogAspect.logMsg + "수정할 글 내용:  " + campQnADto.toString());

		int user_num=Integer.parseInt(request.getParameter("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정글 작성 자: " + user_num);
		
		String writer=campQnADao.getNickName(user_num);
		if(writer==null) {
			writer=campQnADao.getProfileName(user_num);
		}
		
		mav.addObject("writer", writer);
		mav.addObject("campQnADto", campQnADto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/campQnA/update");
	}
	//글 수정확인
	@Override
	public void updateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		CampQnADto campQnADto = (CampQnADto) map.get("campQnADto");

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정 게시판번호: " + qna_num);

		// 자료저장확인용 check
		int check = campQnADao.updateOk(campQnADto);
		LogAspect.logger.info(LogAspect.logMsg + "check값: " + check);

		mav.addObject("check", check);
		mav.setViewName("board/campQnA/updateOk");
	}

	 //답글작성
	   @Override
	   public void writeAnswer(ModelAndView mav, MemberDto memberDto) {
	      Map<String,Object> map=mav.getModelMap();
	      HttpServletRequest request=(HttpServletRequest)map.get("request");
	      
	      int qna_num = Integer.parseInt(request.getParameter("qna_num"));
	      LogAspect.logger.info(LogAspect.logMsg + "수정할글 번호:  " + qna_num);
	      // 페이지번호
	      int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	      LogAspect.logger.info(LogAspect.logMsg + "수정할 글의 페이지번호:  " + pageNumber);

	      CampQnADto campQnADto =campQnADao.update(qna_num);
	      LogAspect.logger.info(LogAspect.logMsg + "답글 내용:  " + campQnADto.toString());

	      int user_num=Integer.parseInt(request.getParameter("user_num"));
	      LogAspect.logger.info(LogAspect.logMsg + "수정글 작성 자: " + user_num);
	      String writer=campQnADao.getNickName(user_num);
	      if(writer==null) {
	         writer=campQnADao.getProfileName(user_num);
	      }
	      
	      String password=campQnADto.getPassword();
	      LogAspect.logger.info(LogAspect.logMsg + "수정글password: " + password);
	      
	      int group_num=Integer.parseInt(request.getParameter("group_num"));
	      int sequence_num=Integer.parseInt(request.getParameter("sequence_num"));
	      int sequence_level=Integer.parseInt(request.getParameter("sequence_level"));   
	      
	      
	      mav.addObject("user_num", user_num);
	      mav.addObject("group_num", group_num);
	      mav.addObject("sequence_num", sequence_num);
	      mav.addObject("sequence_level", sequence_level);
	      mav.addObject("qna_num", qna_num);
	      mav.addObject("writer", writer);
	      mav.addObject("campQnADto", campQnADto);
	      mav.addObject("pageNumber", pageNumber);
	      mav.addObject("password", password);
	      mav.setViewName("board/campQnA/writeAnswer");
	   }
	//답글작성확인
	@Override
	public void writeAnswerOk(ModelAndView mav) {
		Map<String, Object>map=mav.getModelMap();
		CampQnADto campQnADto=(CampQnADto)map.get("campQnADto");
		//HttpServletRequest request=(HttpServletRequest)map.get("request");
		campQnAwriteNum(campQnADto);
		campQnADto.setWrite_date(new Date());
		campQnADto.setRead_count(0);
		LogAspect.logger.info(LogAspect.logMsg+"입력: "+campQnADto.toString());
		
		int check=campQnADao.writeAnswerOk(campQnADto);
		LogAspect.logger.info(LogAspect.logMsg+"입력확인 check: "+check);
		
		mav.addObject("check",check);
		mav.setViewName("board/campQnA/writeAnswerOk");	
	}
	
}
