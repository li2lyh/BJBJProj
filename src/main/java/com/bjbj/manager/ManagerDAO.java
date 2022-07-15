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
		session.insert("managerMapper.insertBlacklist" , dto);
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
	
	
	public List<ClubBoardDTO> selectAllclub() throws Exception{ //전체 모임 조회
		return session.selectList("managerMapper.selectAllclub");
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
	
	public void deleteAllReview(int[] review_no)throws Exception{ //리뷰 전체 삭제
		Map<String, Object>map = new HashMap<>();
		map.put("deleteArr", review_no);
		session.delete("managerMapper.deleteAllReview" , map);
	}
	
	public void insertLetter(LetterDTO dto)throws Exception{ //메세지 개별 전송
		session.insert("managerMapper.insertLetter" , dto);
	}
	
	
}
