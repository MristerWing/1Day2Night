package com.odtn.owner.dao;

import com.odtn.owner.dto.OwnerDto;
import com.odtn.owner.dto.OwnerMainPageDto;

public interface OwnerDao {
	public OwnerDto login(String owner_key, int user_num);

	public String checkOwnerKey(long owner_key);

	public OwnerMainPageDto getMainPage(long owner_key);
}
