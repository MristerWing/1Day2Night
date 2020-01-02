package com.odtn.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.admin.dto.AdminDto;
import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampQnADto;
import com.odtn.board.dto.CampReviewDto;
import com.odtn.member.dto.MemberDto;

@Component
public class AdminDaoImp implements AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int adminCheck(AdminDto adminDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.AdminMapper.adminCheck",adminDto);
	}
	
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.AdminMapper.memberListCount");
	}

	@Override
	public List<MemberDto> memberList() {
		
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.AdminMapper.memberpage");
	}

	
	
	@Override
	public MemberDto adminRead(int user_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.AdminMapper.deleteRead",user_num);
	}
	
	@Override
	public int updateOk(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.AdminMapper.memberUpdate",memberDto);
	}
	
	@Override
	public int deleteOk(int user_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.AdminMapper.memberDeleteOk",user_num);
	}
	
	@Override
	public List<CampInfoDto> BoardInfoList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.AdminMapper.boardinfo");
	}
	
	@Override
	public List<CampReviewDto> boardReviewList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.AdminMapper.boardreview");
	}
	
	@Override
	public List<CampQnADto> boardQnAList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.AdminMapper.boardQnA");
	}
	
	@Override
	public CampQnADto QnARead(int qna_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.AdminMapper.QnAread",qna_num);
	}
	
	@Override
	public int QnAdeleteOk(int qna_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.AdminMapper.QnAdeleteOk",qna_num);
	}
	
	@Override
	public CampReviewDto campReviewRead(int review_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.AdminMapper.reviewRead",review_num);
	}
	
	@Override
	public int reviewdeleteOk(int review_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.AdminMapper.reiviewDeleteOk",review_num);
	}
	
	@Override
	public CampInfoDto campInfoRead(int info_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.AdminMapper.campInforead",info_num);
	}
	
	@Override
	public int infodeleteOk(int info_num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.AdminMapper.infoDeleteOk",info_num);
	}
	
}
