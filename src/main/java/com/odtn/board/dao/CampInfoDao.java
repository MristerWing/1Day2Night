package com.odtn.board.dao;

import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;

public interface CampInfoDao {
	public int campInfoWrite(CampInfoDto campInfoDto,CampInfoFileDto campInfoFileDto);
}
