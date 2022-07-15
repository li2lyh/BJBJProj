package com.bjbj.bookclub;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookclubService {
@Autowired
private BookclubDAO dao;
	
	public List<BookclubDTO> selectList() throws Exception{
		List<BookclubDTO> list = dao.selectList();	
		return dao.selectList();
	}
	
	public void insert(BookclubDTO dto, RoleDTO roleDto) throws Exception{
		// room_id 시퀀스 미리 생성 (role table, bookroom table 동시 적용)
		int room_id = dao.selectSeq();
		dto.setRoom_id(room_id);
		roleDto.setRoom_id(room_id);
		
		dao.insert(dto);
		dao.insertRole(roleDto);
	}
	
	// room_id 에 따른 한개 리스트 가져오기
	public BookclubDTO selectOne(int room_id) throws Exception{
		return dao.selectOne(room_id);
	}
	
	// email로 해당 role 데이터 가져오기
	public RoleDTO selectRole(String email) throws Exception{
		return dao.selectRole(email);
	}

	// 날짜표기 format (String to String)
	public String getStrDate(String string)throws Exception{
		return dao.getStrDate(string);
	}

	
}
