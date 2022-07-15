package com.bjbj.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	
	/* 전제 조회 */
	public List<MemberDTO> selectAll() throws Exception{
		return dao.selectAll();
	}

	/* 계정 삭제 */
	public int delete(String email, String pw) throws Exception{
		return dao.delete(email, pw);
	}
	
	/* 내 정보 수정*/
	public int modify(MemberDTO dto) throws Exception{
		return dao.modify(dto);
	}
}
