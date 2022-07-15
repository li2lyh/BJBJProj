package com.bjbj.letter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LetterDAO {
	@Autowired
	private SqlSession session;
	
	// 최근순으로 전체 조회
	public List<LetterDTO> selectLately() throws Exception{
		return session.selectList("letterMapper.selectLately");
	}
	
	// 쪽지 삭제
	public void delete(int[] no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("deleteArr", no);
		session.delete("letterMapper.delete", map);
	}
	
	/* 페이징 */
	public int getCount() throws Exception {
		return session.selectOne("letterMapper.getCount");
	}
	
	/* 페이징 */
	public List<LetterDTO> selectPage(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("letterMapper.selectPage", map);
	}
}
