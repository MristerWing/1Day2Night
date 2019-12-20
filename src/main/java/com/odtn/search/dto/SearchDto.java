package com.odtn.search.dto;

import java.util.Date;

public class SearchDto {
	private int camp_id;
	private String camp_name;
	private String title;
	private String camp_type;
	private String tag;
	private String main_image;
	private String address;
	private String hp;
	private String location_type;
	private String operation_type;
	private String operation_period;
	private String operation_day;
	private String camp_link;
	private String sub_image1;
	private String sub_image2;
	private String sub_image3;
	private String content;
	private Date content_modified_date;
	private String main_facilities;
	private String etc_facilities;
	private String bottom_type;
	private String site_size;
	private String gramping_facilities;
	private String karaban_facilities;
	private String animal_access;
	private String torch;
	private int read_count;
	private Date camp_regisdate;
	private int recommand_count;
	private int review_count;
	private double wido;
	private double gyeonddo;

	SearchDto() {

	}

	public SearchDto(int camp_id, String camp_name, String title,
			String camp_type, String tag, String main_image, String address,
			String hp, String location_type, String operation_type,
			String operation_period, String operation_day, String camp_link,
			String sub_image1, String sub_image2, String sub_image3,
			String content, Date content_modified_date, String main_facilities,
			String etc_facilities, String bottom_type, String site_size,
			String gramping_facilities, String karaban_facilities,
			String animal_access, String torch, int read_count,
			Date camp_regisdate, int recommand_count, int review_count,
			double wido, double gyeonddo) {
		super();
		this.camp_id = camp_id;
		this.camp_name = camp_name;
		this.title = title;
		this.camp_type = camp_type;
		this.tag = tag;
		this.main_image = main_image;
		this.address = address;
		this.hp = hp;
		this.location_type = location_type;
		this.operation_type = operation_type;
		this.operation_period = operation_period;
		this.operation_day = operation_day;
		this.camp_link = camp_link;
		this.sub_image1 = sub_image1;
		this.sub_image2 = sub_image2;
		this.sub_image3 = sub_image3;
		this.content = content;
		this.content_modified_date = content_modified_date;
		this.main_facilities = main_facilities;
		this.etc_facilities = etc_facilities;
		this.bottom_type = bottom_type;
		this.site_size = site_size;
		this.gramping_facilities = gramping_facilities;
		this.karaban_facilities = karaban_facilities;
		this.animal_access = animal_access;
		this.torch = torch;
		this.read_count = read_count;
		this.camp_regisdate = camp_regisdate;
		this.recommand_count = recommand_count;
		this.review_count = review_count;
		this.wido = wido;
		this.gyeonddo = gyeonddo;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public String getCamp_name() {
		return camp_name;
	}

	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCamp_type() {
		return camp_type;
	}

	public void setCamp_type(String camp_type) {
		this.camp_type = camp_type;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getMain_image() {
		return main_image;
	}

	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getLocation_type() {
		return location_type;
	}

	public void setLocation_type(String location_type) {
		this.location_type = location_type;
	}

	public String getOperation_type() {
		return operation_type;
	}

	public void setOperation_type(String operation_type) {
		this.operation_type = operation_type;
	}

	public String getOperation_period() {
		return operation_period;
	}

	public void setOperation_period(String operation_period) {
		this.operation_period = operation_period;
	}

	public String getOperation_day() {
		return operation_day;
	}

	public void setOperation_day(String operation_day) {
		this.operation_day = operation_day;
	}

	public String getCamp_link() {
		return camp_link;
	}

	public void setCamp_link(String camp_link) {
		this.camp_link = camp_link;
	}

	public String getSub_image1() {
		return sub_image1;
	}

	public void setSub_image1(String sub_image1) {
		this.sub_image1 = sub_image1;
	}

	public String getSub_image2() {
		return sub_image2;
	}

	public void setSub_image2(String sub_image2) {
		this.sub_image2 = sub_image2;
	}

	public String getSub_image3() {
		return sub_image3;
	}

	public void setSub_image3(String sub_image3) {
		this.sub_image3 = sub_image3;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getContent_modified_date() {
		return content_modified_date;
	}

	public void setContent_modified_date(Date content_modified_date) {
		this.content_modified_date = content_modified_date;
	}

	public String getMain_facilities() {
		return main_facilities;
	}

	public void setMain_facilities(String main_facilities) {
		this.main_facilities = main_facilities;
	}

	public String getEtc_facilities() {
		return etc_facilities;
	}

	public void setEtc_facilities(String etc_facilities) {
		this.etc_facilities = etc_facilities;
	}

	public String getBottom_type() {
		return bottom_type;
	}

	public void setBottom_type(String bottom_type) {
		this.bottom_type = bottom_type;
	}

	public String getSite_size() {
		return site_size;
	}

	public void setSite_size(String site_size) {
		this.site_size = site_size;
	}

	public String getGramping_facilities() {
		return gramping_facilities;
	}

	public void setGramping_facilities(String gramping_facilities) {
		this.gramping_facilities = gramping_facilities;
	}

	public String getKaraban_facilities() {
		return karaban_facilities;
	}

	public void setKaraban_facilities(String karaban_facilities) {
		this.karaban_facilities = karaban_facilities;
	}

	public String getAnimal_access() {
		return animal_access;
	}

	public void setAnimal_access(String animal_access) {
		this.animal_access = animal_access;
	}

	public String getTorch() {
		return torch;
	}

	public void setTorch(String torch) {
		this.torch = torch;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public Date getCamp_regisdate() {
		return camp_regisdate;
	}

	public void setCamp_regisdate(Date camp_regisdate) {
		this.camp_regisdate = camp_regisdate;
	}

	public int getRecommand_count() {
		return recommand_count;
	}

	public void setRecommand_count(int recommand_count) {
		this.recommand_count = recommand_count;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public double getWido() {
		return wido;
	}

	public void setWido(double wido) {
		this.wido = wido;
	}

	public double getGyeonddo() {
		return gyeonddo;
	}

	public void setGyeonddo(double gyeonddo) {
		this.gyeonddo = gyeonddo;
	}

	@Override
	public String toString() {
		return "SearchDto [camp_id=" + camp_id + ", camp_name=" + camp_name
				+ ", title=" + title + ", camp_type=" + camp_type + ", tag="
				+ tag + ", main_image=" + main_image + ", address=" + address
				+ ", hp=" + hp + ", location_type=" + location_type
				+ ", operation_type=" + operation_type + ", operation_period="
				+ operation_period + ", operation_day=" + operation_day
				+ ", camp_link=" + camp_link + ", sub_image1=" + sub_image1
				+ ", sub_image2=" + sub_image2 + ", sub_image3=" + sub_image3
				+ ", content=" + content + ", content_modified_date="
				+ content_modified_date + ", main_facilities=" + main_facilities
				+ ", etc_facilities=" + etc_facilities + ", bottom_type="
				+ bottom_type + ", site_size=" + site_size
				+ ", gramping_facilities=" + gramping_facilities
				+ ", karaban_facilities=" + karaban_facilities
				+ ", animal_access=" + animal_access + ", torch=" + torch
				+ ", read_count=" + read_count + ", camp_regisdate="
				+ camp_regisdate + ", recommand_count=" + recommand_count
				+ ", review_count=" + review_count + ", wido=" + wido
				+ ", gyeonddo=" + gyeonddo + "]";
	}

}
