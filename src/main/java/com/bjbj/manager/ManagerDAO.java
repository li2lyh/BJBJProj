package com.bjbj.manager;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bjbj.bookclub.BookclubDTO;
import com.bjbj.member.MemberDTO;
import com.bjbj.review.ReviewDTO;

@Repository
public class ManagerDAO {
	@Autowired
	private SqlSession session;
	
	public List<Map<String,Object>> selectAll() throws Exception{ //블랙리스트 조회
		return session.selectList("managerMapper.selectBlacklist");
	}
	
	public int delete(String email) throws Exception{ //블랙리스트 삭제 
		return session.delete("managerMapper.delete" , email);
	}
	
	public void insertBlacklist(BlacklistDTO dto)throws Exception{ //블랙리스트 개별 저장
		session.insert("managerMapper.insert" , dto);
	}
	
	public List<MemberDTO>searchBlacklist(String category, String keyword) throws Exception{ //블랙리스트 검색
		Map<String , String> map = new HashMap<>();
		map.put("category",category);
		map.put("keyword", keyword);
		return session.selectList("managerMapper.searchBlacklist" , map);
	}
	
	public List<Map<String, Object>> selectAllmember() throws Exception{ //전체 회원 조회
		return session.selectList("managerMapper.selectAllmember");
	}
	
	public List<BlacklistDTO>selectBlackmember() throws Exception{ //블랙리스트 여부 조회
		return session.selectList("managerMapper.selectBlackmember");
	}
	
	public List<MemberDTO>searchMember(String category, String keyword) throws Exception{ //전체 회원 검색
		Map<String, String>map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		return session.selectList("managerMapper.searchMember" , map);
	}
	
	
	public List<Map<String, Object>> selectBookroom() throws Exception{ //전체 모임 조회
		return session.selectList("managerMapper.selectBookroom");
	}
	public List<BookclubDTO>searchBookclub(String category, String keyword)throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		return session.selectList("managerMapper.searchBookclub", map);
	}
	
	public int deleteBookroom(int room_id) throws Exception{ //모임 개별 삭제
		return session.delete("managerMapper.deleteBookroom" , room_id);
	}
	
	public List<ReviewDTO> selectAllreview() throws Exception{ //전체 리뷰 조회
		return session.selectList("managerMapper.selectAllreview");
	}
	
	public List<ReviewDTO> searchReview(String category, String keyword) throws Exception{ //리뷰 검색
		Map<String, String>map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		return session.selectList("managerMapper.searchReview" , map);
	}
	
	public void deleteReview(int review_no)throws Exception{ //리뷰 개별 삭제
		session.delete("managerMapper.deleteReview" , review_no);
	}
	
	public void deleteAllReview(int[] no)throws Exception{ //리뷰 전체 삭제
		session.delete("managerMapper.deleteAllReview" , no);
	}
	
	
	public List<ReportDTO>selectAllreport()throws Exception{ //회원 신고 조회
		return session.selectList("managerMapper.selectAllreport");
	}
	public void deleteEachBookroom(int room_id)throws Exception{ //모임 신고 - 바로 삭제
		session.delete("managerMapper.deleteEachBookroom", room_id);
	}
	
	public void deleteReport(String email)throws Exception{ //회원 신고 - 신고 삭제
		session.delete("managerMapper.deleteReport", email);
	}
	public List<ReportBookroomDTO>selectRoomreport()throws Exception{ //모임 신고 조회
		return session.selectList("managerMapper.selectRoomreport");
	}
	public void deleteReportBookroom(int room_id)throws Exception{ //모임신고 - 신고 삭제
		session.delete("managerMapper.deleteReportBookroom", room_id);
	}
	
	public void addReport(ReportDTO dto)throws Exception{ //회원신고 - 경고 추가
		session.update("managerMapper.addReport", dto);
	}
	public int selectMemberReport(ReportDTO dto)throws Exception{ //회원신고 - 경고 추가 후 신고횟수 다시 선택하기
		return session.selectOne("managerMapper.selectMemberReport", dto);
	}
	
	
	public void addReportBookroom(int room_id)throws Exception{ //모임신고 - 경고 추가
		session.update("managerMapper.addReportBookroom", room_id);
	}
	
	// 날짜 형식 변경 (yyyy-MM-dd)
	public String getDate(String string) {
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(sdf.parse(string).getTime());
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			rs = sdf2.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}	
	
}
