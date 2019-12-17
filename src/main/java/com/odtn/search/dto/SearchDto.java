package com.odtn.search.dto;

public class SearchDto {
	private int camp_id;
	private String camp_name;
	private String tag;
	private String main_image;
	private String address;
	private String hp;
	private String location_type;
	private String operation_type;
	private String camp_type;
	private String operation_period;
	private String operation_day;
	private String camp_link;
	private String sub_image1;
	private String sub_image2;
	private String sub_image3;
	private String etc_facilities;
	private String bottom_type;
	private String site_size;
	private String gramping_facilities;
	private String karaban_facilities;
	private String animal_access;
	private String torch;
	
	SearchDto() {
		
	}

	public SearchDto(int camp_id, String camp_name, String tag, String main_image, String address, String hp,
			String location_type, String operation_type, String camp_type, String operation_period,
			String operation_day, String camp_link, String sub_image1, String sub_image2, String sub_image3,
			String etc_facilities, String bottom_type, String site_size, String gramping_facilities,
			String karaban_facilities, String animal_access, String torch) {
		super();
		this.camp_id = camp_id;
		this.camp_name = camp_name;
		this.tag = tag;
		this.main_image = main_image;
		this.address = address;
		this.hp = hp;
		this.location_type = location_type;
		this.operation_type = operation_type;
		this.camp_type = camp_type;
		this.operation_period = operation_period;
		this.operation_day = operation_day;
		this.camp_link = camp_link;
		this.sub_image1 = sub_image1;
		this.sub_image2 = sub_image2;
		this.sub_image3 = sub_image3;
		this.etc_facilities = etc_facilities;
		this.bottom_type = bottom_type;
		this.site_size = site_size;
		this.gramping_facilities = gramping_facilities;
		this.karaban_facilities = karaban_facilities;
		this.animal_access = animal_access;
		this.torch = torch;
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

	public String getCamp_type() {
		return camp_type;
	}

	public void setCamp_type(String camp_type) {
		this.camp_type = camp_type;
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

	@Override
	public String toString() {
		return "SearchDto [camp_id=" + camp_id + ", camp_name=" + camp_name + ", tag=" + tag + ", main_image="
				+ main_image + ", address=" + address + ", hp=" + hp + ", location_type=" + location_type
				+ ", operation_type=" + operation_type + ", camp_type=" + camp_type + ", operation_period="
				+ operation_period + ", operation_day=" + operation_day + ", camp_link=" + camp_link + ", sub_image1="
				+ sub_image1 + ", sub_image2=" + sub_image2 + ", sub_image3=" + sub_image3 + ", etc_facilities="
				+ etc_facilities + ", bottom_type=" + bottom_type + ", site_size=" + site_size
				+ ", gramping_facilities=" + gramping_facilities + ", karaban_facilities=" + karaban_facilities
				+ ", animal_access=" + animal_access + ", torch=" + torch + "]";
	}
	
}
