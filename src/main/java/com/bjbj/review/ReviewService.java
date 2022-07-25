package com.bjbj.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewService {
	@Autowired
	private ReviewDAO dao;

	/* 전제 조회 */
	public List<ReviewDTO> selectAll() throws Exception {
		return dao.selectAll();
	}

	/* 최근순으로 조회 */
	public List<ReviewDTO> selectLately(String email) throws Exception {
		return dao.selectLately(email);
	}

	/* 페이징 */
	public int getCount(String email) throws Exception {
		return dao.getCount(email);
	}

	/* 페이징 */
	public List<ReviewDTO> selectPage(int start, int end, String email) throws Exception {
		return dao.selectPage(start, end, email);
	}
	
	// 날짜 형식 변경
	public String getDate(String string) throws Exception {
		return dao.getDate(string);
	}
}
