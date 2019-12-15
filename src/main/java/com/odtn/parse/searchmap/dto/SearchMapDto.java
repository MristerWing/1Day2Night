package com.odtn.parse.searchmap.dto;

public class SearchMapDto {

	private int num;
	private String wi;
	private String gyung;
	
	
	public SearchMapDto() {};
	
	
	public SearchMapDto(int num, String wi, String gyung) {
		this.num = num;
		this.wi = wi;
		this.gyung = gyung;
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


	@Override
	public String toString() {
		return "SearchMapDto [num=" + num + ", wi=" + wi + ", gyung=" + gyung + "]";
	}
	
	
	
	
}
