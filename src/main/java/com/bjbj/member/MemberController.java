package com.bjbj.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	
	//
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		
		return "";
	}
	/* ************ 로그인 ************ */
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
	}
	
	/* ************ 아이디, 비밀번호 찾기 ************ */
	// 아이디,비밀번호찾기 페이지 요청
	@RequestMapping(value = "/toFindInfo")
	public String toFindInfo() {
		System.out.println("도착");
		return "/member/find-pw";
	}
	
	// 아이디 찾기(email)
	@RequestMapping(value = "/searchEmail")
	public String searchEamil(String name, String phone, Model model) throws Exception{
		
		System.out.println("이메일을 찾아볼까?");
		
		MemberDTO dto = service.searchEmail(name, phone);
		
		if( dto == null) { // 해당 이메일 없음 -> 이메일 없음 페이지 필요
			System.out.println("해당 이메일이 없습니다!");
			return "";
		} else { // 해당 이메일 있음
			model.addAttribute("dto", dto);
			System.out.println("dto : " + dto);
			return "";
		}
		
	}
	

}
