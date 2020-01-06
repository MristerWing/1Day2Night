package com.odtn.camping.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.camping.dto.CampingDto;
import com.odtn.search.dto.SearchDto;

@Component
public class CampingDaoImp implements CampingDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public CampingDto getCampingDto() {
		return sqlSessionTemplate.selectOne("getIndexInfo");
	}

	@Override
	public List<SearchDto> getCampingList() {
		return sqlSessionTemplate.selectList("getCampingList");
	}
}
