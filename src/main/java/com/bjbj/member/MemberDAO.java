package com.bjbj.member;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;
	
	/* *************** 로그인 *************** */
	public MemberDTO login(String email, String password)throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("password", password);
		return session.selectOne("memberMapper.login", map);
	}
	
	/* *************** 회원가입 *************** */
	public int insert(MemberDTO dto)throws Exception{
		return session.insert("memberMapper.insert", dto);
	}
	
	/* *************** 이메일 중복확인 *************** */
	public boolean confirmEmail(String email)throws Exception{
		return session.selectOne("memberMapper.confirmEmail", email);
	}
	
	/* *************** 닉네임 중복확인 *************** */
	public boolean confirmNickname(String nickname)throws Exception{
		return session.selectOne("memberMapper.confirmNickname", nickname);
	}
	
	/* *************** Email 찾기 *************** */
	public MemberDTO searchEmail(String name, String phone)throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("phone", phone);
		return session.selectOne("memberMapper.searchEmail", map);
	}
	
	/* *************** 비밀번호 변경 *************** */
	public void modifyPw(String email, String tempPw)throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("password", tempPw);
		
		System.out.println(email + " : " + tempPw);
		System.out.println(map.toString());
		
		session.update("memberMapper.modifyPw", map);
	}

	
}
