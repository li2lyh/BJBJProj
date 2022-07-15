package com.bjbj.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjbj.bookclub.BookclubDTO;
import com.bjbj.bookclub.BookclubService;
import com.bjbj.letter.LetterService;
import com.bjbj.review.ReviewDTO;
import com.bjbj.review.ReviewService;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService Mservice;
	@Autowired
	private BookclubService Bservice;
	@Autowired
	private ReviewService Rservice;
	@Autowired
	private LetterService Lservice;
	@Autowired
	private HttpSession session;
	
	// 로그인 페이지 요청
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		
		return "";
	}
	
	// 로그인
	@RequestMapping(value = "/login")
	public String login() {
		
		return "";
	}
	
	// 회원가입 페이지 요청
	@RequestMapping(value = "/toSignUp")
	public String toSignUp() {
		
		return "";
	}
	
	// 회원가입
	@RequestMapping(value = "/signUp")
	public String signUp() {
		
		return "";
	}
	
	// 마이페이지 페이지 요청
	@RequestMapping(value = "/toMyinfo")
	public String toMyinfo(Model model) throws Exception{	
		// 참여 독서 모임
		List<BookclubDTO> BookclubList = Bservice.selectLately();
		model.addAttribute("BookclubList", BookclubList);
		
		// 도서 리뷰
		List<ReviewDTO> ReviewList = Rservice.selectLately();
		model.addAttribute("ReviewList", ReviewList);
		return "/mypage/myinfo";
		
		// 찜 도서
		
		// 찜 독서 모임
		/*
		 * List<BookclubDTO> LikeclubList = Bservice.likeClub();
		 * model.addAttribute("LikeclubList", LikeclubList);
		 */
	}
	
	// 내 정보 수정 페이지 요청
	@RequestMapping(value = "/toChange")
	public String toChange(Model model) throws Exception{		
		List<MemberDTO> list = Mservice.selectAll();
		model.addAttribute("list", list);
		return "/mypage/change-myinfo";
	}
	
	// 내 정보 수정 요청
	@RequestMapping(value = "/toModify")
	public String toModify(MemberDTO dto) throws Exception{		
		int rs = Mservice.modify(dto);
		if(rs > 0) {
			System.out.println("수정 완료");
			System.out.println(dto.toString());
		} else {
			System.out.println("수정 실패");
		}
		return "redirect:/mypage/change-myinfo";
	}
	
	// 회원 탈퇴 요청
	@RequestMapping(value = "/toDelete")
	public String toDelete(String email, String pw) throws Exception{		
		int rs = Mservice.delete(email, pw);
		if(rs > 0) {
			System.out.println("탈퇴 완료");
			session.removeAttribute("loginSession");
		} else {
			System.out.println("탈퇴 실패");
		}
		return "/main";
	}
	
	// 참여 독서 모임 페이지 요청
	@RequestMapping(value = "/toMybookclub")
	public String toMybookclub(HttpServletRequest request) throws Exception{		
		Bservice.getPage(request);
		return "/mypage/mybookclub";
	}
	
	// 도서 리뷰 페이지 요청
	@RequestMapping(value = "/toMyreview")
	public String toMyreview(HttpServletRequest request) throws Exception{	
		Rservice.getPage(request);
		return "/mypage/myreview";
	}
	
	// 찜 도서 페이지 요청
	@RequestMapping(value = "/toLikebook")
	public String toLikebook() {		
		return "/mypage/likebook";
	}
	
	// 찜 독서모임 페이지 요청
	@RequestMapping(value = "/toLikeclub")
	public String toLikeclub(Model model) throws Exception{	
		List<BookclubDTO> list = Bservice.likeClub();
		model.addAttribute("list", list);
		return "/mypage/likeclub";
	}

	// 쪽지함 페이지 요청
	@RequestMapping(value = "/toLetter")
	public String toLetter(HttpServletRequest request) throws Exception {		
		Lservice.getPage(request);
		return "/mypage/letter";
	}
	
	// 쪽지 삭제 요청
	@RequestMapping(value = "/toDeleteLetter")
	@ResponseBody
	public String toDeleteLetter(@RequestParam(value="no[]") int[] no) throws Exception{
		for(int n : no) {
			System.out.println(n);
		}
		Lservice.delete(no);
		return "success";
	}
}
