package com.bjbj.manager;

public class ReportBookroomDTO {
	private int room_id;
	private String room_title;
	private String report_content;
	private String report_date;
	private String report_detail;
	private String reporter_nickname;
	
	public ReportBookroomDTO() {}

	public ReportBookroomDTO(int room_id, String room_title, String report_content,	String report_date, String report_detail, String reporter_nickname) {
		super();
		this.room_id = room_id;
		this.room_title = room_title;
		this.report_content = report_content;
		this.report_date = report_date;
		this.report_detail = report_detail;
		this.reporter_nickname = reporter_nickname;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getRoom_title() {
		return room_title;
	}

	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_date() {
		return report_date;
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

	@Override
	public String toString() {
		return "ReportBookroomDTO [room_id=" + room_id + ", room_title=" + room_title + ", report_content="
				+ report_content + ", warning_count=" + ", report_date=" + report_date
				+ ", report_detail=" + report_detail + ", report_action=" + ", reporter_nickname="
				+ reporter_nickname + "]";
	}
	
	
	
	
	
}
