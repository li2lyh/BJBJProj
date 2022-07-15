package com.bjbj.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;

	/* *************** ȸ������ *************** */
	public int insert(MemberDTO dto) throws Exception {
		return session.insert("memberMapper.insert", dto);
	}

	/* *************** �̸��� �ߺ�Ȯ�� *************** */
	public boolean confirmEmail(String email) throws Exception {
		return session.selectOne("memberMapper.confirmEmail", email);
	}

	/* *************** �г��� �ߺ�Ȯ�� *************** */
	public boolean confirmNickname(String nickname) throws Exception {
		return session.selectOne("memberMapper.confirmNickname", nickname);
	}

	/* *************** Email ã�� *************** */
	public MemberDTO searchEmail(String name, String phone) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("phone", phone);
		return session.selectOne("memberMapper.searchEmail", map);
	}

	// 자기소개 업데이트
	public int updateMydesc(String email, String mydesc) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("mydesc", mydesc);
		return session.update("memberMapper.updateMydesc", map);

	}

	// 이메일로 해당 정보 받기
	public MemberDTO selectByEmail(String email) throws Exception {
		return session.selectOne("memberMapper.selectByEmail", email);
	}

}
