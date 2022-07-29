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
	

	@RequestMapping("/noticeMail")
	public ModelAndView sendEmail(String email) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		
		String addr = "bjbjcommunity@gmail.com";
		String subject = "[북적북적커뮤니티] 비밀번호가 변경되었습니다. 확인해주세요.";
		String tempPw = mailService.makePw();
		String body = "임시 비밀번호 : " + tempPw ;
		
		mailService.sendEmail(email, addr, subject, body);
		
		// 비밀번호 변경, 메일링
		memberService.modifyPw(email, tempPw);
		
		mv.setViewName("redirect:/");

		return mv;
	}
	


}