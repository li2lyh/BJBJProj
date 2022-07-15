package com.bjbj.manager;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjbj.clubboard.ClubBoardDTO;
import com.bjbj.letter.LetterDTO;
import com.bjbj.member.MemberDTO;
import com.bjbj.review.ReviewDTO;

@RequestMapping("/manager")
@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/toAllmember") //전체 회원페이지 요청
	public String toAllmember(Model model) throws Exception{
		List<Map<String,Object>> list = service.selectAllmember();
		model.addAttribute("list" , list);
		return"manager/memberList";
	}
	
	@ResponseBody
	@RequestMapping("/toSearchMember") //전체 회원 검색
	public List<MemberDTO>searchMember(String category, String keyword) throws Exception{
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		
		List<MemberDTO>list = service.searchMember(category, keyword);
		return list;
	}
	
	@RequestMapping("/toSendmessage") //쪽지 보내기
	public String toSendmessage(LetterDTO dto) throws Exception{
		service.insertLetter(dto);
		return"redirect:/";
	}
	
	
	@RequestMapping("/toblacklist") //블랙리스트 페이지 요청
	public String toblacklist(Model model)throws Exception{
		List<Map<String, Object>> list = service.selectBlacklist();
		model.addAttribute("list", list);
		return"manager/blacklist";
	}
	
	@RequestMapping("/deleteBlacklist") //블랙리스트 삭제 요청
	public String delete(String email)throws Exception{
		service.delete(email);
		return "redirect:/manager/toblacklist";
	}
	
	@RequestMapping("/addBlacklist") //블랙리스트 개별 추가
	public String addBlacklist(BlacklistDTO dto) throws Exception{
		service.insertBlacklist(dto);
		return "redirect:/manager/toblacklist";
	}
	
	@ResponseBody
	@RequestMapping("/searchBlacklist") //블랙리스트 검색
	public List<MemberDTO>searchBlacklist(String category, String keyword) throws Exception{
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		
		List<MemberDTO>list = service.searchBlacklist(category, keyword);
		return list;
	}
	
	
	@RequestMapping("/toAllclub") //전체 모임페이지 요청
	public String toAllclub(Model model) throws Exception{
		List<ClubBoardDTO> list = service.selectAllclub();
		model.addAttribute("list", list);
		return "manager/bookclubList";
	}
	
	@RequestMapping("/toReview") //리뷰관리 페이지 요청
	public String toReview(Model model) throws Exception{
		List<ReviewDTO>list = service.selectAllreview();
		model.addAttribute("list" , list);
		return "manager/review";
	}
	
	@ResponseBody
	@RequestMapping("/searchReview") //리뷰 검색
	public List<ReviewDTO> searchReview(String category, String keyword)throws Exception{
		System.out.println("category : " + category);
		System.out.println("keyword : " + keyword);
		
		List<ReviewDTO> list = service.searchReview(category, keyword);
		return list;
	}
	
	@RequestMapping("/deleteReview") //리뷰 삭제
	public String deleteReview(int review_no) throws Exception{
		service.deleteReview(review_no);
		return "redirect:/manager/toReview";
	}
	
	
	@RequestMapping("/deleteAllReview") //전체 리뷰 삭제
	@ResponseBody
	public String deleteAllReview(@RequestParam(value="review_no[]")int[]review_no)throws Exception{
		for(int n : review_no) {
			System.out.println(n);
		}
		service.deleteAllReview(review_no);
		return "success";
	}
 	
	@RequestMapping("/toReport") //신고 페이지 요청
	public String toReport() throws Exception{
		return "manager/report";
	}
	
	
	
	
}
