package com.odtn.boardComment.dao;

import com.odtn.boardComment.dto.ReviewCommentDto;

public interface ReviewCommentDao {
	//댓글 작성 확인
	public int insert(ReviewCommentDto reviewCommentDto);
}
