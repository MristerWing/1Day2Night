package com.odtn.board.dto;

import java.util.Date;

public class CampQnADto {
	private int qna_num ;
	private String title;
	private int user_num;
	private String password;
	private String qna_type;
	private String content;
	private Date write_date;
	private int read_count;
	private int group_num;
	private int sequence_num;
	private int sequence_level;
	
	public CampQnADto() {}

	public CampQnADto(int qna_num, String title, int user_num, String password, String qna_type, String content,
			Date write_date, int read_count, int group_num, int sequence_num, int sequence_level) {
		super();
		this.qna_num = qna_num;
		this.title = title;
		this.user_num = user_num;
		this.password = password;
		this.qna_type = qna_type;
		this.content = content;
		this.write_date = write_date;
		this.read_count = read_count;
		this.group_num = group_num;
		this.sequence_num = sequence_num;
		this.sequence_level = sequence_level;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQna_type() {
		return qna_type;
	}

	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
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

	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}

	public int getSequence_num() {
		return sequence_num;
	}

	public void setSequence_num(int sequence_num) {
		this.sequence_num = sequence_num;
	}

	public int getSequence_level() {
		return sequence_level;
	}

	public void setSequence_level(int sequence_level) {
		this.sequence_level = sequence_level;
	}

	@Override
	public String toString() {
		return "CampQnADto [qna_num=" + qna_num + ", title=" + title + ", user_num=" + user_num + ", password="
				+ password + ", qna_type=" + qna_type + ", content=" + content + ", write_date=" + write_date
				+ ", read_count=" + read_count + ", group_num=" + group_num + ", sequence_num=" + sequence_num
				+ ", sequence_level=" + sequence_level + "]";
	}

	
	
}
