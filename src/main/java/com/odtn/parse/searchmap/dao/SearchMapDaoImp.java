package com.odtn.parse.searchmap.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SearchMapDaoImp implements SearchMapDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
