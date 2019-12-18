package com.odtn.search.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.search.dto.SearchDto;

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
}
