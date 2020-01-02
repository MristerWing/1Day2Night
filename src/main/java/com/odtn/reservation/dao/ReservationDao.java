package com.odtn.reservation.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.odtn.member.dto.MemberDto;
import com.odtn.reservation.dto.ReservationDto;

public interface ReservationDao {
	public List<String> getCampingList(int camp_id);

	public ArrayList<HashMap<String, Object>> getCampingSoldOutMap(int camp_id,
			String campingName, Date startDate, Date endDate, int peopleOfNum);

	public int reservationDoPay(Map<String, Object> reservationMap);

	public MemberDto getMemberDto(int user_num);

	public String getOwnerName(String camp_id);
}
