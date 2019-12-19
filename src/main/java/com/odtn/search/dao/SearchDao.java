package com.odtn.search.dao;

import java.util.List;
import java.util.Map;

import com.odtn.search.dto.SearchDto;
import com.odtn.search.dto.SearchPaymentDto;

public interface SearchDao {

	public List<SearchDto> list(Map<String, Object> searchMap);

	public int getCount(Map<String, Object> searchMap);

	public SearchDto getCamp(int camp_id);

	public int updateReadCount(int camp_id);

	public List<SearchPaymentDto> getPayment(int camp_id);
}
