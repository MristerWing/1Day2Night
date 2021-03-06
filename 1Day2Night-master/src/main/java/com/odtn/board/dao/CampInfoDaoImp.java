package com.odtn.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;

@Component
public class CampInfoDaoImp implements CampInfoDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//공지글작성 관리자 이름 불러오기
	//관리자이름이있는지
	@Override
	public String getUser_name(int user_num) {
		
		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.getUser_name",user_num);
	}
	//이름없으면 이메일주소가져오기
	@Override
	public String getEmail(int user_num) {
		
		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.getEmail",user_num);
	}
	//이메일없으면 카톡 프로필이름 가져오기
	public String getNickName(int user_num) {
		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.getNickName",user_num);
	}
	@Override
	public int writeOK(CampInfoDto campInfoDto, List<CampInfoFileDto> array) {
		int check = 0;

		int defaultCheck = sqlSessionTemplate.insert("board.mapper.CampInfoMapper.campInfoInsert", campInfoDto);
		if (defaultCheck > 0 && array.size() > 0) {
			for (CampInfoFileDto campInfoFileDto : array) {
				int maxNum = sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.campInfoMaxNum");
				campInfoFileDto.setInfo_num(maxNum);
			}
			check = sqlSessionTemplate.insert("board.mapper.CampInfoMapper.campFileInsert", array);

			defaultCheck = check;
		}
		return defaultCheck;
	}

	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.campInfoCount");
	}
	//해당검색내용 숫자
	@Override
	public int getSearchCount(String keyword) {
		//keyword="%"+keyword+"%";
		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.getSearchCount",keyword);
	}
	// campinfo에서 리스트뿌려주기
	@Override
	public List<CampInfoDto> getCampInfoList(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("board.mapper.CampInfoMapper.getCampInfoList", map);
	}
	//검색 글 리스트 뿌르기
	@Override
	public List<CampInfoDto> getSearchList(int startRow, int endRow,String keyword) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("board.mapper.CampInfoMapper.getSearchList", map);
	}
	// 게시글 읽기
	@Override
	public CampInfoDto read(int info_num) {

		// 조회수 증가
		sqlSessionTemplate.update("board.mapper.CampInfoMapper.readCount", info_num);
		// 글 읽기로 들어가기.
		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.readContent", info_num);

	}
	//다운로드할 파일 조회
	@Override
	public CampInfoFileDto selectFileDown(int info_num, String file_name) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("info_num", info_num);
		map.put("file_name", file_name);
		
		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.selectFileDown",map);
	}
	// 파일개수가1이상이면
	@Override
	public int fileCount(int info_num) {

		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.fileCount", info_num);
	}

	// 파일리스트
	@Override
	public List<CampInfoFileDto> getFileList(int info_num) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("info_num", info_num);
		return sqlSessionTemplate.selectList("board.mapper.CampInfoMapper.getFileList", map);
	}

	// 파일 삭제 하기위해서찾기
	@Override
	public CampInfoFileDto selectFile(int info_num) {

		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.fileSelect", info_num);
	}
	//글삭제 눌렀을때 실행되는 메소드
	@Override
	public int delete(int info_num) {
		int check = 0;

		int defaultCheck = sqlSessionTemplate.delete("board.mapper.CampInfoMapper.campInfoFileDelete", info_num);
		if (defaultCheck > 0) {
			check = sqlSessionTemplate.delete("board.mapper.CampInfoMapper.campInfoDelete", info_num);
		}
		if (check == 0) {
			check = sqlSessionTemplate.delete("board.mapper.CampInfoMapper.campInfoDelete", info_num);
		}

		return check;
	}

	@Override
	public CampInfoDto update(int info_num) {

		return sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.campInfoUpdate", info_num);
	}

	// 파일수정시 파일 먼저삭제
	@Override
	public int fileDelete(int info_num) {
		return sqlSessionTemplate.delete("board.mapper.CampInfoMapper.fileDelete", info_num);
	}

	// 수정확인
	@Override
	public int updateOk(CampInfoDto campInfoDto, List<CampInfoFileDto> array) {
		int check = 0;

		int defaultCheck = sqlSessionTemplate.update("board.mapper.CampInfoMapper.campInfoUpdateOk", campInfoDto);
		if (defaultCheck > 0 && array.size() > 0) {
			//for (CampInfoFileDto campInfoFileDto : array) {
				check = sqlSessionTemplate.insert("board.mapper.CampInfoMapper.campFileInsert", array);
			//}

			defaultCheck = check;
		}
		return defaultCheck;
	}
}
