package com.odtn.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.board.dto.CampQnADto;

@Component
public class CampQnADaoImp implements CampQnADao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 이름가져오기
	@Override
	public String getUser_name(int user_num) {

		return sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.getUser_name", user_num);
	}

	// 이메일주소가져오기
	@Override
	public String getEmail(int user_num) {

		return sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.getEmail", user_num);
	}

	// 이메일없으면 카톡프로필이름 가져오기
	@Override
	public String getNickName(int user_num) {
		return sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.getNickName", user_num);
	}

	// 글 작성확인
	@Override
	public int writeOk(CampQnADto campQnADto) {
		int check = sqlSessionTemplate
				.insert("board.mapper.CampQnAMapper.writeOk", campQnADto);
		return check;
	}

	// maxNum확인
	@Override
	public int getQnAMaxNum() {
		return sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.getQnAMaxNum");
	}

	// 목록에 뿌릴 모든 글의 개수
	@Override
	public int getCount() {
		return sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.getCount");
	}

	// 목록에 뿌릴 글 리스트로
	@Override
	public List<CampQnADto> getCampQnAList(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate
				.selectList("board.mapper.CampQnAMapper.getCampQnAList", map);
	}

	// 검색한 결과 리스트
	@Override
	public List<CampQnADto> getSearchList(int startRow, int endRow,
			int user_num) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("user_num", user_num);
		return sqlSessionTemplate
				.selectList("board.mapper.CampQnAMapper.getSearchList", map);
	}

	// 작성자로 검색해서 user_num
	@Override
	public int getUser_num(String keyword) {
		String result = sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.getUser_num", keyword);
		if (result == null)
			result = "0";

		return Integer.parseInt(result);
	}

	// 검색한 작성자의 글 개수
	@Override
	public int getSearchCount(int user_num) {

		return sqlSessionTemplate.selectOne(
				"board.mapper.CampQnAMapper.getSearchCount", user_num);
	}

	// 리스트에서 글 읽기
	@Override
	public CampQnADto read(int qna_num) {
		int check = sqlSessionTemplate
				.update("board.mapper.CampQnAMapper.readCount", qna_num);
		return sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.readContent", qna_num);
	}

	// 비밀번호 입력하고 해당글 읽기
	@Override
	public CampQnADto pwdCheck(String password, int user_num, int qna_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("password", password);
		map.put("user_num", user_num);
		map.put("qna_num", qna_num);
		CampQnADto qna = sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.pwdCheck", map);
		return qna;
	}

	// 글 삭제
	@Override
	public int delete(int qna_num) {
		return sqlSessionTemplate.delete("board.mapper.CampQnAMapper.deleteQnA",
				qna_num);
	}

	// 글 수정
	@Override
	public CampQnADto update(int qna_num) {
		return sqlSessionTemplate
				.selectOne("board.mapper.CampQnAMapper.QnAupdate", qna_num);
	}

	// 글 수정 확인
	@Override
	public int updateOk(CampQnADto campQnADto) {
		return sqlSessionTemplate
				.update("board.mapper.CampQnAMapper.QnAupdateOk", campQnADto);
	}

	// 답글 작성확인
	@Override
	public int writeAnswerOk(CampQnADto campQnADto) {
		int check = sqlSessionTemplate
				.insert("board.mapper.CampQnAMapper.writeAnswerOk", campQnADto);
		return check;
	}
}
