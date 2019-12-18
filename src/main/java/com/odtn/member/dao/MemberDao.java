package com.odtn.member.dao;

import java.util.Map;

import com.odtn.member.dto.MemberDto;

public interface MemberDao {
	public int memberWrite(MemberDto memberDto);
	public MemberDto isNewMember(String email);
	
	public int isNewEmailAuthKey(String email_auth_key);
	public int updateEmail_auth_key(MemberDto memberDto);
	public MemberDto getDtoEmailAuth(MemberDto memberDto);
	public int updateEmail_auth_status(MemberDto memberDto);
	public MemberDto memberLoginOk(Map<String, String> hMap);
	public int memberDeleteOk(Map<String, Object> map);
	public int kakaoDeleteOk(Map<String, Object> map);
	public MemberDto kakaoMemberLoad(MemberDto memberDtoIsNew);
	
	public MemberDto isNewOAuthMember(Integer user_auth_id);
	
	public int memberWriteInfo(MemberDto memberDto);
	
	
	
}
