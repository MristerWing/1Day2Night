package com.odtn.owner.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.odtn.owner.dto.OwnerDto;

public class OwnerDaoImp implements OwnerDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public OwnerDto login(int owner_key, int user_num) {
		Map<String, Integer> ownerMap = new HashMap<String, Integer>();
		ownerMap.put("owner_key", owner_key);
		ownerMap.put("user_num", user_num);

		return sqlSessionTemplate.selectOne(
				"com.odtn.owner.dao.mapper.OwnerMapper.login", ownerMap);
	}
}
