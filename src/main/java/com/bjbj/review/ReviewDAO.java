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
	
	// 게시글 등록
	public int insertReview(ReviewDTO dto) throws Exception {
		int rs = session.insert("reviewMapper.insert", dto);	
		return rs;
	}
	
	// 게시글 전체목록 출력
	public List<Map<String, Object>> selectAllReview() throws Exception {
		List<Map<String, Object>> list = session.selectList("reviewMapper.selectAll");
		return list;
	}
	
	// 게시글 클릭해서 조회
	public ReviewDTO selectByNo(int review_no) throws Exception {
		System.out.println(review_no);
		ReviewDTO post = session.selectOne("reviewMapper.selectByNo", review_no);
		return post;
	}
	
	// 게시글 삭제
	public int deleteReview(int review_no) throws Exception {
		int rs = session.delete("reviewMapper.deletePost", review_no);
		return rs; 
	}
	
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
