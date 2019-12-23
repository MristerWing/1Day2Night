package com.odtn.member.dto;

import java.util.Date;

/**
 * @author kkh
 * @date 2019. 12. 12.
 * @description 확정 아님
 *  카카오 로그인 시 이메일 못가져오는 경우 많은듯
 *  
 */
public class MemberDto {
	private int user_num; //pk 가입자 번호 seq
	private Date register_date; //가입 날짜
	
	private String email; //이메일가입자는 이게 로그인 id
	private String email_auth_key;  //이메일 인증키
	private String password; //이메일가입자용 패스워드
	
	private String register_type; //이메일가입/연동 로그인 구분
	private Integer user_auth_id; //연동로그인 가입자의 고유 id 숫자 19자리까지 존재
	private String email_auth_status; //이메일 인증상태확인
	
	private Integer phone_num; //핸드폰 번호
	//private Integer owner_id;
	private Integer company_id; //사업자 번호 = null이면 일반회원, !=null이면 사업자
	
	private String interest; //관심분야 - 캠핑분야에서의 관심으로 만들 필요 -관심사 관련 캠핑장 추천 가능  -태그와 연결 가능성도(but 사용자 입장에서는 뭐야 같은 거만 나오네 할 가능성도(자기가 관심분야 찍은 태그로 주로 검색할 경우))
	private String user_name; // 회원 이름
	private String nickname; // 회원 닉네임
	private String profile_image; //회원 프로필 사진, null일때 적용할 이미지 필요성
	//private String profile_image_type;
	private String thumbnail_image; //카카오 계정 썸네일 이미지, null일때 적용할 이미지 필요할 수도->동시에 여러 ㅅ들이 같은 이미지를 서버로부터  로딩한다면 렉이 걸리지 않을까 하는 생각
	
	
	
	public MemberDto() {}
	public MemberDto(int user_num, Date register_date, String email, String email_auth_key, String password,
			String register_type, Integer user_auth_id, String email_auth_status, Integer phone_num, Integer company_id,
			String interest, String user_name, String nickname, String profile_image, String thumbnail_image) {
		this.user_num = user_num;
		this.register_date = register_date;
		this.email = email;
		this.email_auth_key = email_auth_key;
		this.password = password;
		this.register_type = register_type;
		this.user_auth_id = user_auth_id;
		this.email_auth_status = email_auth_status;
		this.phone_num = phone_num;
		this.company_id = company_id;
		this.interest = interest;
		this.user_name = user_name;
		this.nickname = nickname;
		this.profile_image = profile_image;
		this.thumbnail_image = thumbnail_image;
	}

	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}



	public Date getRegister_date() {
		return register_date;
	}



	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getEmail_auth_key() {
		return email_auth_key;
	}



	public void setEmail_auth_key(String email_auth_key) {
		this.email_auth_key = email_auth_key;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getRegister_type() {
		return register_type;
	}



	public void setRegister_type(String register_type) {
		this.register_type = register_type;
	}



	public Integer getUser_auth_id() {
		return user_auth_id;
	}



	public void setUser_auth_id(Integer user_auth_id) {
		this.user_auth_id = user_auth_id;
	}



	public String getEmail_auth_status() {
		return email_auth_status;
	}



	public void setEmail_auth_status(String email_auth_status) {
		this.email_auth_status = email_auth_status;
	}



	public Integer getPhone_num() {
		return phone_num;
	}



	public void setPhone_num(Integer phone_num) {
		this.phone_num = phone_num;
	}



	public Integer getCompany_id() {
		return company_id;
	}



	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}



	public String getInterest() {
		return interest;
	}



	public void setInterest(String interest) {
		this.interest = interest;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getProfile_image() {
		return profile_image;
	}



	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}



	public String getThumbnail_image() {
		return thumbnail_image;
	}



	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}



	@Override
	public String toString() {
		return "MemberDto [user_num=" + user_num + ", register_date=" + register_date + ", email=" + email
				+ ", email_auth_key=" + email_auth_key + ", password=" + password + ", register_type=" + register_type
				+ ", user_auth_id=" + user_auth_id + ", email_auth_status=" + email_auth_status + ", phone_num="
				+ phone_num + ", company_id=" + company_id + ", interest=" + interest + ", user_name=" + user_name
				+ ", nickname=" + nickname + ", profile_image=" + profile_image + ", thumbnail_image=" + thumbnail_image
				+ "]";
	}
	
	
}
