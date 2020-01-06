package com.odtn.board.dao;

import java.util.List;

import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;
import com.odtn.reservation.dto.ReservationDto;

public interface CampReviewDao {
	//리뷰작성시 예약내역 개수 확인 
	public int getBookingCnt(int user_num);
	//리뷰 작성 예약리스트 
	public List<ReservationDto> getcampList(int user_num);
	//캠핑장 이름 가져오기
	public String getCampName(int camp_id);
	//리뷰 작성확인
	public int writeOk(CampReviewDto campReviewDto,List<CampReviewFileDto> array);
	//게시글 총 개수
	public int getCount();
	//글목록 검색한 개수 구하기
	public int getSearchCount(String keyword);
	//글목록 검색 리스트 구하기
	public List<CampReviewDto> getSearchList(int startRow, int endRow, String keyword);
	//글목록 리스트 구하기
	public List<CampReviewDto> getCampReviewList (int startRow, int endRow);
	//파일목록 리스트 구하기
	public List<CampReviewFileDto> getCampReviewFileList(int startRow,int endRow);
	//리스트에 뿌릴 사진이있는지 확인
	public int imgCount(int review_num);
	//리스트에 뿌릴 사진 경로 구하기
	public String getFilePath(int review_num);
	//멤버테이블에서 작성자 이름찾기
	public String getUser_name(int user_num);
	//member table에서 이메일찾기
	public String getEmail(int user_num);
	//멤버 테이블에서 카카오톡프로필 이름찾기
	public String getNickName(int user_num);
	//글읽기
	public CampReviewDto read(int review_num);
	//글삭제
	public int delete(int review_num);
	//글 수정
	public CampReviewDto update(int review_num);
	//수정작성 시 때 대표이미지 불러오기
	public String getFileName(int review_num);
	//수정했을때 새로입력한 이미지에 이름이있다면 기존파일 삭제
	public int fileDelete(int review_num);
	//수정확인
	public int updateOk(CampReviewDto campReviewDto, CampReviewFileDto campReviewFileDto);
}
