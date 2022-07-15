package com.bjbj.bookclub;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookclubDAO {
	@Autowired
	private SqlSession session;

	/* 전제 조회 */
	public List<BookclubDTO> selectAll() throws Exception {
		return session.selectList("bookclubMapper.selectAll");
	}
	
	/* 최근순으로 조회 */
	public List<BookclubDTO> selectLately() throws Exception {
		return session.selectList("bookclubMapper.selectLately");
	}

	/* 페이징 */
	public int getCount() throws Exception {
		return session.selectOne("bookclubMapper.getCount");
	}
	
	/* 페이징 */
	public List<BookclubDTO> selectPage(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("bookclubMapper.selectPage", map);
	}
	
	/* 찜한 모임 조회 */
	public List<BookclubDTO> likeClub() throws Exception {
		return session.selectList("bookclubMapper.likeClub");
	}
}
