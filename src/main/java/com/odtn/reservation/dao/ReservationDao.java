package com.odtn.reservation.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface ReservationDao {
	public List<String> getCampingList(int camp_id);

	public ArrayList<HashMap<String, Object>> getCampingSoldOutMap(int camp_id,
			String campingName, Date startDate, Date endDate, int peopleOfNum);
}
