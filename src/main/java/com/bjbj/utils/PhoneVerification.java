package com.bjbj.utils;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@GetMapping("/confirmEmail")
public class PhoneVerification {
	public static String sendPhoneMail(String phone) {
		String api_key = "NCSVC9WIIKEOQ2L1";
		String api_secret = "ROYFZ315BXKDOPLHEOHO9WMW1SPYXDEM";
		Message coolSms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    
	    String randNum = PhoneVerification.randomNumGenerator();
	    params.put("to", phone);
	    params.put("from", "01033260864");
	    params.put("type", "SMS");
	    params.put("text", "[북적북적커뮤니티] [" + randNum + "] 회원가입 인증문자 발송입니다. 회원가입 창에 입력하세요!");
	    params.put("app_version", "test app 1.2"); // application name and version
	
		try {
			JSONObject obj = (JSONObject)coolSms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		return randNum;
	}
	
	public static String randomNumGenerator() {
		Random rand = new Random();
		
		int createNum = 0; // 1자리 난수
		String randNum = ""; // 1자리 난수 -> 문자로 형변환
		String resultNum = ""; // 결과 난수
		int letter = 5; // 자릿수
		
		for (int i = 0; i < letter; i++) {
			createNum = rand.nextInt(9); // 0-9 까지의 수 중에서 난수 생성
			randNum = Integer.toString(createNum); // 생성된 난수를 문자로 변환
			resultNum += randNum; // 생성된 난수 문자열을 수만큼 붙임
		}
		System.out.println(resultNum);
		return resultNum;
	}
}
