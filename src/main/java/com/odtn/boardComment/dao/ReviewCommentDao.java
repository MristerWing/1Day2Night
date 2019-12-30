package com.odtn.boardComment.dao;

import java.util.List;

import com.odtn.boardComment.dto.ReviewCommentDto;

public interface ReviewCommentDao {
	//댓글 작성 확인
	public int insert(ReviewCommentDto reviewCommentDto);
	//리스트 개수 세기
	public int listCount();
	//리스트 구하기
	public List<ReviewCommentDto>getCommentList(int review_num);
	//이름구하기
	public String getUserName(int user_num);
	//이메일 구하기
	public String getEmail(int user_num);
	//카톡프로필이름구하ㅣㄱ
	public String getNickName(int user_num);
	//댓글 삭제
	public int delete(int comment_num);
	//댓글 수정
	public int update(ReviewCommentDto reviewCommentDto);
}
