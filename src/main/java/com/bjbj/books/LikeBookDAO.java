package com.bjbj.books;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeBookDAO {
	@Autowired
	private SqlSession session;
	
	/* 찜한 도서 조회 */
	public List<LikeBookDTO> likeBook(String email) throws Exception {
		return session.selectList("likeMapper.likeBook", email);
	}
	
	/* 찜한 도서 삭제 */
	public int deleteLikeBook(String book_isbn) throws Exception {
		return session.delete("likeMapper.deleteLikeBook", book_isbn);
	}

}
