package com.bjbj.manager;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ReportDTO {
	private String email;
	private String report_content;
	private int warning_count;
	private String report_date;
	private String report_detail;
	private String reporter_nickname;
	private int report_action;
	
	
	public ReportDTO() {}

	public ReportDTO(String email, String report_content, int warning_count, Date report_date, String report_detail,
			 String reporter_nickname, int report_action) {
		super();
		this.email = email;
		this.report_content = report_content;
		this.warning_count = warning_count;
		this.report_date = getStrDate(report_date);
		this.report_detail = report_detail;
		this.reporter_nickname = reporter_nickname;
		this.report_action = report_action;
	}
	
	public String getStrDate(Date date) {
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
			rs = sdf.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
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

	public int getWarning_count() {
		return warning_count;
	}

	public void setWarning_count(int warning_count) {
		this.warning_count = warning_count;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = getStrDate(report_date);
	}
	
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	
	public String getReport_detail() {
		return report_detail;
	}

	public void setReport_detail(String report_detail) {
		this.report_detail = report_detail;
	}

	public String getReporter_nickname() {
		return reporter_nickname;
	}

	public void setReporter_nickname(String reporter_nickname) {
		this.reporter_nickname = reporter_nickname;
	}
	
	public int getReport_action() {
		return report_action;
	}

	public void setReport_action(int report_action) {
		this.report_action = report_action;
	}

	@Override
	public String toString() {
		return "ReportDTO [email=" + email + ", report_content=" + report_content + ", warning_count=" + warning_count
				+ ", report_date=" + report_date + ", report_detail=" + report_detail + ", reporter_nickname="
				+ reporter_nickname + ", report_action=" + report_action + "]";
	}

}
