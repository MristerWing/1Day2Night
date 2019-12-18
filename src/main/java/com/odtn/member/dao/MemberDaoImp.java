package com.odtn.member.dao;


import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.odtn.member.dto.MemberDto;

@Component
public class MemberDaoImp implements MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int memberWrite(MemberDto memberDto) {
		return sqlSessionTemplate.insert("memberWrite", memberDto);
	}
	@Override
	public MemberDto isNewMember(String email) {
		return sqlSessionTemplate.selectOne("isNewMember", email);
	}
	@Override
	public int updateEmail_auth_key(MemberDto memberDto) {
		
		return sqlSessionTemplate.update("createAuthKey", memberDto);
	}
	@Override
	public int isNewEmailAuthKey(String email_auth_key) {
		return sqlSessionTemplate.selectOne("isNewEmailAuthKey", email_auth_key);
	}
	@Override
	public MemberDto getDtoEmailAuth(MemberDto memberDto) {
		return sqlSessionTemplate.selectOne("getDtoEmailAuth", memberDto);
	}
	@Override
	public int updateEmail_auth_status(MemberDto memberDto) {
		return sqlSessionTemplate.update("emailAuthStatus", memberDto);
	}
	@Override
	public MemberDto memberLoginOk(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("memberLoginOk", map);
	}
	@Override
	public int memberDeleteOk(Map<String, Object> map) {
		return sqlSessionTemplate.delete("memberDeleteOk", map);
	}
	
	@Override
	public int kakaoDeleteOk(Map<String, Object> map) {
		return sqlSessionTemplate.delete("kakaoDeleteOk", map);
	}
	
	@Override
	public MemberDto isNewOAuthMember(Integer user_auth_id) {
		return sqlSessionTemplate.selectOne("isNewOAuthMember", user_auth_id);
	}
	
	@Override
	public MemberDto kakaoMemberLoad(MemberDto memberDtoIsNew) {
		
		return sqlSessionTemplate.selectOne("kakaoMemberLoad", memberDtoIsNew);
	}
	
	
	public int memberWriteInfo(MemberDto memberDto) {
		return sqlSessionTemplate.insert("memberWriteInfo", memberDto);
	}
	
}
