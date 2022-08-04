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

	/* 페이징 */
	public List<BookclubDTO> selectPage(int start, int end, String email) throws Exception {
		return dao.selectPage(start, end, email);
	}

	/* 모임 찜 하기 */
	public int insertLike(LikeClubDTO dto) throws Exception {
		return dao.insertLike(dto);
	}

	/* 찜한 모임 삭제 (일반) */
	public int deleteLike(int room_id, String email) throws Exception {
		return dao.deleteLike(room_id, email);
	}

	/* 찜한 모임 전체 조회 */
	public List<BookclubDTO> likeClub(String email) throws Exception {
		return dao.likeClub(email);
	}

	/* 찜한 모임 삭제 */
	public void deleteLikeClub(int[] no, String email) throws Exception {
		dao.deleteLikeClub(no, email);
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

	public List<RoleDTO> selectRoleByRoom(int room_id) throws Exception {
		return dao.selectRoleByRoom(room_id);
	}

	// room_id 에 따른 닉네임 리스트
	public List<RoleDTO>selectNickByRoom(int room_id)throws Exception{
		return dao.selectNickByRoom(room_id);
	}
		
	// 클럽내 게시판 글쓰기
	public void insertBoard(BoardDTO dto) throws Exception {
		dao.insertBoard(dto);
	}

	// 클럽내 게시판 목록
	public List<BoardDTO> selectAllBoard() throws Exception {
		return dao.selectAllBoard();
	}

	// 클럽내 게시판 목록
	public List<BoardDTO> selectAllBoardById(int room_id) throws Exception {
		return dao.selectAllBoardById(room_id);
	}

	// 클럽내 게시판 게시글 수정
	public void updateBoard(BoardDTO dto) throws Exception {
		dao.updateBoard(dto);
	}

	// 게시글 삭제
	public void deleteBoard(int board_seq) throws Exception {
		dao.deleteBoard(board_seq);
	}

	// 모임 신고
	public void insertReportBookroom(ReportBookroomDTO reportBookroomDTO) throws Exception {
		dao.insertReportBookroom(reportBookroomDTO);
	}

	// 회원 신고
	public void insertReport(ReportDTO reportDTO) throws Exception {
		dao.insertReport(reportDTO);
	}
	
	//bookroom 삭제 (by room_id)
		public void deleteBookroom(int room_id) throws Exception{
			dao.deleteBookroom(room_id);
	}

	//waiting 삭제 (by room_id)
	public void deleteWaitingByRoomId(int room_id) throws Exception{
		dao.deleteWaitingByRoomId(room_id);
	}
	
	//role 삭제 (by room_id)
	public void deleteRoleByRoomId(int room_id) throws Exception{
		dao.deleteRoleByRoomId(room_id);
	}
	
	//현재 날짜(sysdate)에 모집 종료되는 클럽 room_id
	public List<Integer> selectRoomIdByRecruit() throws Exception{
	return dao.selectRoomIdByRecruit();
	}
	
	//현재 날짜(sysdate)에 정상적으로 모임이 종료되는 클럽 room_id
	public List<Integer> selectRoomIdByClosedate() throws Exception{
	return dao.selectRoomIdByClosedate();
	}

	// 모임 종료
	public void setEndStatus(int room_id) throws Exception{
		dao.setEndStatus(room_id);
	}
	
	//종료된 모임 정보 expiration 테이블에 삽입 
	public void insertExpiration(ExpirationDTO dto) throws Exception{
		dao.insertExpiration(dto);
	}

	// 종료된 모임 참여자 및 방 정보 삽입
	public void insertExpirationRole(ExpirationRoleDTO dto) throws Exception{
		dao.insertExpirationRole(dto);
	}
	// 종료된 모임 참여자 및 방 정보 요청 (room_id)
	public List<ExpirationRoleDTO> selectExpirationRole(int room_id)throws Exception{
		return dao.selectExpirationRole(room_id);
	}
	// 종료된 모임 참여자 및 방 정보 요청 (email)
	public List<ExpirationRoleDTO> selectExpirationRoleByEmail(String email)throws Exception{
		return dao.selectExpirationRoleByEmail(email);
	}
	
	// 종료된 모임 정보 가져오기 (email)
	public ExpirationDTO selectExpirationById(int room_id) throws Exception{
		return dao.selectExpirationById(room_id);
	}

	
	// 검색페이지 북클럽 검색
	public List<BookclubDTO> searchByTitle(String keyword) throws Exception{
		return dao.searchByTitle(keyword);
	}
	

	// room_id 에 따른 닉네임 리스트
	public List<RoleDTO>selectNickByRoom(int room_id) throws Exception {
		return dao.selectNickByRoom(room_id);
	}
	
	// room_id 에 따른 닉네임 리스트 (모임원 신고 기능을 위한 작업)
    public List<RoleDTO>selectNickByRoom(int room_id)throws Exception{
        return dao.selectNickByRoom(room_id);
    }
}

