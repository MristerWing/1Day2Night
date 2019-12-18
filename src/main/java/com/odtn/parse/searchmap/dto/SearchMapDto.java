package com.odtn.parse.searchmap.dto;

public class SearchMapDto {

	private int num;
	private String wi;
	private String gyung;
	private String addres;
	
	public SearchMapDto() {}

	
	
	public SearchMapDto(int num, String wi, String gyung, String addres) {
		super();
		this.num = num;
		this.wi = wi;
		this.gyung = gyung;
		this.addres = addres;
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





	@Override
	public String toString() {
		return "SearchMapDto [num=" + num + ", wi=" + wi + ", gyung=" + gyung + ", addres=" + addres + "]";
	};
	
	
	
}
