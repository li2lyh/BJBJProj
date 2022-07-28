package com.bjbj.member;

import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;

	/* 전제 조회 */
	public List<MemberDTO> selectAll() throws Exception {
		return session.selectList("memberMapper.selectAll");
	}

	/* 계정 삭제 */
  public int delete(String email, String password) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("password", password);
		return session.delete("memberMapper.delete" , map);
	}
	
	/* 내 정보 수정*/
	public int updateInfo(String email, String password, String nickname, String mydesc) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("password", password);
		map.put("nickname", nickname);
		map.put("mydesc", mydesc);
		return session.update("memberMapper.updateInfo" , map);

	}

	/* *************** Login *************** */
	// 일반 로그인
	public MemberDTO login(String email, String password) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("password", password);
		return session.selectOne("memberMapper.login", map);
	}
	
	
	// 카카오 로그인 _ kakao Login
	public MemberDTO kakaoLogin(String email) throws Exception {
		return session.selectOne("memberMapper.kakaoLogin", email);
	}
	
	/* *************** 블랙리스트 *************** */
	// 블랙리스트
		public MemberDTO checkBlack(String email)throws Exception {
			return session.selectOne("memberMapper.checkBlack", email);
		}
	
	/* *************** SignUp *************** */
	public int insert(MemberDTO dto) throws Exception {
		return session.insert("memberMapper.insert", dto);
	}

	/* *************** Email_Confirm *************** */
	public boolean confirmEmail(String email) throws Exception {
		return session.selectOne("memberMapper.confirmEmail", email);
	}

	/* *************** Nickname_Confirm *************** */
	public boolean confirmNickname(String nickname) throws Exception {
		return session.selectOne("memberMapper.confirmNickname", nickname);
	}

	/* *************** Email(ID) Search *************** */
	public MemberDTO searchEmail(String name, String phone) throws Exception {

		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("phone", phone);
		return session.selectOne("memberMapper.searchEmail", map);
	}

	/* *************** Password Modify *************** */
	public void modifyPw(String email, String tempPw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("password", tempPw);

		System.out.println(email + " : " + tempPw);
		System.out.println(map.toString());

		session.update("memberMapper.modifyPw", map);
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
