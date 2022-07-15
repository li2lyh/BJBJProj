package com.bjbj.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// Home
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}
	
	// Error
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
	
}
