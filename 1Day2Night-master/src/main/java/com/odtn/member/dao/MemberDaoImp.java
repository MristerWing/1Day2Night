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
	public String getSaltByEmail(String email) {
		
		return sqlSessionTemplate.selectOne("getSaltByEmail", email);
	}
	
	@Override
	public MemberDto isNewMember(String email) {
		return sqlSessionTemplate.selectOne("isNewMember", email);
	}
	@Override
	public int emailDupCheck(String email) {
		
		return sqlSessionTemplate.selectOne("emailDupCheck", email);
	}
	
	@Override
	public int nicknameDuplCheck(String nickname) {
		return sqlSessionTemplate.selectOne("nicknameDuplCheck", nickname);
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
	@Override
	public MemberDto kakaoMemberNewLoad(MemberDto memberDto) {
		return sqlSessionTemplate.selectOne("kakaoMemberNewLoad", memberDto);
	}
	
	public int memberUpdateOk(MemberDto memberDto) {
		return sqlSessionTemplate.update("memberUpdateOk", memberDto);
	}
	@Override
	public MemberDto getMemberDtoP(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("getMemberDtoP", map);
	}
	@Override
	public MemberDto getKakaoMemberDto(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("getKakaoMemberDto", map);
	}
	@Override
	public int kakaoMemberUpdateOk(MemberDto memberDto) {
		return sqlSessionTemplate.update("kakaoMemberUpdateOk", memberDto);
	}
	
}
