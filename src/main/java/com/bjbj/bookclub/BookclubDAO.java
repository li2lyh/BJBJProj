package com.bjbj.bookclub;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookclubDAO {
@Autowired
private SqlSession session;
	
	public List<BookclubDTO> selectList() throws Exception{
		return session.selectList("clubMapper.selectList");
	}
	
	// bookroom table insert
	public void insert(BookclubDTO dto) throws Exception{
		session.insert("clubMapper.insert", dto);
	}
	
	// role table insert
	public void insertRole(RoleDTO dto) throws Exception{
		session.insert("roleMapper.insert", dto);
	}
	
	// room_id 시퀀스 번호 생성
	public int selectSeq() throws Exception{
		return session.selectOne("clubMapper.selectSeq");
	}

	public BookclubDTO selectOne(int room_id) throws Exception{
		return session.selectOne("clubMapper.selectOne",room_id);
	}
	
	public RoleDTO selectRole(String email) throws Exception{
		return session.selectOne("roleMapper.selectRole", email);
		
	}
	
	// 날짜 형식 변경("MM월 dd일" / String to String)
	public String getStrDate(String string){
		String rs = null;
		try {
			// String to Date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(sdf.parse(string).getTime());

			// Date to String
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM월 dd일(E)");
			rs = sdf2.format(date);
		

		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;	
	}

}
