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
import com.odtn.member.dto.MemberDto;
import com.odtn.reservation.dto.ReservationDto;

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

		LogAspect.logger.info(LogAspect.logMsg + result);

		return result;
	}

	@Override
	public int reservationDoPay(Map<String, Object> reservationMap) {

		return sqlSessionTemplate.insert(
				"com.odtn.reservation.dao.mapper.ReservationMapper.insertReservation",
				reservationMap);
	}

	@Override
	public MemberDto getMemberDto(int user_num) {
		return sqlSessionTemplate.selectOne(
				"com.odtn.reservation.dao.mapper.ReservationMapper.getMemberDto",
				user_num);
	}

	@Override
	public String getOwnerName(String camp_id) {
		return sqlSessionTemplate.selectOne(
				"com.odtn.owner.dao.mapper.OwnerMapper.getOwnerName", camp_id);
	}

	@Override
	public List<ReservationDto> getReservationList(int user_num) {
		return sqlSessionTemplate.selectList(
				"com.odtn.reservation.dao.mapper.ReservationMapper.getReservationList",
				user_num);
	}

	@Override
	public int reservationDelete(Map<String, Object> deleteMap) {
		return sqlSessionTemplate.delete(
				"com.odtn.reservation.dao.mapper.ReservationMapper.deleteReservation",
				deleteMap);
	}
}
