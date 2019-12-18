package com.odtn.parse.searchmap.dto;

public class SearchMapDto {

	private int num;
	private String wi;
	private String gyung;
	private String addres;
	private String campname;
	private String jibeon;
	
	public SearchMapDto() {}

	
	
	
	public SearchMapDto(int num, String wi, String gyung, String addres, String campname, String jibeon) {
		super();
		this.num = num;
		this.wi = wi;
		this.gyung = gyung;
		this.addres = addres;
		this.campname = campname;
		this.jibeon = jibeon;
	}




	public int getNum() {
		return num;
	}







	public void setNum(int num) {
		this.num = num;
	}







	public String getWi() {
		return wi;
	}







	public void setWi(String wi) {
		this.wi = wi;
	}







	public String getGyung() {
		return gyung;
	}







	public void setGyung(String gyung) {
		this.gyung = gyung;
	}







	public String getAddres() {
		return addres;
	}







	public void setAddres(String addres) {
		this.addres = addres;
	}







	public String getCampname() {
		return campname;
	}







	public void setCampname(String campname) {
		this.campname = campname;
	}







	public String getJibeon() {
		return jibeon;
	}







	public void setJibeon(String jibeon) {
		this.jibeon = jibeon;
	}







	@Override
	public String toString() {
		return "SearchMapDto [num=" + num + ", wi=" + wi + ", gyung=" + gyung + ", addres=" + addres + ", campname="
				+ campname + ", jibeon=" + jibeon + "]";
	}

	
	

}
