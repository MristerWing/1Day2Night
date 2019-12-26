package com.odtn.boardComment.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.boardComment.dto.ReviewCommentDto;

@Component
public class ReviewCommentDaoImp implements ReviewCommentDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//댓글작성확인
	@Override
	public int insert(ReviewCommentDto reviewCommentDto) {
		return sqlSessionTemplate.insert("boardComment.mapper.ReviewCommentMapper.insert",reviewCommentDto);
	}
}
