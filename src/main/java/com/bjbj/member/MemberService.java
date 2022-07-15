package com.bjbj.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;

  /* *************** �α��� *************** */
	public MemberDTO login(String email, String password) throws Exception{
		return memberDAO.login(email, password);
	}
	
	/* *************** ȸ������ *************** */
	public int signUp(MemberDTO dto) throws Exception {
		return memberDAO.insert(dto);
	}

	/* ȸ������ _ Email �ߺ� Ȯ�� */
	public boolean confirmEmail(String email) throws Exception {
		return memberDAO.confirmEmail(email);
	}

	/* ȸ������ _ Nickname �ߺ� Ȯ�� */
	public boolean confirmNickname(String nickname) throws Exception {
		return memberDAO.confirmNickname(nickname);
	}

	/* *************** ���̵� ��й�ȣ ã�� *************** */
	/* ���̵� ��й�ȣ ã�� */
	public MemberDTO searchEmail(String name, String phone) throws Exception {
		return memberDAO.searchEmail(name, phone);
	}

	public MemberDTO selectByEmail(String email) throws Exception {
		// System.out.println("memberService : " + memberDAO.selectByEmail(email));
		return memberDAO.selectByEmail(email);
	}
  
  /*  ��й�ȣ ����  */
	public void modifyPw(String email, String tempPw)throws Exception{
		memberDAO.modifyPw(email, tempPw);
	}
}
