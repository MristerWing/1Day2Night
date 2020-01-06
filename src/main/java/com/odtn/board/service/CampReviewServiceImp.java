package com.odtn.board.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;
import com.odtn.aop.LogAspect;
import com.odtn.board.dao.CampReviewDao;
import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;
import com.odtn.member.dto.MemberDto;
import com.odtn.reservation.dto.ReservationDto;

@Component
public class CampReviewServiceImp implements CampReviewService {
	@Autowired
	private CampReviewDao campReviewDao;

	// 작성
	@Override
	public void write(ModelAndView mav, HttpSession session,
			MemberDto memberDto) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int user_num = (Integer) session.getAttribute("user_num");
		LogAspect.logger.info(LogAspect.logMsg + "로그인된user_num: " + user_num);
		
		int bookingCnt =campReviewDao.getBookingCnt(user_num);
		System.out.println("예약내역 개수"+bookingCnt);
		
		
		//캠핑장 뿌려주기 
		List<ReservationDto> campList =null;
		List<String> campNameList=new ArrayList<String>();
		if (bookingCnt>0) {
			campList=campReviewDao.getcampList(user_num);
			for (int i = 0; i < campList.size(); i++) {
				int camp_id=campList.get(i).getCamp_id();
				System.out.println("캠프id: "+camp_id);
				String camp_name=campReviewDao.getCampName(camp_id);
				LogAspect.logger.info(LogAspect.logMsg + "캠핑장 명: " + camp_name);
				campNameList.add(camp_name);
			}
		}
		
		String writer = campReviewDao.getUser_name(user_num);
		LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
		
		if (writer == null) {
			writer = campReviewDao.getEmail(user_num);
		}
		if (writer==null) {
			writer=campReviewDao.getNickName(user_num);
		}
		mav.addObject("bookingCnt", bookingCnt);
		mav.addObject("campList", campList);
		mav.addObject("campNameList", campNameList);
		mav.addObject("writer", writer);
		mav.addObject("user_num", request.getParameter("user_num"));
		mav.setViewName("board/campReview/write.tiles");
	}
	//리뷰작성시 
	
	// 작성확인
	@Override
	public void writeOk(ModelAndView mav, MemberDto memberDto) {
		Map<String, Object> map = mav.getModelMap();
		CampReviewDto campReviewDto = (CampReviewDto) map.get("campReviewDto");
		campReviewDto.setWrite_date(new Date());
		campReviewDto.setRead_count(0);

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map
				.get("request");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "설정된 멤버넘버: " + user_num);
		
		String title=request.getParameter("title");
		LogAspect.logger.info(LogAspect.logMsg + "제목 : " + title);
		
		int camp_id = Integer.parseInt(request.getParameter("camp_id"));
		LogAspect.logger.info(LogAspect.logMsg + "캠핑장: " + camp_id);
		String camp_name=campReviewDao.getCampName(camp_id);
		LogAspect.logger.info(LogAspect.logMsg + "캠핑장 명: " + camp_name);
		title="["+camp_name+"]"+" "+title;
		
		campReviewDto.setTitle(title);
		campReviewDto.setUser_num(user_num);
		campReviewDto.setCamp_id(camp_id);
		// 첨부파일처리
		List<CampReviewFileDto> array = new ArrayList<CampReviewFileDto>();
		List<MultipartFile> fileList = request.getFiles("file");
		// 다중파일for문
		for (MultipartFile mf : fileList) {
			long file_size = mf.getSize();
			if (file_size != 0) {
				String file_name = Long.toString(System.currentTimeMillis())
						+ "_" + mf.getOriginalFilename();
				Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
						 "cloud_name", "kjs",
						  "api_key", "472518484531794",
						  "api_secret", "dUevd_gFGaAfgXH607xnh3Z3IHQ"
						));
				@SuppressWarnings("rawtypes")
				Map uploadResult = null;
				try {
					uploadResult = cloudinary.uploader().upload(mf.getBytes(), ObjectUtils.asMap(
							"public_id", file_name,
							 "transformation", new Transformation().crop("limit").width(400).height(400)
						));
					LogAspect.logger.info(LogAspect.logMsg + "path=" + (String) uploadResult.get("url"));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				CampReviewFileDto camp = new CampReviewFileDto();
				camp.setFile_name(file_name);
				camp.setFile_size(file_size);
				camp.setPath((String) uploadResult.get("url"));
				array.add(camp);
			}
		}
		LogAspect.logger.info(LogAspect.logMsg + "리뷰파일리스트: " + array);
		LogAspect.logger.info(LogAspect.logMsg + "입력값: " + campReviewDto.toString());

		int check = campReviewDao.writeOk(campReviewDto, array);
		LogAspect.logger.info(LogAspect.logMsg + "작성 check: " + check);

		mav.addObject("check", check);
		mav.setViewName("board/campReview/writeOk.empty");
	}

	@Override
	// 리뷰 목록
	public void list(ModelAndView mav, HttpSession session,
			MemberDto memberDto) {
		LogAspect.logger.info(LogAspect.logMsg + "세션되어있는 user_num: "
				+ session.getAttribute("user_num"));

		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		// 작성자 찾기
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null || pageNumber == "")
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber);

		int count = campReviewDao.getCount();
		LogAspect.logger.info(LogAspect.logMsg + "전체 글 개수: " + count);

		int boardSize = 10;
		int startRow = (currentPage - 1) * boardSize + 1;
		LogAspect.logger.info(LogAspect.logMsg + "startRow : " + startRow);
		int endRow = currentPage * boardSize;
		LogAspect.logger.info(LogAspect.logMsg + "endRow : " + endRow);

		// 글목록 리스트로받기
		List<String> writerList = new ArrayList<String>();
		List<String> pathList = new ArrayList<String>();
		List<CampReviewDto> campReviewList = null;
		if (count > 0) {
			campReviewList = campReviewDao.getCampReviewList(startRow, endRow);
			LogAspect.logger.info(
					LogAspect.logMsg + "리뷰 리스트 사이즈: " + campReviewList.size());
			LogAspect.logger.info(LogAspect.logMsg + "endRow : " + endRow);
			for (int i = 0; i < campReviewList.size(); i++) {
				System.out.println("리스트 인덱스: " + i + campReviewList.get(i));
				int user_num = campReviewList.get(i).getUser_num();
				System.out.println("리스트안의 usernum" + user_num);
				int review_num = campReviewList.get(i).getReview_num();
				System.out.println("리스트안의 review_num" + review_num);
				String path = campReviewDao.getFilePath(review_num);
				if (path == null) {
					path = "http://3.bp.blogspot.com/-ZKBbW7TmQD4/U6P_DTbE2MI/AAAAAAAADjg/wdhBRyLv5e8/s1600/noimg.gif";
					System.out.println("리스트안의 path" + path);
				}
				pathList.add(path);
				String writer = campReviewDao.getUser_name(user_num);
				LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
				if (writer == null) {
					writer = campReviewDao.getEmail(user_num);
				}
				if (writer==null) {
					writer=campReviewDao.getNickName(user_num);
				}
				writerList.add(writer);
				
			}
		}

		request.setAttribute("currentPage", currentPage);
		request.setAttribute("count", count);
		request.setAttribute("boardSize", boardSize);
		request.setAttribute("campReviewList", campReviewList);
		request.setAttribute("writerList", writerList);
		request.setAttribute("pathList", pathList);

		mav.setViewName("board/campReview/list.tiles");
	}
	//검색목록
	@Override
	public void searchList(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		System.out.println("serviceImp입니다.");
		
		String pageNumber = request.getParameter("pageNumber");

		if (pageNumber == null || pageNumber == "")
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber);
		LogAspect.logger.info(LogAspect.logMsg + "현재페이지: " + currentPage);

		String keyword=request.getParameter("keyword");
		LogAspect.logger.info(LogAspect.logMsg+"검색 키워드: "+keyword);
		
		// 전체 글 개수
		int searchCount = campReviewDao.getSearchCount(keyword);
		LogAspect.logger.info(LogAspect.logMsg + "전체 글 개수" + searchCount);
		if (searchCount==0) {
			mav.setViewName("board/campReview/searchList.tiles");
		}
		// 페이지당 글 개수
		int boardSize = 10;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		LogAspect.logger.info(LogAspect.logMsg + "시작번호: " + startRow + ","
				+ "끝번호: " + endRow);
		
		List<String> writerList = new ArrayList<String>();
		List<String> pathList=new ArrayList<String>();
		List<CampReviewDto> searchList = null; // 글이 하나라도 있으면 
		if (searchCount > 0) {
			searchList = campReviewDao.getSearchList(startRow, endRow, keyword);
		LogAspect.logger.info(LogAspect.logMsg + "작성글 사이즈" + searchList.size());
		for (int i = 0; i < searchList.size(); i++) {
			int user_num = searchList.get(i).getUser_num();
			String writer = campReviewDao.getUser_name(user_num);
			LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
			if (writer == null) {
				writer = campReviewDao.getEmail(user_num);
			}
			if (writer == null) {
				writer = campReviewDao.getNickName(user_num);
			}writerList.add(writer);
			System.out.println("이름들" + writer);
			int review_num=searchList.get(i).getReview_num();
			LogAspect.logger.info(LogAspect.logMsg+"검색리스트 review_num"+review_num);
			String path = campReviewDao.getFilePath(review_num);
			if (path == null) {
				path = "http://3.bp.blogspot.com/-ZKBbW7TmQD4/U6P_DTbE2MI/AAAAAAAADjg/wdhBRyLv5e8/s1600/noimg.gif";
				System.out.println("리스트안의 path" + path);
			}pathList.add(path);
		}
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("searchCount", searchCount);
		request.setAttribute("boardSize", boardSize);
		request.setAttribute("searchList", searchList);
		request.setAttribute("pathList", pathList);
		request.setAttribute("writerList", writerList);
		request.setAttribute("keyword", keyword);
		mav.setViewName("board/campReview/searchList.tiles");
	}
		
	}
	
	// 글읽기
	@Override
	public void read(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "글번호: " + review_num);

		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger.info(LogAspect.logMsg + "페이지: " + pageNumber);

		CampReviewDto campReviewDto = campReviewDao.read(review_num);

		int user_num = campReviewDto.getUser_num();
		LogAspect.logger.info(LogAspect.logMsg + "글번호: " + user_num);
		String writer = campReviewDao.getUser_name(user_num);
		LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
		if (writer == null) {
			writer = campReviewDao.getEmail(user_num);
		}
		if (writer==null) {
			writer=campReviewDao.getNickName(user_num);
			}
		LogAspect.logger
				.info(LogAspect.logMsg + "불러온 글: " + campReviewDto.toString());

		mav.addObject("campReviewDto", campReviewDto);
		mav.addObject("writer", writer);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/campReview/read.tiles");

	}

	// 글 삭제
	@Override
	public void delete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "게시글 번호: " + review_num);

	
		CampReviewFileDto campReviewFileDto = new CampReviewFileDto();
		int check = campReviewDao.delete(review_num);

		if (check > 0 && campReviewFileDto.getFile_name() != null) {
			File file = new File(campReviewFileDto.getPath());
			if (file.exists() && file.isFile())
				file.delete();
		}
		LogAspect.logger.info(LogAspect.logMsg + "삭제check: " + check);

		mav.addObject("check", check);
		mav.setViewName("board/campReview/delete.tiles");
	}

	@Override
	public void update(ModelAndView mav, MemberDto memberDto,
			HttpSession session) {
		LogAspect.logger.info(LogAspect.logMsg + "세션이있는 회원번호"
				+ session.getAttribute("user_num"));
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정할글 번호:  " + review_num);
		// 페이지번호
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger
				.info(LogAspect.logMsg + "수정할 글의 페이지번호:  " + pageNumber);

		CampReviewDto campReviewDto = campReviewDao.update(review_num);
		LogAspect.logger.info(
				LogAspect.logMsg + "수정할 글 내용:  " + campReviewDto.toString());

		int user_num = Integer.parseInt(request.getParameter("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정글 작성 자: " + user_num);

		String writer = campReviewDao.getUser_name(user_num);
		LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
		if (writer == null) {
			writer = campReviewDao.getEmail(user_num);
		}
		if (writer==null) {
			writer=campReviewDao.getNickName(user_num);
		}
		//캠프 이름 
		int camp_id=Integer.parseInt(request.getParameter("camp_id"));
		LogAspect.logger.info(LogAspect.logMsg + "리뷰수정 camp_id: " + camp_id);
		String camp_name=campReviewDao.getCampName(camp_id);
		// 파일이있는지여부확인
		int check = campReviewDao.imgCount(review_num);
		LogAspect.logger.info(LogAspect.logMsg + "대표이미지 있는지: " + check);
		if (check > 0) {
			String file_name = campReviewDao.getFileName(review_num);
			LogAspect.logger.info(LogAspect.logMsg + "이미지 이름: " + file_name);
			mav.addObject("file_name", file_name);
		}
		mav.addObject("camp_name", camp_name);
		mav.addObject("writer", writer);
		mav.addObject("campReviewDto", campReviewDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/campReview/update.tiles");
	}

	// 수정확인
	@Override
	public void updateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		CampReviewDto campReviewDto = (CampReviewDto) map.get("campReviewDto");
		LogAspect.logger.info(LogAspect.logMsg + "campReviewDto 수정: "
				+ campReviewDto.toString());
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map
				.get("request");

		int review_num = Integer.parseInt(request.getParameter("review_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정 게시판번호: " + review_num);
		// 파일처리
		CampReviewFileDto campReviewFileDto = new CampReviewFileDto();
		MultipartFile mf = request.getFile("file");
		
		long file_size = mf.getSize();
		LogAspect.logger.info(LogAspect.logMsg + "파일크기" + file_size);
		// 시간으로 파일이름 정하기
		if (file_size != 0) {
			String file_name = Long.toString(System.currentTimeMillis())
					+ "_" + mf.getOriginalFilename();
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					 "cloud_name", "kjs",
					  "api_key", "472518484531794",
					  "api_secret", "dUevd_gFGaAfgXH607xnh3Z3IHQ"
					));
			@SuppressWarnings("rawtypes")
			Map uploadResult = null;
			try {
				uploadResult = cloudinary.uploader().upload(mf.getBytes(), ObjectUtils.asMap(
						"public_id", file_name,
						 "transformation", new Transformation().crop("limit").width(400).height(400)
					));
				LogAspect.logger.info(LogAspect.logMsg + "path=" + (String) uploadResult.get("url"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			CampReviewFileDto camp = new CampReviewFileDto();
			camp.setFile_name(file_name);
			camp.setFile_size(file_size);
			camp.setPath((String) uploadResult.get("url"));
		
		}
	}
		// 자료저장확인용 check
		int updateCheck = campReviewDao.updateOk(campReviewDto,campReviewFileDto);
		LogAspect.logger.info(LogAspect.logMsg + "campReviewDto값: "+ campReviewDto.toString());
		LogAspect.logger.info(LogAspect.logMsg + "check값: " + updateCheck);

		mav.addObject("check", updateCheck);
		mav.setViewName("board/campReview/updateOk.tiles");
	}
}