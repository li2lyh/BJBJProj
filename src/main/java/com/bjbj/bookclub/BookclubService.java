
package com.bjbj.bookclub;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.member.MemberDAO;
import com.bjbj.utils.PageDTO;

@Service
public class BookclubService {
	@Autowired
	private BookclubDAO dao;
	@Autowired
	private MemberDAO memberDao;

	/* 전제 조회 */
	public List<BookclubDTO> selectAll() throws Exception {
		return dao.selectAll();
	}

	/* 최근순으로 조회 */
	public List<BookclubDTO> selectLately(String email) throws Exception {
		return dao.selectLately(email);
	}

	/* 페이징 */
	public int getCount(String email) throws Exception {
		return dao.getCount(email);
	}

	/* 페이징 */
	public List<BookclubDTO> selectPage(int start, int end, String email) throws Exception {
		return dao.selectPage(start, end, email);
	}
	

	/* 찜한 모임 조회 */
	public List<BookclubDTO> likeClub(String email) throws Exception {
		return dao.likeClub(email);
	}
	
	/* 찜한 모임 삭제 */
	public void deleteLikeClub(int[] no) throws Exception {
		dao.deleteLikeClub(no);
	}

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
	
	// 날짜 형식 변경 (yy.MM.dd)
	public String getDate(String string) throws Exception {
		return dao.getDate(string);
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
	
	public List<RoleDTO> selectRoleByRoom(int room_id) throws Exception{
		return dao.selectRoleByRoom(room_id);
	}
	
	// 클럽내 게시판 글쓰기
	public void insertBoard(BoardDTO dto) throws Exception{
		dao.insertBoard(dto);
	}
	
	// 클럽내 게시판 목록
		public List<BoardDTO> selectAllBoard() throws Exception{
		return dao.selectAllBoard();
		}
		
		// 클럽내 게시판 목록
				public List<BoardDTO> selectAllBoardById(int room_id) throws Exception{
				return dao.selectAllBoardById(room_id);
				}
	
	
				// 클럽내 게시판 게시글 수정
				public void updateBoard(BoardDTO dto) throws Exception{
					dao.updateBoard(dto);
				}
			
				// 게시글 삭제
				public void deleteBoard(int board_seq) throws Exception{
					dao.deleteBoard(board_seq);
				}

				/* 모임 찜 하기 */
				public int insertLike(LikeClubDTO dto) throws Exception {
					return dao.insertLike(dto);
				}
				
				/* 찜한 모임 삭제 (일반) */
				public int deleteLike(int room_id, String email) throws Exception {
					return dao.deleteLike(room_id, email);
				}

	
}
