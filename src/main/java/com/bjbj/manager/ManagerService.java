package com.bjbj.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjbj.clubboard.ClubBoardDTO;
import com.bjbj.letter.LetterDTO;
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
	
	//블랙리스트 추가
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
	public List<ClubBoardDTO> selectAllclub() throws Exception{
		return dao.selectAllclub();
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
	public void deleteAllReview(int[] review_no)throws Exception{
		dao.deleteAllReview(review_no);
	}
	
	//개별 쪽지 전송
	public void insertLetter(LetterDTO dto)throws Exception{
		dao.insertLetter(dto);
	}
	
	
	
}
