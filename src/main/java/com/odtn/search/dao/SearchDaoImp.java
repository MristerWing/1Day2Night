package com.odtn.search.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.search.dto.SearchDto;
import com.odtn.search.dto.SearchPaymentDto;

/**
 * @author S.s
 *
 */
/**
 * @author S.s
 *
 */
@Component
public class SearchDaoImp implements SearchDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<SearchDto> list(Map<String, Object> searchMap) {
		return sqlSessionTemplate.selectList(
				"com.odtn.search.dao.mapper.SearchMapper.GetSearchList",
				searchMap);
	}

	@Override
	public int getCount(Map<String, Object> searchMap) {
		return sqlSessionTemplate.selectOne(
				"com.odtn.search.dao.mapper.SearchMapper.GetCount", searchMap);
	}

	/**
	 * @author KimJinsu
	 * @date 2019/12/18
	 * @apiNote 캠프id값을 획득
	 */
	@Override
	public SearchDto getCamp(int camp_id) {
		return sqlSessionTemplate.selectOne(
				"com.odtn.search.dao.mapper.SearchMapper.getCamp", camp_id);
	}

	/**
	 * @author KimJinsu
	 * @date 2019/12/19
	 * @apiNote 캠프 조회수 증가
	 */
	@Override
	public int updateReadCount(int camp_id) {
		return sqlSessionTemplate.update(
				"com.odtn.search.dao.mapper.SearchMapper.updateReadCount",
				camp_id);
	}

	/**
	 * @author KimJinsu
	 * @date 2019/12/19
	 * @apiNote 캠프요금 조회
	 */
	@Override
	public List<SearchPaymentDto> getPayment(int camp_id) {
		return sqlSessionTemplate.selectList(
				"com.odtn.search.dao.mapper.SearchMapper.getPayment", camp_id);
	}
	
	/**
	 * @author ParkSungSoo
	 * @date 2019/12/29
	 * @apiNote 캠핑장 실시간 자동검색 완성
	 */
	@Override
	public List<String> getSearchComplete(String searchName) {
		return sqlSessionTemplate.selectList("com.odtn.search.dao.mapper.SearchMapper.getSearchComplete", searchName);
	}
}
