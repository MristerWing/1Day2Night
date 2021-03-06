package com.odtn.search.dto;

import java.util.List;

public class SearchPaymentDto {
	private int camp_id;
	private String fee_name;
	private int normal_season_weekdays_fee;
	private int normal_season_holidays_fee;
	private int peak_season_weekdays_fee;
	private int peak_season_holidays_fee;
	private int day_accept_member;
	private List<SearchPaymentDto> searchPaymentDtoList;

	public SearchPaymentDto() {
	}

	public SearchPaymentDto(int camp_id, String fee_name,
			int normal_season_weekdays_fee, int normal_season_holidays_fee,
			int peak_season_weekdays_fee, int peak_season_holidays_fee,
			int day_accept_member) {
		super();
		this.camp_id = camp_id;
		this.fee_name = fee_name;
		this.normal_season_weekdays_fee = normal_season_weekdays_fee;
		this.normal_season_holidays_fee = normal_season_holidays_fee;
		this.peak_season_weekdays_fee = peak_season_weekdays_fee;
		this.peak_season_holidays_fee = peak_season_holidays_fee;
		this.day_accept_member = day_accept_member;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public String getFee_name() {
		return fee_name;
	}

	public void setFee_name(String fee_name) {
		this.fee_name = fee_name;
	}

	public int getNormal_season_weekdays_fee() {
		return normal_season_weekdays_fee;
	}

	public void setNormal_season_weekdays_fee(int normal_season_weekdays_fee) {
		this.normal_season_weekdays_fee = normal_season_weekdays_fee;
	}

	public int getNormal_season_holidays_fee() {
		return normal_season_holidays_fee;
	}

	public void setNormal_season_holidays_fee(int normal_season_holidays_fee) {
		this.normal_season_holidays_fee = normal_season_holidays_fee;
	}

	public int getPeak_season_weekdays_fee() {
		return peak_season_weekdays_fee;
	}

	public void setPeak_season_weekdays_fee(int peak_season_weekdays_fee) {
		this.peak_season_weekdays_fee = peak_season_weekdays_fee;
	}

	public int getPeak_season_holidays_fee() {
		return peak_season_holidays_fee;
	}

	public void setPeak_season_holidays_fee(int peak_season_holidays_fee) {
		this.peak_season_holidays_fee = peak_season_holidays_fee;
	}

	public int getDay_accept_member() {
		return day_accept_member;
	}

	public void setDay_accept_member(int day_accept_member) {
		this.day_accept_member = day_accept_member;
	}

	public List<SearchPaymentDto> getSearchPaymentDtoList() {
		return searchPaymentDtoList;
	}

	public void setSearchPaymentDtoList(
			List<SearchPaymentDto> searchPaymentDtoList) {
		this.searchPaymentDtoList = searchPaymentDtoList;
	}

}
