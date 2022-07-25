package com.bjbj.letter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.utils.PageDTO;

@Service
public class LetterService {
	@Autowired
	private LetterDAO dao;

	// 최근순으로 전체 조회
	public List<LetterDTO> selectLately(String email) throws Exception {
		return dao.selectLately(email);
	}

	// 쪽지 삭제
	public void delete(int[] no) throws Exception {
		dao.delete(no);
	}
	
	// 쪽지 상세 보기
	public LetterDTO detailLetter(int no, String email) throws Exception{
		return dao.detailLetter(no, email);
	}
	
	/* 페이징 */
	public int getCount(String email) throws Exception {
		return dao.getCount(email);
	}

	/* 페이징 */
	public List<LetterDTO> selectPage(int start, int end, String email) throws Exception {
		return dao.selectPage(start, end, email);
	}
	
	// 날짜 형식 변경
	public String getDate(String string) throws Exception {
		return dao.getDate(string);
	}

	/*-----------------------*/
	//개별 쪽지 전송 (관리자 기능)
	public void insertLetter(LetterDTO dto) throws Exception{
		dao.insertLetter(dto);
	}
	
	
}
