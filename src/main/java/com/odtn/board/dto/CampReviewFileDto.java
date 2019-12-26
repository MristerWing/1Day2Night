package com.odtn.board.dto;

public class CampReviewFileDto {
	private int review_num;
	private String file_name;
	private String path;
	private Long file_size;
	
	public CampReviewFileDto() {}

	public CampReviewFileDto(int review_num, String file_name, String path, Long file_size) {
		super();
		this.review_num = review_num;
		this.file_name = file_name;
		this.path = path;
		this.file_size = file_size;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
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
	
	
}
