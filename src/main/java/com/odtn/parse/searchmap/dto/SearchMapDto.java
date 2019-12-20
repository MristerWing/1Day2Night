package com.odtn.parse.searchmap.dto;

public class SearchMapDto {

	private int camp_id;
	private int wido;
	private int gyeonddo;
	private String address;
	private String camp_name;
	private String hp;
	
	public SearchMapDto() {}

	public SearchMapDto(int camp_id, int wido, int gyeonddo, String address, String camp_name, String hp) {
		super();
		this.camp_id = camp_id;
		this.wido = wido;
		this.gyeonddo = gyeonddo;
		this.address = address;
		this.camp_name = camp_name;
		this.hp = hp;
	}




	public int getCamp_id() {
		return camp_id;
	}




	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}




	public int getWido() {
		return wido;
	}




	public void setWido(int wido) {
		this.wido = wido;
	}




	public int getGyeonddo() {
		return gyeonddo;
	}




	public void setGyeonddo(int gyeonddo) {
		this.gyeonddo = gyeonddo;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getCamp_name() {
		return camp_name;
	}




	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}




	public String getHp() {
		return hp;
	}




	public void setHp(String hp) {
		this.hp = hp;
	}




	@Override
	public String toString() {
		return "SearchMapDto [camp_id=" + camp_id + ", wido=" + wido + ", gyeonddo=" + gyeonddo + ", address=" + address
				+ ", camp_name=" + camp_name + ", hp=" + hp + "]";
	}

	
	
	
	
	}
