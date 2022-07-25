
package com.bjbj.bookclub;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.manager.ReportBookroomDTO;
import com.bjbj.manager.ReportDTO;
import com.bjbj.member.MemberDAO;
import com.bjbj.member.MemberDTO;

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
		// room_id �떆���뒪 誘몃━ �깮�꽦 (role table, bookroom table �룞�떆 �쟻�슜)
		int room_id = dao.selectSeq();
		dto.setRoom_id(room_id);
		roleDto.setRoom_id(room_id);
		dao.insert(dto);
		dao.insertRole(roleDto);
	}

	public void insertRole(RoleDTO dto) throws Exception {
		dao.insertRole(dto);
	}

	// room_id �뿉 �뵲瑜� �븳媛� 由ъ뒪�듃 媛��졇�삤湲�
	public BookclubDTO selectOne(int room_id) throws Exception {
		return dao.selectOne(room_id);
	}

	// email濡� �빐�떦 role �뜲�씠�꽣 媛��졇�삤湲�
	public RoleDTO selectRole(String email) throws Exception {

		return dao.selectRole(email);
	}

	// �궇吏쒗몴湲� format (String to String)
	public String getStrDate(String string) throws Exception {
		return dao.getStrDate(string);
	}
	
	// 날짜 형식 변경 (yy.MM.dd)
	public String getDate(String string) throws Exception {
		return dao.getDate(string);
	}

	// �옄湲곗냼媛� �뜲�씠�꽣 �뾽�뜲�씠�듃
	public int updateMydesc(String email, String mydesc) throws Exception {
		return memberDao.updateMydesc(email, mydesc);
	}

	// waiting �뀒�씠釉� �뜲�씠�꽣 �궫�엯
	public void insertWaiting(WaitingDTO dto) throws Exception {
		dao.insertWaiting(dto);
	}

	// �씠硫붿씪濡� waiting �뀒�씠釉� 議고쉶
	public WaitingDTO selectByEmail(String email) throws Exception {
		return dao.selectByEmail(email);
	}

	// Room_id �뿉 �뵲瑜� 吏��썝 �씤�썝 蹂닿린
	public List<String> selectByRoom(int room_id) throws Exception {
		return dao.selectByRoom(room_id);
	}

	// waiting �뀒�씠釉붿뿉�꽌 �씠硫붿씪濡� �빐�떦 �뜲�씠�꽣 �궘�젣
	public void deleteByEmail(String email) throws Exception {
		dao.deleteByEmail(email);
	}

	// �쁽�옱�씤�썝 + 1
	public void updateCurrent(int room_id) throws Exception {
		dao.updateCurrent(room_id);
	}

	public int updateStatus(String room_status, int room_id) throws Exception {
		return dao.updateStatus(room_status, room_id);
	}

	// 신고 부분 시작
	public void insertReportBookroom(ReportBookroomDTO reportBookroomDTO) throws Exception {
		dao.insertReportBookroom(reportBookroomDTO);
	}
	
	public void insertReport(ReportDTO reportDTO) throws Exception{
		dao.insertReport(reportDTO);
	}

	public BookclubDTO selectOne(String room_title) throws Exception {
		return dao.selectOne(room_title);
	}
	
	public MemberDTO selectNickname(String nickname) throws Exception{
		return dao.selectNickname(nickname);
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
				return dao.selectAllBoard();
				}
	
	
				// 클럽내 게시판 게시글 수정
				public void updateBoard(BoardDTO dto) throws Exception{
					dao.updateBoard(dto);
				}
			
				// 게시글 삭제
				public void deleteBoard(int board_seq) throws Exception{
					dao.deleteBoard(board_seq);
				}
}
