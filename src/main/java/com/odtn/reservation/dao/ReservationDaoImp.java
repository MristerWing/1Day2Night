package com.odtn.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author KimJinsu
 * @date 2019/12/22
 * @apiNote 예약 DAO객체
 */
@Component
public class ReservationDaoImp implements ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<String> getCampingList(int camp_id) {
		return sqlSessionTemplate.selectList(
				"com.odtn.reservation.dao.mapper.ReservationMapper.getCampList",
				camp_id);
	}
}
