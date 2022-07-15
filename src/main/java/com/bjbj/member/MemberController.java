package com.bjbj.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	/* ************ 로그인 ************ */
  
  // 로그인 페이지 요청
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "";
	}

	// 로그인 요청
	@ResponseBody
	@RequestMapping(value = "/login")
	public String login(String email, String password) throws Exception{
		MemberDTO dto = service.login(email, password);
		if(dto != null) {
			session.setAttribute("loginSession", dto);
			System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
			return "success";
		} else {
			return "fail";
		}
		
	}


	/* ************ 회원가입 ************ */
  
	// 회원가입 페이지
	@RequestMapping(value = "/toSignUp")
	public String toSignUp() {
		System.out.println("도착");
		return "/member/signup";
	}

	// 회원가입 요청
	@RequestMapping(value = "/signUp")
	public String signUp(MemberDTO dto) throws Exception{
		System.out.println(dto.toString());
		service.signUp(dto);
		return "redirect:/";
	}
	
	// 이메일 중복 확인
	@RequestMapping(value = "/confirmEmail")
	@ResponseBody
	public String confirmEmail(String email) throws Exception{
		// checkEmail이 false를 반환하면 사용가능 email
		if(!service.confirmEmail(email)) return "available";
		// checkEmail이 true를 반환하면 중복 email
		else return "unavailable";
	}
	
	// 닉네임 중복 확인
	@RequestMapping(value = "/confirmNickname")
	@ResponseBody
	public String confirmNickname(String nickname) throws Exception{
		if(!service.confirmNickname(nickname)) return "available";
		else return "unavailable";

	/* ************ 아이디, 비밀번호 찾기 ************ */
  
	// 아이디,비밀번호찾기 페이지 요청
	@RequestMapping(value = "/toFindInfo")
	public String toFindInfo() {
		System.out.println("도착");
		return "/member/find-pw";
	}

	// 아이디 찾기(email)
	@RequestMapping(value = "/searchEmail")
	public String searchEamil(String name, String phone, Model model) throws Exception {

		System.out.println("이메일을 찾아볼까?");

		MemberDTO dto = service.searchEmail(name, phone);

		if (dto == null) { // 해당 이메일 없음 -> 이메일 없음 페이지 필요
			System.out.println("해당 이메일이 없습니다!");
			return "";
		} else { // 해당 이메일 있음
			model.addAttribute("dto", dto);
			System.out.println("dto : " + dto);
			return "";
		}
	}
		
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
