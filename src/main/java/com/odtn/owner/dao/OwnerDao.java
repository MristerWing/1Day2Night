package com.odtn.owner.dao;

import java.util.List;
import java.util.Map;

import com.odtn.owner.dto.OwnerDto;
import com.odtn.owner.dto.OwnerMainPageDto;
import com.odtn.reservation.dto.ReservationDto;
import com.odtn.search.dto.SearchDto;

public interface OwnerDao {
	public OwnerDto login(String owner_key, int user_num);

	public String checkOwnerKey(long owner_key);

	public OwnerMainPageDto getMainPage(long owner_key);

	public List<ReservationDto> getReservationList(int camp_id,
			String fee_name);

	public List<Map<String, Object>> getReservationCountMap(int camp_id);

	public int campUpdate(SearchDto updateCamp);
}
