package com.bjbj.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;
	
	/* 전제 조회 */
	public List<MemberDTO> selectAll() throws Exception{
		return session.selectList("memberMapper.selectAll");
	}
	
	/* 계정 삭제 */
	public int delete(String email, String pw) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pw", pw);
		return session.delete("memberMapper.selectAll" , map);
	}
	
	/* 내 정보 수정*/
	public int modify(MemberDTO dto) throws Exception{
		return session.update("memberMapper.modify" , dto);
	}
}
