package com.odtn.board.dao;

import java.util.List;

import com.odtn.board.dto.CampReviewDto;
import com.odtn.board.dto.CampReviewFileDto;

public interface CampReviewDao {
	public int writeOk(CampReviewDto campReviewDto,List<CampReviewFileDto> array);
	//게시글 총 개수
	public int getCount();
	//글목록 리스트 구하기
	public List<CampReviewDto> getCampReviewList (int startRow, int endRow);
	//리스트에 뿌릴 사진이있는지 확인
	public int  imgCount(int review_num);
	//member table에서 이름 찾기
	public String getUser_name(int user_num);
	//글읽기
	public CampReviewDto read(int review_num);
	//글삭제
	public int delete(int review_num);
	//글 수정=>read같이씀.
	//수정작성 시 때 대표이미지 불러오기
	public String getFileName(int review_num);
	//수정했을때 새로입력한 이미지에 이름이있다면 기존파일 삭제
	public int fileDelete(int review_num);
	//수정확인
	public int updateOk(CampReviewDto campReviewDto, CampReviewFileDto campReviewFileDto);
}
