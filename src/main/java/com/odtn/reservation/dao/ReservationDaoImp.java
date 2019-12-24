package com.odtn.reservation.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.aop.LogAspect;

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

	@Override
	public ArrayList<HashMap<String, Object>> getCampingSoldOutMap(int camp_id,
			String campingName, Date startDate, Date endDate, int peopleOfNum) {
		Map<String, Object> soldMap = new HashMap<String, Object>();
		soldMap.put("camp_id", camp_id);
		soldMap.put("fee_name", campingName);
		soldMap.put("start_date", startDate);
		soldMap.put("end_date", endDate);
		soldMap.put("people", peopleOfNum);

		LogAspect.logger.info(LogAspect.logMsg + soldMap);

		sqlSessionTemplate.selectOne(
				"com.odtn.reservation.dao.mapper.ReservationMapper.soldProcedureList",
				soldMap);

		@SuppressWarnings("unchecked")
		ArrayList<HashMap<String, Object>> result = (ArrayList<HashMap<String, Object>>) soldMap
				.get("resultMap");

		return result;
	}
}