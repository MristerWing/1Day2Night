package com.odtn.owner.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.owner.dto.OwnerDto;
import com.odtn.owner.dto.OwnerMainPageDto;
import com.odtn.reservation.dto.ReservationDto;

@Component
public class OwnerDaoImp implements OwnerDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public OwnerDto login(String owner_key, int user_num) {
		Map<String, Object> ownerMap = new HashMap<String, Object>();
		ownerMap.put("owner_key", owner_key);
		ownerMap.put("user_num", user_num);

		return sqlSessionTemplate.selectOne(
				"com.odtn.owner.dao.mapper.OwnerMapper.login", ownerMap);
	}

	@Override
	public String checkOwnerKey(long owner_key) {
		return sqlSessionTemplate.selectOne(
				"com.odtn.owner.dao.mapper.OwnerMapper.countOwnerKey",
				owner_key);
	}

	@Override
	public OwnerMainPageDto getMainPage(long owner_key) {
		return sqlSessionTemplate.selectOne(
				"com.odtn.owner.dao.mapper.OwnerMapper.getOwnerData",
				owner_key);
	}

	@Override
	public List<ReservationDto> getReservationList(int camp_id,
			String fee_name) {
		Map<String, Object> reservationMap = new HashMap<String, Object>();
		reservationMap.put("camp_id", camp_id);
		reservationMap.put("fee_name", fee_name);

		return sqlSessionTemplate.selectList(
				"com.odtn.owner.dao.mapper.OwnerMapper.getReservationList",
				reservationMap);
	}
}
