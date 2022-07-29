
package com.bjbj.member;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Service

public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	/* 회원 조회 */
	public List<MemberDTO> selectAll() throws Exception{
		return memberDAO.selectAll();
	}


	/* 계정 삭제 */
	public int delete(String email, String password) throws Exception{
		return memberDAO.delete(email, password);
	}
	
	/* 내 정보 수정*/
	public int updateInfo(String email, String password, String nickname, String mydesc) throws Exception {
		return memberDAO.updateInfo(email, password, nickname, mydesc);
	}

    /* *************** Login *************** */
	// 일반 로그인
	public MemberDTO login(String email, String password) throws Exception{
		return memberDAO.login(email, password);
	}
	
	//카카오 로그인
	public MemberDTO kakaoLogin(String email)throws Exception{
		return memberDAO.kakaoLogin(email);
	}
	
	/* *************** SignUp *************** */
	public int signUp(MemberDTO dto) throws Exception {
		return memberDAO.insert(dto);
	}

	/* Email 중복확인 */
	public boolean confirmEmail(String email) throws Exception {
		return memberDAO.confirmEmail(email);
	}

	/* 닉네임 중복확인 */
	public boolean confirmNickname(String nickname) throws Exception {
		return memberDAO.confirmNickname(nickname);
	}
	
	/* VerifyPhone _ 휴대폰 본인인증 */
	public void certifiedPhoneNumber(String phone, int randomNumber) {
		String api_key = ""; //NCSVC9WIIKEOQ2L1
	    String api_secret = ""; //ROYFZ315BXKDOPLHEOHO9WMW1SPYXDEM
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01033260864");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[북적북적커뮤니티] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}
	

	/* *************** Email(ID) 찾기 *************** */
	/* 이메일  */
	public MemberDTO searchEmail(String name, String phone) throws Exception {
		return memberDAO.searchEmail(name, phone);
	}

	/*  */
	public MemberDTO selectByEmail(String email) throws Exception {
		return memberDAO.selectByEmail(email);
	}
  
	/* 비밀번호 변경 */
	public void modifyPw(String email, String tempPw)throws Exception{
		memberDAO.modifyPw(email, tempPw);
	}
	
	
}