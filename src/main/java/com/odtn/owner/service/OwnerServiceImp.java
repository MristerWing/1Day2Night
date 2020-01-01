package com.odtn.owner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.owner.dao.OwnerDao;
import com.odtn.owner.dto.OwnerDto;
import com.odtn.owner.dto.OwnerMainPageDto;
import com.odtn.reservation.dto.ReservationDto;
import com.odtn.search.dao.SearchDao;
import com.odtn.search.dto.SearchPaymentDto;

/**
 * @author KimJinsu
 * @date 2019/12/30
 * @apiNote 사업자 페이지 서비스
 */
@Component
public class OwnerServiceImp implements OwnerService {

	@Autowired
	private OwnerDao ownerDao;

	@Autowired
	private SearchDao searchDao;

	@Override
	public ModelAndView ownerLoginOk(String owner_key, int user_num) {
		ModelAndView modelAndView = new ModelAndView();

		OwnerDto ownerDto = ownerDao.login(owner_key, user_num);

		modelAndView.addObject("ownerDto",
				ownerDto != null ? ownerDto : "error");

		return modelAndView;
	}

	@Override
	public ModelAndView ownerMainpage(OwnerDto ownerDto) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("ownerDto", ownerDto);
		OwnerMainPageDto ownerMainPageDto = ownerDao
				.getMainPage(ownerDto.getOwner_key());
		modelAndView.addObject("ownerMainPageDto", ownerMainPageDto);
		List<SearchPaymentDto> paymentList = searchDao
				.getPayment(ownerDto.getCamp_id());
		modelAndView.addObject("paymentList", paymentList);

		return modelAndView;
	}

	@Override
	public List<ReservationDto> getReservationList(int camp_id,
			String fee_name) {
		return ownerDao.getReservationList(camp_id, fee_name);
	}

	@Override
	public String checkOwnerKey(long owner_key) {
		return ownerDao.checkOwnerKey(owner_key);
	}
}
