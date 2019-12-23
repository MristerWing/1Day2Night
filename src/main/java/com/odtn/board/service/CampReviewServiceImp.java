package com.odtn.board.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.board.dao.CampReviewDao;
import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;
import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;

@Component
public class CampReviewServiceImp implements CampReviewService{
	@Autowired
	private CampReviewDao campReviewDao;
	//작성
	@Override
	public void write(ModelAndView mav) {
		
		Map<String,Object>map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		mav.setViewName("board/campReview/write");
	}
	
	//작성확인
	@Override
	public void writeOk(ModelAndView mav) {
		Map<String,Object>map=mav.getModelMap();
		CampReviewDto campReviewDto =(CampReviewDto)map.get("campReviewDto");
		CampReviewFileDto campReviewFileDto=(CampReviewFileDto)map.get("campReviewFileDto");
		campReviewDto.setWrite_date(new Date());
		campReviewDto.setRead_count(0);
		//read페이지에서 member테이블 참조해서 닉네임가져오기구현핮기

		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		int user_number=Integer.parseInt(request.getParameter("user_number"));
		LogAspect.logger.info(LogAspect.logMsg+"설정된 멤버넘버: "+user_number);
		String writer=campReviewDao.getUser_name(user_number);
		LogAspect.logger.info(LogAspect.logMsg+"멤버이름 찾은값: "+writer);

		int camp_id=Integer.parseInt(request.getParameter("camp_id"));
		LogAspect.logger.info(LogAspect.logMsg+"캠핑장: "+camp_id);

		
		campReviewDto.setUser_number(user_number);
		campReviewDto.setCamp_id(camp_id);
		//첨부파일처리
		List<CampReviewFileDto> array = new ArrayList<CampReviewFileDto>();
		List<MultipartFile> fileList = request.getFiles("file");
		// 다중파일for문
		for (MultipartFile mf : fileList) {
			long file_size = mf.getSize();
			if (file_size != 0) {
				String file_name = Long.toString(System.currentTimeMillis()) + "_" + mf.getOriginalFilename();
				File path = new File("C:\\campingFile\\");
				path.mkdir();

				System.out.println(file_name);
				if (path.exists() && path.isDirectory()) {
					File file = new File(path, file_name);
					try {
						mf.transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}
					CampReviewFileDto camp = new CampReviewFileDto();
					camp.setFile_name(file_name);
					camp.setFile_size(file_size);
					camp.setPath(file.getAbsolutePath());
					array.add(camp);
				}
			}
		}
		LogAspect.logger.info(LogAspect.logMsg+"리뷰파일리스트: "+array);
		LogAspect.logger.info(LogAspect.logMsg+"입력값: "+campReviewDto.toString());
		
		int check=campReviewDao.writeOk(campReviewDto,array);
		LogAspect.logger.info(LogAspect.logMsg+"작성 check: "+check);
		
		mav.addObject("check",check);
		mav.setViewName("board/campReview/writeOk");
	}
	@Override
	//리뷰 목록
	public void list(ModelAndView mav) {
		
		  Map<String,Object> map=mav.getModel(); 
		  HttpServletRequest request=(HttpServletRequest)map.get("request");
		  
		  String pageNumber=request.getParameter("pageNumber"); 
		  if(pageNumber==null ||pageNumber=="") pageNumber="1";
		  
		  int currentPage = Integer.parseInt(pageNumber);
		  
		  int count=campReviewDao.getCount(); 
		 LogAspect.logger.info(LogAspect.logMsg+"전체 글 개수: "+count);
			
		 int boardSize=10;
		 int startRow=(currentPage-1)*boardSize+1;
		 LogAspect.logger.info(LogAspect.logMsg+"startRow : "+startRow);
		 int endRow=currentPage*boardSize;
		 LogAspect.logger.info(LogAspect.logMsg+"endRow : "+endRow);
		 
		 //글목록 리스트로받기
		 List<CampReviewDto> campReviewList=null;
		 if(count>0) {
			 campReviewList=campReviewDao.getCampReviewList(startRow,endRow);
			 LogAspect.logger.info(LogAspect.logMsg+"리뷰 리스트 사이즈: "+campReviewList.size());
			/*
			 * for (int i = 0; i < campReviewList.size(); i++) { int
			 * review_num=Integer.parseInt(request.getParameter("review_num")); //대표이미지 경로
			 * 불러오기
			 * 
			 * CampReviewFileDto campReviewFileDto=new CampReviewFileDto(); int
			 * fileCount=campReviewDao.imgCount(review_num); if(fileCount>0) { String
			 * path=campReviewFileDto.getPath();
			 * LogAspect.logger.info(LogAspect.logMsg+"이미지 경로: "+path);
			 * request.setAttribute("campReviewFileDto", campReviewFileDto);
			 * 
			 * } }
			 */
		 }
		 request.setAttribute("currentPage",currentPage);
		 request.setAttribute("count",count);
		 request.setAttribute("boardSize",boardSize);
		 request.setAttribute("campReviewList",campReviewList);
		 mav.setViewName("board/campReview/list");
	}
	//글읽기
	@Override
	public void read(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		  int review_num = Integer.parseInt(request.getParameter("review_num"));
		  LogAspect.logger.info(LogAspect.logMsg + "글번호: " + review_num);
		  
		  int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		  LogAspect.logger.info(LogAspect.logMsg + "페이지: " + pageNumber);
		  
		  CampReviewDto campReviewDto = campReviewDao.read(review_num);
		  LogAspect.logger.info(LogAspect.logMsg + "불러온 글: " +
		  campReviewDto.toString());
		  
		  mav.addObject("campReviewDto",campReviewDto);
		  mav.addObject("pageNumber",pageNumber);
		  mav.setViewName("board/campReview/read");
		 
	}
	//글 삭제 
	@Override
	public void delete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "게시글 번호: " + review_num);

		// 파일을 서버에서 지워주기.
		/* CampInfoFileDto campInfoFileDto = campInfoDao.slectFile(info_num); */
		CampReviewFileDto campReviewFileDto = new CampReviewFileDto();
		int check = campReviewDao.delete(review_num);

		if (check > 0 && campReviewFileDto.getFile_name() != null) {
			File file = new File(campReviewFileDto.getPath());
			if (file.exists() && file.isFile())
				file.delete();
		}
		LogAspect.logger.info(LogAspect.logMsg + "삭제check: " + check);

		mav.addObject("check", check);
		mav.setViewName("board/campReview/delete");	
	}

	@Override
	public void update(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정할글 번호:  " + review_num);
		// 페이지번호
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger.info(LogAspect.logMsg + "수정할 글의 페이지번호:  " + pageNumber);

		CampReviewDto campReviewDto =campReviewDao.update(review_num);
		LogAspect.logger.info(LogAspect.logMsg + "수정할 글 내용:  " + campReviewDto.toString());

		// 파일이있는지여부확인
		CampReviewFileDto campReviewFileDto=null;
		int check=campReviewDao.imgCount(review_num);
		LogAspect.logger.info(LogAspect.logMsg + "대표이미지 있는지: " + check);
		if (check > 0) {
			String file_name=campReviewDao.getFileName(review_num);
			LogAspect.logger.info(LogAspect.logMsg + "이미지 이름: " + file_name);
			mav.addObject("file_name", file_name);
		}
		mav.addObject("campReviewDto", campReviewDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/campReview/update");
	}
	//수정확인
	@Override
	public void updateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		CampReviewDto campReviewDto = (CampReviewDto) map.get("campReviewDto");
		LogAspect.logger.info(LogAspect.logMsg + "campReviewDto 수정: " + campReviewDto.toString());
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정 게시판번호: " + review_num);
		// 파일처리
		CampReviewFileDto campReviewFileDto=new CampReviewFileDto();
		MultipartFile mf = request.getFile("file");
		long file_size = mf.getSize();
		LogAspect.logger.info(LogAspect.logMsg+"파일크기"+file_size);
		// 시간으로 파일이름 정하기
		if (file_size != 0) {
			int check = campReviewDao.fileDelete(review_num);
			LogAspect.logger.info(LogAspect.logMsg + "파일삭제값 : " + check);
			if (check>0) {
				String file_name = Long.toString(System.currentTimeMillis()) + "_" + mf.getOriginalFilename();
				if(file_name==null || file_name.equals(""));
				// 파일경로설정
				File path = new File("C:\\campingFile\\");
				path.mkdir();
				LogAspect.logger.info(LogAspect.logMsg+"수정할 파일명: "+file_name);
				// 경로가있고 파일이 살아있으면
				if (path.exists() && path.isDirectory()) {
					File file = new File(path, file_name);
					try {
						mf.transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}
					campReviewFileDto.setReview_num(review_num);
					campReviewFileDto.setFile_name(file_name);
					campReviewFileDto.setFile_size(file_size);
					campReviewFileDto.setPath(file.getAbsolutePath());
				}
			}
	}
		// 자료저장확인용 check
		int updateCheck = campReviewDao.updateOk(campReviewDto, campReviewFileDto);
		LogAspect.logger.info(LogAspect.logMsg + "campReviewDto값: " + campReviewDto.toString());
		LogAspect.logger.info(LogAspect.logMsg + "check값: " + updateCheck);
		
		mav.addObject("check", updateCheck);
		mav.setViewName("board/campReview/updateOk");	
}
}