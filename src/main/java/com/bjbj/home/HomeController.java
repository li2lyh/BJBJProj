package com.bjbj.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// 메인페이지 요청
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}
	
	// 에러페이지 요청
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
	
}
