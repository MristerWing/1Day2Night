package com.odtn.reservation.dto;

import java.util.Date;

/**
 * @author KimJinsu
 * @date 2019/12/22
 * @apiNote 예약 DTO객체
 */
public class ReservationDto {
	private int reservation_id;
	private int user_number;
	private int camp_id;
	private String camp_site_type;
	private int reservation_personnel;
	private Date register_date;
	private Date start_date;
	private Date end_date;
	private int amount;
	private String user_name;
	private String phone;

	public ReservationDto() {
	}

	public ReservationDto(int reservation_id, int user_number, int camp_id,
			String camp_site_type, int reservation_personnel,
			Date register_date, Date start_date, Date end_date, int amount,
			String user_name, String phone) {
		super();
		this.reservation_id = reservation_id;
		this.user_number = user_number;
		this.camp_id = camp_id;
		this.camp_site_type = camp_site_type;
		this.reservation_personnel = reservation_personnel;
		this.register_date = register_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.amount = amount;
		this.user_name = user_name;
		this.phone = phone;
	}

	public int getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public String getCamp_site_type() {
		return camp_site_type;
	}

	public void setCamp_site_type(String camp_site_type) {
		this.camp_site_type = camp_site_type;
	}

	public int getReservation_personnel() {
		return reservation_personnel;
	}

	public void setReservation_personnel(int reservation_personnel) {
		this.reservation_personnel = reservation_personnel;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "ReservationDto [reservation_id=" + reservation_id
				+ ", user_number=" + user_number + ", camp_id=" + camp_id
				+ ", camp_site_type=" + camp_site_type
				+ ", reservation_personnel=" + reservation_personnel
				+ ", register_date=" + register_date + ", start_date="
				+ start_date + ", end_date=" + end_date + ", amount=" + amount
				+ ", user_name=" + user_name + ", phone=" + phone + "]";
	}

}
