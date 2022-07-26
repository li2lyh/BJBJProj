package com.bjbj.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.bookclub.BookclubDAO;
import com.bjbj.member.MemberDTO;
import com.bjbj.review.ReviewDTO;

@Service
public class ManagerService {
	@Autowired
	private ManagerDAO dao;
	@Autowired
	private BookclubDAO clubdao;
	
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
	
	//전체 회원 검색 
	public List<MemberDTO>searchMember(String category, String keyword)throws Exception{
		return dao.searchMember(category, keyword);
	}
	
	
	//전체 모임 조회
	public List<Map<String, Object>> selectBookroomM() throws Exception{
		return dao.selectBookroomM();
	}
	// 모임 개별 삭제 
	public int deleteBookroomM(int room_id) throws Exception{
		return dao.deleteBookroomM(room_id);
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
	
	//회원 신고 - 신고삭제 
	public void deleteReport(String email)throws Exception{
		dao.deleteReport(email);
	}
	

	
	//회원신고 - 경고 추가
	public void addReport(ReportDTO dto)throws Exception{
		dao.addReport(dto);
	}
	
	//모임 신고 조회 
	public List<ReportBookroomDTO>selectRoomreport() throws Exception{
		return dao.selectRoomreport();
	}
	//모임신고 - 신고삭제
	public void deleteReportBR(int room_id)throws Exception{
		dao.deleteReportBR(room_id);
	}
	

	
	//모임신고 - 경고 추가
	public void addReportBR(int room_id)throws Exception{
		dao.addReportBR(room_id);
	}
	//모임신고 - 조치 상태 변경
	public void modifyActionBR(int room_id)throws Exception{
		dao.modifyActionBR(room_id);
	}
	
}
