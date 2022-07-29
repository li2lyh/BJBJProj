package com.bjbj.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.bookclub.BookclubDTO;
import com.bjbj.member.MemberDTO;
import com.bjbj.review.ReviewDTO;

@Service
public class ManagerService {
	@Autowired
	private ManagerDAO dao;
	
	
	//블랙리스트 조회
	 public List<Map<String, Object>> selectBlacklist() throws Exception{
		 return dao.selectAll();
	 }
	
	//블랙리스트 삭제 
	public int delete(String email) throws Exception{
		return dao.delete(email);
	}
	
	//블랙리스트 개별추가
	public void insertBlacklist(BlacklistDTO dto) throws Exception{
		dao.insertBlacklist(dto);
	}
	
	//블랙리스트 검색
	public List<MemberDTO>searchBlacklist(String category , String keyword)throws Exception{
		return dao.searchBlacklist(category, keyword);
	}
	
	
	//전체 회원 조회
	public List<Map<String, Object>> selectAllmember() throws Exception{
		return dao.selectAllmember();
	}
	//블랙리스트 여부 조회
	public List<BlacklistDTO>selectBlackmember() throws Exception{
		return dao.selectBlackmember();
	}
	
	
	//전체 회원 검색 
	public List<MemberDTO>searchMember(String category, String keyword)throws Exception{
		return dao.searchMember(category, keyword);
	}
	
	
	//전체 모임 조회
	public List<Map<String, Object>> selectBookroom() throws Exception{
		return dao.selectBookroom();
	}
	//모임 검색
	public List<BookclubDTO>searchBookclub(String category, String keyword)throws Exception{
		return dao.searchBookclub(category, keyword);
	}
	
	// 모임 개별 삭제 
	public int deleteBookroom(int room_id) throws Exception{
		return dao.deleteBookroom(room_id);
	}
	
	
	//전체 리뷰 조회
	public List<ReviewDTO> selectAllreview() throws Exception{
		return dao.selectAllreview();
	}
	//리뷰 검색
	public List<ReviewDTO> searchReview(String category, String keyword) throws Exception{
		return dao.searchReview(category, keyword);
	}
	
	//리뷰 개별 삭제 
	public void deleteReview(int review_no) throws Exception{
		dao.deleteReview(review_no);
	}
	//리뷰 전체 삭제
	public void deleteAllReview(int[]no)throws Exception{
		dao.deleteAllReview(no);
	}
	


	//회원 신고 조회 
	public List<ReportDTO>selectAllreport()throws Exception{
		return dao.selectAllreport();
	}
	
	//모임 삭제 - 모임 바로 삭제
	public void deleteEachBookroom(int room_id) throws Exception{
		dao.deleteEachBookroom(room_id);
	}
	
	//회원 신고 - 신고삭제 
	public void deleteReport(String email)throws Exception{
		dao.deleteReport(email);
	}
	
	//회원신고 - 경고 추가
	public void addReport(ReportDTO dto)throws Exception{
		dao.addReport(dto);
		int warningCount = dao.selectMemberReport(dto);
		
		// 신고횟수가 +1 된 후 
		// dto.getEmail()을 이용해서 dao-> select warning_count 
		if(warningCount >= 3) {
			
			BlacklistDTO blackDTO = new BlacklistDTO(dto.getEmail(), "경고횟수 초과" , null, warningCount);
			dao.insertBlacklist(blackDTO);
			
		}
		
		
		/*report 횟수 조회 -> 만약 그게 3이상이라면 여기서 insertblacklist 
		BlackDTO 를 넘겨줘야 하는데 여기에 필요한 값-> 블랙추가할 email, 사유, 날짜, 신고횟수
		email -> reportDTO dto.getEmail()
		사유 -> 윤선이 직접 적어주고
		신고횟수 -> reportDTO dto.getReport_count....()
		BlackDTO blackDTO = new BlackDTO(email, '...사유..',null, dto.Report_...*());
		dao.insertblacklist(blackDTO) 
		*
		*/
	}

	
	//모임 신고 조회 
	public List<ReportBookroomDTO>selectRoomreport() throws Exception{
		return dao.selectRoomreport();
	}
	//모임신고 - 신고삭제
	public void deleteReportBookroom(int room_id)throws Exception{
		dao.deleteReportBookroom(room_id);
	}
	
	//모임신고 - 경고 추가
	public void addReportBookroom(int room_id)throws Exception{
		dao.addReportBookroom(room_id);
	}
	
	// 날짜 형식 변경
	public String getDate(String string) throws Exception {
		return dao.getDate(string);
	}

	
}
