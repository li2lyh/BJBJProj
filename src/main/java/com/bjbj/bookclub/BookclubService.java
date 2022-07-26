package com.bjbj.bookclub;

import java.util.List;
import java.util.HashMap;
import java.util.List;
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
	public List<BookclubDTO> selectAll() throws Exception{
		return dao.selectAll();
	}
	
	/* 최근순으로 조회 */
	public List<BookclubDTO> selectLately() throws Exception {
		return dao.selectLately();
	}
	
	/* 페이징 */
	public void getPage(HttpServletRequest request) throws Exception{
      //한 페이지에 몇개씩 표시할 것인지
      final int PAGE_ROW_COUNT=5;
      //하단 페이지를 몇개씩 표시할 것인지
      final int PAGE_DISPLAY_COUNT=5;
      
      //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
      int pageNum=1;
      //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
      String strPageNum = request.getParameter("pageNum");
      //만일 페이지 번호가 파라미터로 넘어 온다면
      if(strPageNum != null){
         //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
         pageNum=Integer.parseInt(strPageNum);
      }
      
      //보여줄 페이지의 시작 ROWNUM
      int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
      //보여줄 페이지의 끝 ROWNUM
      int endRowNum = pageNum * PAGE_ROW_COUNT;
      
      //startRowNum 과 endRowNum  을 BookclubDTO 객체에 담고
      PageDTO dto = new PageDTO();
      dto.setStartRowNum(startRowNum);
      dto.setEndRowNum(endRowNum);
      
      // BookclubDTO 객체를 이용해서 목록을 얻어온다.
      List<BookclubDTO> list = dao.selectPage(startRowNum, endRowNum);
      
      //하단 시작 페이지 번호 
      int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
      //하단 끝 페이지 번호
      int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
      
      //전체 row 의 갯수
      int totalRow = dao.getCount();
      //전체 페이지의 갯수 구하기
      int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
      //끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
      if(endPageNum > totalPageCount){
         endPageNum = totalPageCount; //보정해 준다. 
      }
      
      //request 영역에 담아주기
      request.setAttribute("list", list);   //Bookclub list
      request.setAttribute("startPageNum", startPageNum);   //시작 페이지 번호
      request.setAttribute("endPageNum", endPageNum);   //끝 페이지 번호
      request.setAttribute("pageNum", pageNum);   //현재 페이지 번호
      request.setAttribute("totalPageCount", totalPageCount);   //모든 페이지 count	      
	}
	
	/* 찜한 모임 조회 */
	public List<BookclubDTO> likeClub() throws Exception {
		return dao.likeClub();
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
	
	
}
