package com.odtn.owner.service;

import org.springframework.web.servlet.ModelAndView;

public interface OwnerService {
	public ModelAndView ownerLoginOk(int owner_key, int user_num);
}
