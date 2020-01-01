package com.odtn.owner.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.odtn.owner.dto.OwnerDto;
import com.odtn.reservation.dto.ReservationDto;

public interface OwnerService {
	public ModelAndView ownerLoginOk(String owner_key, int user_num);

	public ModelAndView ownerMainpage(OwnerDto ownerDto);

	public String checkOwnerKey(long owner_key);

	public List<ReservationDto> getReservationList(int camp_id,
			String fee_name);
}
