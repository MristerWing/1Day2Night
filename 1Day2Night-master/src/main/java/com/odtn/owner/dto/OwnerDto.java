package com.odtn.owner.dto;

public class OwnerDto {
	private Long owner_key;
	private int camp_id;
	private int user_num;

	public OwnerDto() {
	}

	public OwnerDto(Long owner_key, int camp_id, int user_num) {
		super();
		this.owner_key = owner_key;
		this.camp_id = camp_id;
		this.user_num = user_num;
	}

	public Long getOwner_key() {
		return owner_key;
	}

	public void setOwner_key(Long owner_key) {
		this.owner_key = owner_key;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	@Override
	public String toString() {
		return "OwnerDto [owner_key=" + owner_key + ", camp_id=" + camp_id
				+ ", user_num=" + user_num + "]";
	}

}
