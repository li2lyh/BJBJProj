package com.bjbj.manager;

public class ReportDTO {
	private String email;
	private String report_content;
	private int report_date;
	private String date;
	private String report_detail;
	
	public ReportDTO() {}
	
	public ReportDTO(String email, String report_content, int report_date, String date, String report_detail) {
		super();
		this.email = email;
		this.report_content = report_content;
		this.report_date = report_date;
		this.date = date;
		this.report_detail = report_detail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public int getReport_date() {
		return report_date;
	}
	public void setReport_date(int report_date) {
		this.report_date = report_date;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getReport_detail() {
		return report_detail;
	}
	public void setReport_detail(String report_detail) {
		this.report_detail = report_detail;
	}
	@Override
	public String toString() {
		return "ReportDTO [email=" + email + ", report_content=" + report_content + ", report_date=" + report_date
				+ ", date=" + date + ", report_detail=" + report_detail + "]";
	}
	
	
}
