package com.bjbj.books;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeBookDAO {

	@Autowired
	private SqlSession session;
	
	// 도서 찜하기
	public int addLikeBook(LikeBookDTO dto) throws Exception {
		int rs = session.insert("likeMapper.insertLikeBook", dto);
		return rs;
	}
	
	// 도서 찜 삭제하기
	public int removeLikeBook(String email, String book_isbn) throws Exception {
		int rs = session.insert("likeMapper.removeLikeBook", book_isbn);
		return rs;
	}
}
