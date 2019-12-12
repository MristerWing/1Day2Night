package com.odtn.board.dto;

public class CampInfoFileDto {

	private int info_num;
	private String file_name;
	private String path;
	private Long file_size;
	
	public CampInfoFileDto() {}

	public CampInfoFileDto(int info_num, String file_name, String path, Long file_size) {
		super();
		this.info_num = info_num;
		this.file_name = file_name;
		this.path = path;
		this.file_size = file_size;
	}

	public int getInfo_num() {
		return info_num;
	}

	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Long getFile_size() {
		return file_size;
	}

	public void setFile_size(Long file_size) {
		this.file_size = file_size;
	}

	@Override
	public String toString() {
		return "CampInfoFileDto [info_num=" + info_num + ", file_name=" + file_name + ", path=" + path + ", file_size="
				+ file_size + "]";
	}
	
	
}
