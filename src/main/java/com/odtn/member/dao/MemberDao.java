package com.odtn.member.dao;

import java.util.Map;

import com.odtn.member.dto.MemberDto;

public interface MemberDao {
	public int memberWrite(MemberDto memberDto);
	public String getSaltByEmail(String email);
	public MemberDto isNewMember(String email);
	public int emailDupCheck(String email);
	public int nicknameDuplCheck(String nickname);
	
	public int isNewEmailAuthKey(String email_auth_key);
	public int updateEmail_auth_key(MemberDto memberDto);
	public MemberDto getDtoEmailAuth(MemberDto memberDto);
	public int updateEmail_auth_status(MemberDto memberDto);
	public MemberDto memberLoginOk(Map<String, String> hMap);
	public int memberDeleteOk(Map<String, Object> map);
	public int kakaoDeleteOk(Map<String, Object> map);
	public MemberDto kakaoMemberLoad(MemberDto memberDtoIsNew);
	public MemberDto kakaoMemberNewLoad(MemberDto memberDto);
	
	public MemberDto isNewOAuthMember(Integer user_auth_id);
	
	public int memberUpdateOk(MemberDto memberDto);
	
	public MemberDto getMemberDtoP(Map<String, Object> map);
	public MemberDto getKakaoMemberDto(Map<String, Object> map);
	public int kakaoMemberUpdateOk(MemberDto memberDto);
}
