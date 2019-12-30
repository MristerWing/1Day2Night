package com.odtn.owner.service;

import org.springframework.web.servlet.ModelAndView;

import com.odtn.owner.dto.OwnerDto;

public interface OwnerService {
	public ModelAndView ownerLoginOk(String owner_key, int user_num);

	public ModelAndView ownerMainpage(OwnerDto ownerDto);

	public String checkOwnerKey(long owner_key);
}
