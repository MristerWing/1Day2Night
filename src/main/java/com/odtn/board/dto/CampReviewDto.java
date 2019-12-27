package com.odtn.board.dto;

import java.util.Date;

public class CampReviewDto {
	
	private int review_num;
	private int user_num;
	private String title;
	private String content;
	private int read_count;
	private int camp_id;
	private Date write_date;
	
	public CampReviewDto(){}

	public CampReviewDto(int review_num, int user_num, String title, String content, int read_count, int camp_id,
			Date write_date) {
		super();
		this.review_num = review_num;
		this.user_num = user_num;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.camp_id = camp_id;
		this.write_date = write_date;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "CampReviewDto [review_num=" + review_num + ", user_num=" + user_num + ", title=" + title + ", content="
				+ content + ", read_count=" + read_count + ", camp_id=" + camp_id + ", write_date=" + write_date + "]";
	}
	
	
	
}
