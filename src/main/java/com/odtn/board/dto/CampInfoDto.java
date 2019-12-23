package com.odtn.board.dto;

import java.util.Date;

public class CampInfoDto {

	private int info_num;
	private String title;
	private int user_num;
	private int camp_id;
	private String content;
	private Date write_date;
	private int read_count;

	public CampInfoDto() {
	}

	public CampInfoDto(int info_num, String title, int user_num, int camp_id,
			String content, Date write_date, int read_count) {
		super();
		this.info_num = info_num;
		this.title = title;
		this.user_num = user_num;
		this.camp_id = camp_id;
		this.content = content;
		this.write_date = write_date;
		this.read_count = read_count;
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

	public int getuser_num() {
		return user_num;
	}

	public void setuser_num(int user_num) {
		this.user_num = user_num;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
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

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	@Override
	public String toString() {
		return "CampInfoDto [info_num=" + info_num + ", title=" + title
				+ ", user_num=" + user_num + ", camp_id=" + camp_id
				+ ", content=" + content + ", write_date=" + write_date
				+ ", read_count=" + read_count + "]";
	}

}