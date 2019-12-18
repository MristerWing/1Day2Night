package com.odtn.search.dao;

import java.util.List;
import java.util.Map;

import com.odtn.search.dto.SearchDto;

public interface SearchDao {

	List<SearchDto> list(Map<String, Object> searchMap);

	int getCount(Map<String, Object> searchMap);
}
