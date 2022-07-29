package com.bjbj.letter;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LetterDAO {
	@Autowired
	private SqlSession session;
	
	// 최근순으로 전체 조회
	public List<LetterDTO> selectLately(String email) throws Exception{
		return session.selectList("letterMapper.selectLately", email);
	}
	
	// 쪽지 삭제
	public void delete(int[] no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("deleteArr", no);
		session.delete("letterMapper.delete", map);
	}
	
	// 쪽지 상세 보기
	public LetterDTO detailLetter(int no, String email) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("email", email);
		return session.selectOne("letterMapper.detailLetter", map);
	}
	
	/* 페이징 */
	public int getCount(String email) throws Exception {
		return session.selectOne("letterMapper.getCount", email);
	}
	
	/* 페이징 */
	public List<LetterDTO> selectPage(int start, int end, String email) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("email", email);
		return session.selectList("letterMapper.selectPage", map);
	}

	// 날짜 형식 변경 (yyyy-MM-dd)
	public String getDate(String string) {
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(sdf.parse(string).getTime());
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			rs = sdf2.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	
	/*----------------*/
	// 쪽지 개별 전송 (관리자 기능)
	public void insertLetter(LetterDTO dto)throws Exception{
		session.insert("letterMapper.insertLetter" , dto);
	}
	// 선택된 쪽지 전송 (관리자 기능)
	public void submitSelectLetter(String[] checkLetter, LetterDTO dto)throws Exception{
	 // map 이용해 쪽지 DTO, 이메일 스트링 배열 담아줌 
		Map<Object, Object> map = new HashMap<>();
		map.put("checkLetter", checkLetter );
		map.put("emailList",  dto);
		session.insert("letterMapper.submitSelectLetter", map); 
	}
	
	//쪽지 모임장 전송 (관리자 기능)
	public void insertRoomLetter(LetterDTO dto)throws Exception{
		session.insert("letterMapper.insertRoomLetter", dto);
	}
	
	
}
