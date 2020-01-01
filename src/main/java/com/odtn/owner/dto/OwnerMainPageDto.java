package com.odtn.owner.dto;

public class OwnerMainPageDto {
	private String user_name;
	private String camp_name;
	private String address;
	private String hp;
	private String camp_link;

	public OwnerMainPageDto() {
	}

	public OwnerMainPageDto(String user_name, String camp_name, String address,
			String hp, String camp_link) {
		super();
		this.user_name = user_name;
		this.camp_name = camp_name;
		this.address = address;
		this.hp = hp;
		this.camp_link = camp_link;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getCamp_name() {
		return camp_name;
	}

	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getCamp_link() {
		return camp_link;
	}

	public void setCamp_link(String camp_link) {
		this.camp_link = camp_link;
	}

	@Override
	public String toString() {
		return "OwnerMainPageDto [user_name=" + user_name + ", camp_name="
				+ camp_name + ", address=" + address + ", hp=" + hp
				+ ", camp_link=" + camp_link + "]";
	}

}
