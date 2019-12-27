package com.odtn.board.dao;

import java.awt.color.CMMException;
import java.util.HashMap;
import java.util.List;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.board.dto.CampQnADto;

@Component
public class CampQnADaoImp implements CampQnADao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//글작성자 가져오기
	@Override
	public String getNickName(int user_num) {
		
		return sqlSessionTemplate.selectOne("board.mapper.CampQnAMapper.getNickName",user_num);
	}
	//이메일없으면 카톡프로필이름 가져오기
	@Override
	public String getProfileName(int user_num) {
	
		return sqlSessionTemplate.selectOne("board.mapper.CampQnAMapper.getProfileName",user_num);
	}

	//글 작성확인
	@Override
	public int writeOk(CampQnADto campQnADto) {
		int check=sqlSessionTemplate.insert("board.mapper.CampQnAMapper.writeOk",campQnADto);
		return check;
	}
	//maxNum확인
	@Override
	public int getQnAMaxNum() {
		return sqlSessionTemplate.selectOne("board.mapper.CampQnAMapper.getQnAMaxNum");
	}
	//목록에 뿌릴 모든 글의 개수
	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("board.mapper.CampQnAMapper.getCount");
	}
	//목록에 뿌릴 글 리스트로
	@Override
	public List<CampQnADto> getCampQnAList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("board.mapper.CampQnAMapper.getCampQnAList",map);
	}
	//리스트에서 글 읽기
	@Override
	public CampQnADto read(int qna_num) {
			int check=sqlSessionTemplate.update("board.mapper.CampQnAMapper.readCount",qna_num);
			return sqlSessionTemplate.selectOne("board.mapper.CampQnAMapper.readContent",qna_num);
	}
	//글 삭제
	@Override
	public int delete(int qna_num) {
		return sqlSessionTemplate.delete("board.mapper.CampQnAMapper.deleteQnA",qna_num);
	}
	//글 수정
	@Override
	public CampQnADto update(int qna_num) {
		return sqlSessionTemplate.selectOne("board.mapper.CampQnAMapper.QnAupdate",qna_num);
	}
	//글 수정 확인
	@Override
	public int updateOk(CampQnADto campQnADto) {
		return sqlSessionTemplate.update("board.mapper.CampQnAMapper.QnAupdateOk",campQnADto);
	}
	//답글 작성확인
	@Override
	public int writeAnswerOk(CampQnADto campQnADto) {
		int check=sqlSessionTemplate.insert("board.mapper.CampQnAMapper.writeAnswerOk",campQnADto);
		return check;
	}
}
