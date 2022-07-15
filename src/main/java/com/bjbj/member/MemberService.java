package com.bjbj.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO; 
	/* *************** 로그인 *************** */
	public MemberDTO login(String email, String password) throws Exception{
		return memberDAO.login(email, password);
	}
	
	/* *************** 회원가입 *************** */
	public int signUp(MemberDTO dto) throws Exception{
		return memberDAO.insert(dto);
	}
	
	/*  회원가입 _ Email 중복 확인  */
	public boolean confirmEmail(String email)throws Exception{
		return memberDAO.confirmEmail(email);
	}
	
	/*  회원가입 _ Nickname 중복 확인  */
	public boolean confirmNickname(String nickname)throws Exception{
		return memberDAO.confirmNickname(nickname);
	}
	
	
	
	/* *************** 아이디 비밀번호 찾기 *************** */
	/*  아이디 찾기  */
	public MemberDTO searchEmail(String name, String phone)throws Exception{
		return memberDAO.searchEmail(name, phone);
	}
	
	/*  비밀번호 변경  */
	public void modifyPw(String email, String tempPw)throws Exception{
		memberDAO.modifyPw(email, tempPw);
	}
}
