package com.bjbj.manager;

public class BlacklistDTO {
	private String email;
	private String black_detail;
	private String black_date;
	private int warning_count;
	
	public BlacklistDTO() {}
	
	public BlacklistDTO(String email, String black_detail, String black_date, int warning_count) {
		super();
		this.email = email;
		this.black_detail = black_detail;
		this.black_date = black_date;
		this.warning_count = warning_count;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBlack_detail() {
		return black_detail;
	}
	public void setBlack_detail(String black_detail) {
		this.black_detail = black_detail;
	}
	public String getBlack_date() {
		return black_date;
	}
	public void setBlack_date(String black_date) {
		this.black_date = black_date;
	}
	public int getWarning_count() {
		return warning_count;
	}
	public void setWarning_count(int warning_count) {
		this.warning_count = warning_count;
	}
	@Override
	public String toString() {
		return  email + black_detail +  black_date + warning_count ;
	}
	
	
	
	
}
