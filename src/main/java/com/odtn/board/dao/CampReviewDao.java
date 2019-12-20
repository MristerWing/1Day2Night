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
}
