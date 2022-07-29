package com.bjbj.member;

public class MemberDTO {
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String mydesc;
	private String user_kakao;

	public MemberDTO() {
	}


	public MemberDTO(String email, String password, String name, String nickname, String phone, String mydesc,
			String user_kakao) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.mydesc = mydesc;
		this.user_kakao = user_kakao;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getMydesc() {
		return mydesc;
	}


	public void setMydesc(String mydesc) {
		this.mydesc = mydesc;
	}


	public String getUser_kakao() {
		return user_kakao;
	}


	public void setUser_kakao(String user_kakao) {
		this.user_kakao = user_kakao;
	}


	@Override
	public String toString() {
		return email + " : " + password+ " : " + name + " : " + nickname + " : " + phone + " : " + mydesc + " : " + user_kakao;
	}

}