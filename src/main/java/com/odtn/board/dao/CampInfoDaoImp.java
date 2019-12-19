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

	@Override
	public int writeOK(CampInfoDto campInfoDto, List<CampInfoFileDto> array) {
		int check = 0;

		int defaultCheck = sqlSessionTemplate.insert("board.mapper.CampInfoMapper.campInfoInsert", campInfoDto);
		if (defaultCheck > 0 && array.size() > 0) {
			for (CampInfoFileDto campInfoFileDto : array) {
				campInfoFileDto.setInfo_num(sqlSessionTemplate.selectOne("board.mapper.CampInfoMapper.campInfoMaxNum"));
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

	// campinfo에서 리스트뿌려주기
	@Override
	public List<CampInfoDto> getCampInfoList(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("board.mapper.CampInfoMapper.getCampInfoList", map);
	}

	// 게시글 읽기
	@Override
	public CampInfoDto read(int info_num) {

		// 조회수 증가
		int check = sqlSessionTemplate.update("board.mapper.CampInfoMapper.readCount", info_num);
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
