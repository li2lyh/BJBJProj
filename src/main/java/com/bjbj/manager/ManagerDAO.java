package com.bjbj.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bjbj.clubboard.ClubBoardDTO;
import com.bjbj.letter.LetterDTO;
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
	
	public List<MemberDTO>searchMember(String category, String keyword) throws Exception{ //전체 회원 검색
		Map<String, String>map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		return session.selectList("managerMapper.searchMember" , map);
	}
	
	
	public List<Map<String, Object>> selectBookroomM() throws Exception{ //전체 모임 조회
		return session.selectList("managerMapper.selectBookroomM");
	}
	
	public int deleteBookroomM(int room_id) throws Exception{ //모임 개별 삭제
		return session.delete("managerMapper.deleteBookroomM" , room_id);
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
	public void deleteReport(String email)throws Exception{ //회원 신고 - 신고 삭제
		session.delete("managerMapper.deleteReport", email);
	}
	public List<ReportBookroomDTO>selectRoomreport()throws Exception{ //모임 신고 조회
		return session.selectList("managerMapper.selectRoomreport");
	}
	public void deleteReportBR(int room_id)throws Exception{ //모임신고 - 신고 삭제
		session.delete("managerMapper.deleteReportBR", room_id);
	}
	
	public void addReport(ReportDTO dto)throws Exception{ //회원신고 - 경고 추가
		session.update("managerMapper.addReport", dto);
	}
	
	public void addReportBR(int room_id)throws Exception{ //모임신고 - 경고 추가
		session.update("managerMapper.addReportBR", room_id);
	}
	public void modifyActionBR(int room_id)throws Exception{ //모임신고 - 조치 변경
		session.update("managerMapper.modifyActionBR", room_id);
	}
	
}
