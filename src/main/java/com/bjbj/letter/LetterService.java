package com.bjbj.letter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public LetterDTO detailLetter(int no, String email) throws Exception {
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
	// 개별 쪽지 전송 (관리자 기능)
	public void insertLetter(LetterDTO dto) throws Exception {
		dao.insertLetter(dto);
	}

	// 선택된 쪽지 전송 (관리자 기능)
	public void submitSelectLetter(String[] checkLetter, LetterDTO dto) throws Exception {
		dao.submitSelectLetter(checkLetter, dto);
	}

	// 모임장 쪽지 전송 (관리자 기능)
	public void insertRoomLetter(LetterDTO dto) throws Exception {
		dao.insertRoomLetter(dto);
	}

	// 쪽지 읽음처리
	public void updateRead(int no) throws Exception {
		dao.updateRead(no);
	}

	// 쪽지 읽음 유무 (이메일)
	public int readYn(String email) throws Exception {
		return dao.readYn(email);
	}

}