package com.odtn.parse.searchmap.dao;

import java.util.List;

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
	public List<SearchMapDto> mapList(SearchMapDto searchMapDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.SearchMapMapper.test",searchMapDto);
	}
	
//	@Override
//	public int addrescount() {
//		// TODO Auto-generated method stub
//		return sqlSessionTemplate.selectOne("dao.SearchMapMapper.seladdres");
//	}
}
