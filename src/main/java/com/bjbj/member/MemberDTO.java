package com.bjbj.member;

public class MemberDTO {
	private String email;
	private String pw;
	private String name;
	private String nickname;
	private String phone;
	private String mydesc;

	public MemberDTO() {
	}

	public MemberDTO(String email, String pw, String name, String nickname, String phone, String mydesc) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.mydesc = mydesc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	@Override
	public String toString() {
		return email + " : " + pw+ " : " + name + " : " + nickname + " : " + phone + " : " + mydesc;
	}

}
