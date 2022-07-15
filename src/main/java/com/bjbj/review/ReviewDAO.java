package com.bjbj.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSession session;
	
	/* 전제 조회 */
	public List<ReviewDTO> selectAll() throws Exception{
		return session.selectList("reviewMapper.selectAll");
	}
	
	/* 최근순으로 조회 */
	public List<ReviewDTO> selectLately() throws Exception {
		return session.selectList("reviewMapper.selectLately");
	}
	
	/* 페이징 */
	public int getCount() throws Exception {
		return session.selectOne("reviewMapper.getCount");
	}
	
	/* 페이징 */
	public List<ReviewDTO> selectPage(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("reviewMapper.selectPage", map);
	}
}
