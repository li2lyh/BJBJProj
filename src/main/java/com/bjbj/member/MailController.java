package com.bjbj.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value = "/member")
@Controller
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private MemberService memberService;
	

	//DB작업이 필요한 만큼 DAO들 선언해야함
	
	//아이디와 이메일이 같으면 특정한 메일이 가게..
	@RequestMapping("/noticeMail")
	public ModelAndView sendEmail(String email) throws Exception {
		// 메일 보내기
		ModelAndView mv = new ModelAndView();
		
		String addr = "bjbjcommunity@gmail.com";
		String subject = "Notice";
		String tempPw = mailService.makePw();
		String body = "Test : " + tempPw ;
		
		mailService.sendEmail(email, addr, subject, body);
		
		// 비밀번호 변경
		memberService.modifyPw(email, tempPw);
		
		mv.setViewName("redirect:/");

		return mv;
	}
	


}