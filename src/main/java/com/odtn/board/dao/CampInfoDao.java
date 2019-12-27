package com.odtn.board.dao;

import java.awt.color.CMMException;
import java.util.ArrayList;
import java.util.List;

import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;

public interface CampInfoDao {
	//공지글작성 관리자 이름 불러오기
	public String getNickName(int user_num);
	//공지글 작성
	public int writeOK(CampInfoDto campInfoDto,List<CampInfoFileDto> array);
	//전체글 개수 가져오기
	public int getCount();
	//작성 글 사이즈
	public List<CampInfoDto>getCampInfoList(int startRow,int endRow);
	//파일이없는 글 읽어오기
	public CampInfoDto read(int info_num);
	//파일개수 세기
	public int fileCount(int info_num);
	//파일 이름불러오기
	public List<CampInfoFileDto>getFileList(int info_num);
	//게시판 삭제
	public int delete(int info_num);
	//서버에서 파일 삭제하기위해서 파일게시판에서 가져오는 메소드
	public CampInfoFileDto selectFile(int info_num);
	//게시글 수정
	public CampInfoDto update(int info_num);
	//수정하기 위해서 파일 삭제
	public int fileDelete(int info_num);
	//게시글 수정확인
	public int updateOk(CampInfoDto campInfoDto,List<CampInfoFileDto> array);
	//다운로드할 파일들 가져오기
	public CampInfoFileDto selectFileDown(int info_num,String file_name);
	
}


