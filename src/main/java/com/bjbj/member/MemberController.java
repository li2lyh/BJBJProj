package com.bjbj.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	// 회원과 관련된 요청을 처리하는 컨트롤러
	// 회원가입, 로그인
	// 마이페이지
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		
		return "";
	}
	
	// 로그인 요청
	@RequestMapping(value = "/login")
	public String login() {
		
		return "";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/toSignUp")
	public String toSignUp() {
		
		return "";
	}
	
	// 회원가입 요청
	@RequestMapping(value = "/signUp")
	public String signUp() {
		
		return "";
	}

}
