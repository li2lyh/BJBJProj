package com.bjbj.bookclub;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookclubDAO {
	@Autowired
	private SqlSession session;

	/* 전제 조회 */
	public List<BookclubDTO> selectAll() throws Exception {
		return session.selectList("clubMapper.selectAll");
	}
	
	/* 최근순으로 조회 */
	public List<BookclubDTO> selectLately() throws Exception {
		return session.selectList("clubMapper.selectLately");
   }

	public List<BookclubDTO> selectList() throws Exception {
		return session.selectList("clubMapper.selectList");
	}

	// bookroom table insert
	public void insert(BookclubDTO dto) throws Exception {
		session.insert("clubMapper.insert", dto);
	}

	// role table insert
	public void insertRole(RoleDTO dto) throws Exception {
		session.insert("roleMapper.insert", dto);
	}

	// room_id 시퀀스 번호 생성
	public int selectSeq() throws Exception {
		return session.selectOne("clubMapper.selectSeq");
	}

	//room_id 로 해당 방 정보 얻기
	public BookclubDTO selectOne(int room_id) throws Exception {
		return session.selectOne("clubMapper.selectOne", room_id);
	}

	//email로 roleDTO 정보
	public RoleDTO selectRole(String email) throws Exception {
		return session.selectOne("roleMapper.selectRole", email);

	}

	// 날짜 형식 변경("MM월 dd일" / String to String)
	public String getStrDate(String string) {
		String rs = null;
		try {
			// String to Date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(sdf.parse(string).getTime());

			// Date to String
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM월 dd일(E)");
			rs = sdf2.format(date);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// waiting 테이블에 데이터 삽입
	public void insertWaiting(WaitingDTO dto) throws Exception {
		session.insert("waitingMapper.insertWaiting", dto);
	}

	// 이메일로 waiting 테이블 데이터 받기
	public WaitingDTO selectByEmail(String email) throws Exception {
		return session.selectOne("waitingMapper.selectByEmail", email);
	}

	// Room_id 에 따른 지원 인원 보기
	public List<String> selectByRoom(int room_id) throws Exception {
		return session.selectList("waitingMapper.selectByRoom", room_id);
	}

	// waiting 테이블에서 이메일로 해당 데이터 삭제
	public void deleteByEmail(String email) throws Exception {
		session.delete("waitingMapper.deleteByEmail", email);
	}

	// 현재인원 + 1
	public void updateCurrent(int room_id) throws Exception {
		session.update("clubMapper.updateCurrent", room_id);
	}
	
	// 방 상태 변경 (모집중, 진행중)
	public int updateStatus(String room_status, int room_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("room_status", room_status);
		map.put("room_id", room_id);

		return session.update("clubMapper.updateStatus", map);
	}

	//room_id 로 해당 방의 멤버 출력
	public List<RoleDTO> selectRoleByRoom(int room_id) throws Exception{
		return session.selectList("roleMapper.selectRoleByRoom", room_id);
	}

	// 클럽내 게시판 글쓰기
	public void insertBoard(BoardDTO dto) throws Exception{
		session.insert("boardMapper.insertBoard", dto);
	}
	
	// 클럽내 게시판 목록
	public List<BoardDTO> selectAllBoard() throws Exception{
		return session.selectList("boardMapper.selectAllBoard");
	}
	
	// 클럽내 게시판 목록 (room_id)
		public List<BoardDTO> selectAllBoardById(int room_id) throws Exception{
			return session.selectList("boardMapper.selectAllBoardById", room_id);
		}
		
	// 클럽내 게시판 게시글 수정
		public void updateBoard(BoardDTO dto) throws Exception{
			session.update("boardMapper.updateBoard", dto);
		}

		// 게시글 삭제
		public void deleteBoard(int board_seq)throws Exception{
			session.delete("boardMapper.deleteBoard", board_seq);
		}
	
	
	
	
	
	
	/* 페이징 */
	public int getCount() throws Exception {
		return session.selectOne("clubMapper.getCount");
	}
	
	/* 페이징 */
	public List<BookclubDTO> selectPage(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("clubMapper.selectPage", map);
	}
	
	/* 찜한 모임 조회 */
	public List<BookclubDTO> likeClub() throws Exception {
		return session.selectList("clubMapper.likeClub");
	}
	
	






















}
