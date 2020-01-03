package com.odtn.owner.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.odtn.owner.dto.OwnerDto;
import com.odtn.reservation.dto.ReservationDto;
import com.odtn.search.dto.SearchDto;
import com.odtn.search.dto.SearchPaymentDto;

public interface OwnerService {
	public ModelAndView ownerLoginOk(String owner_key, int user_num);

	public ModelAndView ownerMainpage(OwnerDto ownerDto);

	public String checkOwnerKey(long owner_key);

	public List<ReservationDto> getReservationList(int camp_id,
			String fee_name);

	public List<Map<String, Object>> getReservationChart(int camp_id);

	public ModelAndView ownerUpdate(int camp_id);

	public ModelAndView ownerUpdateOk(SearchDto updateCamp,
			MultipartFile mainImage, List<MultipartFile> subImage, String root,
			boolean isUpdate);

	public ModelAndView ownerUpdatePayment(int camp_id);

	public ModelAndView ownerUpdatePaymentOk(
			List<SearchPaymentDto> paymentList);

	public ModelAndView ownerWritePaymentOk(List<SearchPaymentDto> paymentList);

	public void ownerInsert(OwnerDto ownerDto, ModelAndView modelAndView);
}
