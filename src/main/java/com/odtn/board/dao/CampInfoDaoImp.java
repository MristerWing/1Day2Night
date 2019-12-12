package com.odtn.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.board.dto.CampInfoDto;
import com.odtn.board.dto.CampInfoFileDto;

@Component
public class CampInfoDaoImp implements CampInfoDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int campInfoWrite(CampInfoDto campInfoDto, CampInfoFileDto campInfoFileDto) {
		int check=0;
		
		if(campInfoFileDto.getFile_name()==null) {
	
		}
		return 0;
	}
}
