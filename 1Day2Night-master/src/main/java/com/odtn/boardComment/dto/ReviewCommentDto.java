package com.odtn.boardComment.dto;

import java.util.Date;

public class ReviewCommentDto {
	private int comment_num;
	private int review_num ;
	private int user_num;
	private String comment_content;
	private Date write_date;
	
	public ReviewCommentDto () {}

	public ReviewCommentDto(int comment_num, int review_num, int user_num, String comment_content,
			Date write_date) {
		super();
		this.comment_num = comment_num;
		this.review_num = review_num;
		this.user_num = user_num;
		this.comment_content = comment_content;
		this.write_date = write_date;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
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

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "CampReviewCommentDto [comment_num=" + comment_num + ", review_num=" + review_num + ", user_num="
				+ user_num + ", comment_content=" + comment_content + ", write_date=" + write_date + "]";
	}
	
	
}
