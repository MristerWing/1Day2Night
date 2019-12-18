package com.odtn.parse.searchmap.dao;

import java.util.List;

import com.odtn.parse.searchmap.dto.SearchMapDto;

public interface SearchMapDao {
	public int getCount();
//	public int addrescount();
	public List<SearchMapDto> mapList(SearchMapDto searchMapDto);
}
