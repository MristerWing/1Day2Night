package com.odtn.parse.searchmap.dao;

import java.util.List;

import com.odtn.parse.searchmap.dto.SearchMapDto;

public interface SearchMapDao {
	public int getCount();
	public List<SearchMapDto> searchList(int startRow,int endRow);
}
