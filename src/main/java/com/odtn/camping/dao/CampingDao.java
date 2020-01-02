package com.odtn.camping.dao;

import java.util.List;

import com.odtn.camping.dto.CampingDto;
import com.odtn.search.dto.SearchDto;

public interface CampingDao {

	CampingDto getCampingDto();

	List<SearchDto> getCampingList();

}
