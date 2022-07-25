package com.bjbj.books;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {
	@Autowired
	private LikeBookDAO dao;
	
	/* 찜한 도서 조회 */
	public List<LikeBookDTO> likeBook(String email) throws Exception {
		return dao.likeBook(email);
	}
	
	/* 찜한 도서 삭제 */
	public int deleteLikeBook(String book_isbn) throws Exception {
		return dao.deleteLikeBook(book_isbn);
	}

}
