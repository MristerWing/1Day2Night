package com.odtn.board.dto;

import java.util.Date;

public class CampInfoDto {
	
	private int info_num;
	private String title;
	private String writer;
	private String content;
	private Date write_date;

	public CampInfoDto() {}

	public CampInfoDto(int info_num, String title, String writer, String content, Date write_date) {
		super();
		this.info_num = info_num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.write_date = write_date;
	}

	public int getInfo_num() {
		return info_num;
	}

	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "CampInfoDto [info_num=" + info_num + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", write_date=" + write_date + "]";
	}
	
	
	
	
}
