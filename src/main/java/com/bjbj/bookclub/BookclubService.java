package com.bjbj.bookclub;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.member.MemberDAO;

@Service
public class BookclubService {
	@Autowired
	private BookclubDAO dao;
	@Autowired
	private MemberDAO memberDao;

	public List<BookclubDTO> selectList() throws Exception {
		List<BookclubDTO> list = dao.selectList();
		return dao.selectList();
	}

	public void insert(BookclubDTO dto, RoleDTO roleDto) throws Exception {
		// room_id 시퀀스 미리 생성 (role table, bookroom table 동시 적용)
		int room_id = dao.selectSeq();
		dto.setRoom_id(room_id);
		roleDto.setRoom_id(room_id);

		dao.insert(dto);
		dao.insertRole(roleDto);
	}

	public void insertRole(RoleDTO dto) throws Exception {
		dao.insertRole(dto);
	}

	// room_id 에 따른 한개 리스트 가져오기
	public BookclubDTO selectOne(int room_id) throws Exception {
		return dao.selectOne(room_id);
	}

	// email로 해당 role 데이터 가져오기
	public RoleDTO selectRole(String email) throws Exception {
		return dao.selectRole(email);
	}

	// 날짜표기 format (String to String)
	public String getStrDate(String string) throws Exception {
		return dao.getStrDate(string);
	}

	// 자기소개 데이터 업데이트
	public int updateMydesc(String email, String mydesc) throws Exception {
		return memberDao.updateMydesc(email, mydesc);
	}

	// waiting 테이블 데이터 삽입
	public void insertWaiting(WaitingDTO dto) throws Exception {
		dao.insertWaiting(dto);
	}

	// 이메일로 waiting 테이블 조회
	public WaitingDTO selectByEmail(String email) throws Exception {
		return dao.selectByEmail(email);
	}

	// Room_id 에 따른 지원 인원 보기
	public List<String> selectByRoom(int room_id) throws Exception {
		return dao.selectByRoom(room_id);
	}

	// waiting 테이블에서 이메일로 해당 데이터 삭제
	public void deleteByEmail(String email) throws Exception {
		dao.deleteByEmail(email);
	}

	// 현재인원 + 1
	public void updateCurrent(int room_id) throws Exception {
		dao.updateCurrent(room_id);
	}

	public int updateStatus(String room_status, int room_id) throws Exception {

		return dao.updateStatus(room_status, room_id);
	}

}
