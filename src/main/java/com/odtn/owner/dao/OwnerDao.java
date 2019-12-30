package com.odtn.owner.dao;

import com.odtn.owner.dto.OwnerDto;

public interface OwnerDao {
	public OwnerDto login(int owner_key, int user_num);
}
