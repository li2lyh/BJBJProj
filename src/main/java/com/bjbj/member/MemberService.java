package com.bjbj.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	/* 전제 조회 */
	public List<MemberDTO> selectAll() throws Exception{
		return memberDAO.selectAll();
	}

	/* 계정 삭제 */
	public int delete(String email, String password) throws Exception{
		return memberDAO.delete(email, password);
	}
	
	/* 내 정보 수정*/
	public int updateInfo(String email, String password, String nickname, String mydesc) throws Exception {
		return memberDAO.updateInfo(email, password, nickname, mydesc);
	}

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
