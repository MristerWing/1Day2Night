package com.odtn.boardComment.dao;

import java.util.HashMap;
import java.util.List;

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
	//리스트개수세기
	@Override
	public int listCount() {
		return sqlSessionTemplate.selectOne("boardComment.mapper.ReviewCommentMapper.listCount");
	}
	//리스트 뿌리기
	@Override
	public List<ReviewCommentDto> getCommentList(int review_num) {
		
		return sqlSessionTemplate.selectList("boardComment.mapper.ReviewCommentMapper.getCommentList",review_num);
	}
	//사용자이름구하기
	@Override
	public String getUserName(int user_num) {
		return sqlSessionTemplate.selectOne("boardComment.mapper.ReviewCommentMapper.getUserName",user_num);
	}
	//사용자 이메일 구하기
	@Override
	public String getEmail(int user_num) {
		return sqlSessionTemplate.selectOne("boardComment.mapper.ReviewCommentMapper.getEmail",user_num);
	}
	//사용자  프로필명구하기
	@Override
	public String getNickName(int user_num) {
		return sqlSessionTemplate.selectOne("boardComment.mapper.ReviewCommentMapper.getNickName",user_num);
	}
	//댓글 삭제
	@Override
	public int delete(int comment_num) {
		return sqlSessionTemplate.delete("boardComment.mapper.ReviewCommentMapper.deleteComment",comment_num);
	}
	//댓글 수정
	public int update(int comment_num) {
		return sqlSessionTemplate.update("boardComment.mapper.ReviewCommentMapper.updateComment",comment_num);
	}
}
