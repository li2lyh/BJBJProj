 package com.bjbj.review;

import java.sql.Date;
import java.text.SimpleDateFormat;
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
		int rs = session.delete("reviewMapper.delete", review_no);
		return rs; 
	}
	
	/* 전제 조회 */
	public List<ReviewDTO> selectAll() throws Exception{
		return session.selectList("reviewMapper.selectAll");
	}
	
	/* 최근순으로 조회 */
	public List<ReviewDTO> selectLately(String email) throws Exception {
		return session.selectList("reviewMapper.selectLately", email);
	}
	
	/* 페이징 */
	public int getCount(String email) throws Exception {
		return session.selectOne("reviewMapper.getCount", email);
	}
	
	/* 페이징 */
	public List<ReviewDTO> selectPage(int start, int end, String email) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("email", email);
		return session.selectList("reviewMapper.selectPage", map);
	}
	
	// 날짜 형식 변경 (yyyy.MM.dd)
		public String getDate(String string) {
			String rs = null;
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date(sdf.parse(string).getTime());
				
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy.MM.dd");
				rs = sdf2.format(date);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
}
