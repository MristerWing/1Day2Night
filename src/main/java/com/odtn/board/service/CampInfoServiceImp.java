package com.odtn.board.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.aop.LogAspect;
import com.odtn.board.dao.CampInfoDao;
import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;
import com.odtn.member.dto.MemberDto;

@Component
public class CampInfoServiceImp implements CampInfoService {
	@Autowired
	private CampInfoDao campInfoDao;

	@Override
	public void write(ModelAndView mav, MemberDto memberDto,
			HttpSession session) {

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "관리자 user_num" + user_num);
		String writer = campInfoDao.getUser_name(user_num);
		LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
		if (writer == null) {
			writer = campInfoDao.getEmail(user_num);
		}
		if (writer==null) {
			writer=campInfoDao.getNickName(user_num);
		}

		mav.addObject("user_num", user_num);
		mav.addObject("writer", writer);
		mav.setViewName("board/campInfo/write.tiles");
	}

	@Override
	public void writeOk(ModelAndView mav, MemberDto memberDto) {
		Map<String, Object> map = mav.getModelMap();

		CampInfoDto campInfoDto = (CampInfoDto) map.get("campInfoDto");
		CampInfoFileDto campInfoFileDto = (CampInfoFileDto) map
				.get("campInfoFileDto");
		campInfoDto.setWrite_date(new Date());
		campInfoDto.setRead_count(0);

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map
				.get("request");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "작성확인 user_num: " + user_num);
		campInfoDto.setUser_num(user_num);
		// 첨부파일처리
		List<CampInfoFileDto> array = new ArrayList<CampInfoFileDto>();
		List<MultipartFile> fileList = request.getFiles("file");
		// 다중파일for문
		for (MultipartFile mf : fileList) {
			long file_size = mf.getSize();
			if (file_size != 0) {
				String file_name = Long.toString(System.currentTimeMillis())
						+ "_" + mf.getOriginalFilename();
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
					CampInfoFileDto camp = new CampInfoFileDto();
					camp.setFile_name(file_name);
					camp.setFile_size(file_size);
					camp.setPath(file.getAbsolutePath());
					array.add(camp);
				}
			}
		}
		LogAspect.logger.info(LogAspect.logMsg + "array: " + array);

		LogAspect.logger
				.info(LogAspect.logMsg + "입력내용" + campInfoDto.toString());
		// 자료저장확인용 check
		int check = campInfoDao.writeOK(campInfoDto, array);
		LogAspect.logger.info(LogAspect.logMsg + "check값: " + check);

		mav.addObject("check", check);
		mav.setViewName("board/campInfo/writeOk.tiles");
	}

	// 글목록
	@Override
	public void list(ModelAndView mav, HttpSession session, MemberDto memberDto) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String pageNumber = request.getParameter("pageNumber");

		if (pageNumber == null || pageNumber == "")
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber);
		LogAspect.logger.info(LogAspect.logMsg + "현재페이지: " + currentPage);

		// 전체 글 개수
		int count = campInfoDao.getCount();
		LogAspect.logger.info(LogAspect.logMsg + "전체 글 개수" + count);

		// 페이지당 글 개수
		int boardSize = 10;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		LogAspect.logger.info(LogAspect.logMsg + "시작번호: " + startRow + ","
				+ "끝번호: " + endRow);

		// 작성글 받기
		List<String> writerList = new ArrayList<String>();
		List<CampInfoDto> campInfoList = null;
		// 글이 하나라도 있으면
		if (count > 0) {
			campInfoList = campInfoDao.getCampInfoList(startRow, endRow);
			LogAspect.logger
					.info(LogAspect.logMsg + "작성글 사이즈" + campInfoList.size());
			for (int i = 0; i < campInfoList.size(); i++) {
				int user_num = campInfoList.get(i).getUser_num();
				String writer = campInfoDao.getUser_name(user_num);
				LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
				if (writer == null) {
					writer = campInfoDao.getEmail(user_num);
				}
				if (writer==null) {
					writer=campInfoDao.getNickName(user_num);
				}

				writerList.add(writer);
				System.out.println("이름들" + writer);
			}
		}
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("count", count);
		request.setAttribute("boardSize", boardSize);
		request.setAttribute("campInfoList", campInfoList);
		request.setAttribute("writerList", writerList);
		mav.setViewName("board/campInfo/list.tiles");
	}

	//검핵해서 리스트로 읽기
	@Override
	public void serchList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		System.out.println("serviceImp입니다.");
		
		String pageNumber = request.getParameter("pageNumber");

		if (pageNumber == null || pageNumber == "")
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber);
		LogAspect.logger.info(LogAspect.logMsg + "현재페이지: " + currentPage);

		String keyword=request.getParameter("keyword");
		LogAspect.logger.info(LogAspect.logMsg+"검색 키워드"+keyword);
		
		// 전체 글 개수
		int searchCount = campInfoDao.getSearchCount(keyword);
		LogAspect.logger.info(LogAspect.logMsg + "전체 글 개수" + searchCount);

		// 페이지당 글 개수
		int boardSize = 10;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		LogAspect.logger.info(LogAspect.logMsg + "시작번호: " + startRow + ","
				+ "끝번호: " + endRow);
		
		List<String> writerList = new ArrayList<String>();
		List<CampInfoDto> campInfoList = null; // 글이 하나라도 있으면 
		if (searchCount > 0) {
		campInfoList = campInfoDao.getCampInfoList(startRow, endRow);
		LogAspect.logger.info(LogAspect.logMsg + "작성글 사이즈" + campInfoList.size());
		for (int i = 0; i < campInfoList.size(); i++) {
			int user_num = campInfoList.get(i).getUser_num();
			String writer = campInfoDao.getUser_name(user_num);
			LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
			if (writer == null) {
				writer = campInfoDao.getEmail(user_num);
			}
			if (writer == null) {
				writer = campInfoDao.getNickName(user_num);
			}

			writerList.add(writer);
			System.out.println("이름들" + writer);
		}
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("searchCount", searchCount);
		request.setAttribute("boardSize", boardSize);
		request.setAttribute("campInfoList", campInfoList);
		request.setAttribute("writerList", writerList);
		request.setAttribute("keyword", keyword);
		mav.setViewName("board/campInfo/list.tiles");
	}
	}

	// 글 읽기
	@Override
	public void read(ModelAndView mav, MemberDto memberDto) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int info_num = Integer.parseInt(request.getParameter("info_num"));
		LogAspect.logger.info(LogAspect.logMsg + "글번호: " + info_num);

		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger.info(LogAspect.logMsg + "페이지: " + pageNumber);

		CampInfoDto campInfoDto = campInfoDao.read(info_num);
		LogAspect.logger
				.info(LogAspect.logMsg + "불러온 글: " + campInfoDto.toString());
		int user_num = campInfoDto.getUser_num();
		String writer = campInfoDao.getUser_name(user_num);
		LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
		if (writer == null) {
			writer = campInfoDao.getEmail(user_num);
		}
		if (writer==null) {
			writer=campInfoDao.getNickName(user_num);
		}

		// 파일이있는지여부확인
		List<CampInfoFileDto> campInfoFileList = null;
		int fileCount = campInfoDao.fileCount(info_num);
		LogAspect.logger.info(LogAspect.logMsg + "파일 수: " + fileCount);
		if (fileCount > 0) {
			campInfoFileList = campInfoDao.getFileList(info_num);
			LogAspect.logger.info(LogAspect.logMsg + "파일 이름들: "
					+ campInfoFileList.toString());
		}
		mav.addObject("campInfoFileList", campInfoFileList);
		mav.addObject("campInfoDto", campInfoDto);
		mav.addObject("writer", writer);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/campInfo/read.tiles");
	}

	// 파일다운로드
	@Override
	public void downLoad(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map
				.get("response");

		// 보드넘버가져오기.
		int info_num = Integer.parseInt(request.getParameter("info_num"));
		LogAspect.logger.info(LogAspect.logMsg + "파일다운로드 글번호: " + info_num);
		// 파일이름가져오기
		String file_name = request.getParameter("file_name");
		LogAspect.logger.info(LogAspect.logMsg + "다운로드 파일명: " + file_name);
		// 파일게시판에서 해당글선택하기.
		CampInfoFileDto campInfoFileDto = campInfoDao.selectFileDown(info_num,
				file_name);
		LogAspect.logger.info(
				LogAspect.logMsg + "fileDto정보 : " + campInfoFileDto.toString());
		// 다운로드
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			int index = campInfoFileDto.getFile_name().indexOf("_");
			LogAspect.logger.info(LogAspect.logMsg + "파일다운로드 index: " + index);
			String dbFileName = campInfoFileDto.getFile_name()
					.substring(index + 1);
			LogAspect.logger.info(LogAspect.logMsg + "파일명만 : " + dbFileName);
			String fileName = new String(dbFileName.getBytes("utf-8"),
					"ISO-8859-1");
			LogAspect.logger.info(LogAspect.logMsg + "한글설정파일명 : " + fileName);

			// 대화창 설정
			response.setHeader("Content-Disposition",
					"attachment; filename=\"" + fileName + "\"");
			response.setContentType("application/octet-stream");
			Integer filesize = (int) (long) campInfoFileDto.getFile_size();
			response.setContentLength(filesize);

			bis = new BufferedInputStream(
					new FileInputStream(campInfoFileDto.getPath()));
			bos = new BufferedOutputStream(response.getOutputStream());
			while (true) {
				int data = bis.read();
				if (data == -1)
					break;
				bos.write(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (bos != null)
					bos.close();
				if (bis != null)
					bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	// 삭제메소드
	@Override
	public void delete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int info_num = Integer.parseInt(request.getParameter("info_num"));
		LogAspect.logger.info(LogAspect.logMsg + "게시글 번호: " + info_num);

		// 파일을 서버에서 지워주기.
		/* CampInfoFileDto campInfoFileDto = campInfoDao.slectFile(info_num); */
		CampInfoFileDto campInfoFileDto = new CampInfoFileDto();
		int check = campInfoDao.delete(info_num);

		if (check > 0 && campInfoFileDto.getFile_name() != null) {
			File file = new File(campInfoFileDto.getPath());
			if (file.exists() && file.isFile())
				file.delete();
		}
		LogAspect.logger.info(LogAspect.logMsg + "삭제check: " + check);

		mav.addObject("check", check);
		mav.setViewName("board/campInfo/delete.tiles");
	}

	// 수정할 글 불러오기
	@Override
	public void update(ModelAndView mav, HttpSession session,
			MemberDto memberDto) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		// 가져올 info_num
		int info_num = Integer.parseInt(request.getParameter("info_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정할글 번호:  " + info_num);
		// 페이지번호
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger
				.info(LogAspect.logMsg + "수정할 글의 페이지번호:  " + pageNumber);

		CampInfoDto campInfoDto = campInfoDao.update(info_num);
		LogAspect.logger.info(
				LogAspect.logMsg + "수정할 글 내용:  " + campInfoDto.toString());

		int user_num = Integer.parseInt(request.getParameter("user_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정글의 user_num: " + user_num);

		String writer = campInfoDao.getUser_name(user_num);
		LogAspect.logger.info(LogAspect.logMsg + "설정된 user_name: " + writer);
		if (writer == null) {
			writer = campInfoDao.getEmail(user_num);
		}
		if (writer==null) {
			writer=campInfoDao.getNickName(user_num);
		}


		// 파일이있는지여부확인
		List<CampInfoFileDto> campInfoFileList = null;
		int fileCount = campInfoDao.fileCount(info_num);
		LogAspect.logger.info(LogAspect.logMsg + "파일 수: " + fileCount);
		if (fileCount > 0) {
			campInfoFileList = campInfoDao.getFileList(info_num);
			LogAspect.logger.info(LogAspect.logMsg + "파일 이름들: "
					+ campInfoFileList.toString());
			mav.addObject("campInfoFileList", campInfoFileList);
		}
		mav.addObject("writer", writer);
		mav.addObject("campInfoDto", campInfoDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/campInfo/update.tiles");
	}

	// 수정확인
	@Override
	public void updateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		CampInfoDto campInfoDto = (CampInfoDto) map.get("campInfoDto");

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map
				.get("request");

		int info_num = Integer.parseInt(request.getParameter("info_num"));
		LogAspect.logger.info(LogAspect.logMsg + "수정 게시판번호: " + info_num);

		int delete = campInfoDao.fileDelete(info_num);
		LogAspect.logger.info(LogAspect.logMsg + "파일삭제값: " + delete);

		// 파일처리
		// 첨부파일처리
		List<CampInfoFileDto> array = new ArrayList<CampInfoFileDto>();
		List<MultipartFile> fileList = request.getFiles("file");
		// 다중파일for문
		for (MultipartFile mf : fileList) {
			long file_size = mf.getSize();
			if (file_size != 0) {
				String file_name = Long.toString(System.currentTimeMillis())
						+ "_" + mf.getOriginalFilename();
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
					CampInfoFileDto campInfoFileDto = new CampInfoFileDto();
					campInfoFileDto.setInfo_num(info_num);
					campInfoFileDto.setFile_name(file_name);
					campInfoFileDto.setFile_size(file_size);
					campInfoFileDto.setPath(file.getAbsolutePath());
					array.add(campInfoFileDto);
				}
			}
		}
		// 자료저장확인용 check
		int check = campInfoDao.updateOk(campInfoDto, array);
		LogAspect.logger.info(LogAspect.logMsg + "check값: " + check);

		mav.addObject("check", check);
		mav.setViewName("board/campInfo/updateOk.tiles");
	}
}
