package com.odtn.admin.dto;

public class AdminDto {
	private int admin_num;
	private int user_num;
	private String admin_ip;
	private String authroity;
	
	
	
	public AdminDto() {}

	

	
	public AdminDto(int admin_num, int user_num, String admin_ip, String authroity) {
		super();
		this.admin_num = admin_num;
		this.user_num = user_num;
		this.admin_ip = admin_ip;
		this.authroity = authroity;
	}




	public int getAdmin_num() {
		return admin_num;
	}




	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}




	public int getUser_num() {
		return user_num;
	}




	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}




	public String getAdmin_ip() {
		return admin_ip;
	}




	public void setAdmin_ip(String admin_ip) {
		this.admin_ip = admin_ip;
	}




	public String getAuthroity() {
		return authroity;
	}




	public void setAuthroity(String authroity) {
		this.authroity = authroity;
	}




	@Override
	public String toString() {
		return "AdminDto [admin_num=" + admin_num + ", user_num=" + user_num + ", admin_ip=" + admin_ip + ", authroity="
				+ authroity + "]";
	}
	
	
	
	
	
}
