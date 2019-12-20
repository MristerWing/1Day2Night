package com.odtn.parse.searchmap.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.parse.searchmap.dto.SearchMapDto;

@Component
public class SearchMapDaoImp implements SearchMapDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.SearchMapMapper.searchMapCount");
	}

	@Override
	public List<SearchMapDto> searchList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return  sqlSessionTemplate.selectList("dao.SearchMapMapper.selectPage",map);
	}
}
