package com.bjbj.calendar;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class CalendarDTO {
	
	private int cal_id;
	private int room_id;
	private String cal_title;
	private String cal_writer;
	private String cal_content;
	private String start_date;
	private String end_date;
	private boolean allday;
	private String textColor;
	private String backColor;
	
	
	public CalendarDTO() {}
	public CalendarDTO(int cal_id, int room_id, String cal_title, String cal_writer, String cal_content,
			String start_date, String end_date, boolean allday, String textColor, String backColor) {
		super();
		this.cal_id = cal_id;
		this.room_id = room_id;
		this.cal_title = cal_title;
		this.cal_writer = cal_writer;
		this.cal_content = cal_content;
		this.start_date = start_date;
		this.end_date = end_date;
		this.allday = allday;
		this.textColor = textColor;
		this.backColor = backColor;
	}
	
	public CalendarDTO(int cal_id, int room_id, String cal_title, String cal_writer, String cal_content,
			Date start_date, Date end_date, boolean allday, String textColor, String backColor) {
		super();
		this.cal_id = cal_id;
		this.room_id = room_id;
		this.cal_title = cal_title;
		this.cal_writer = cal_writer;
		this.cal_content = cal_content;
		this.start_date = getStrDate(start_date);   
		this.end_date = getStrDate(end_date);
		this.allday = allday;
		this.textColor = textColor;
		this.backColor = backColor;
	}
	
	
	
	public int getCal_id() {
		return cal_id;
	}
	public void setCal_id(int cal_id) {
		this.cal_id = cal_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public String getCal_writer() {
		return cal_writer;
	}
	public void setCal_writer(String cal_writer) {
		this.cal_writer = cal_writer;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public boolean isAllday() {
		return allday;
	}
	public void setAllday(boolean allday) {
		this.allday = allday;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBackColor() {
		return backColor;
	}
	public void setBackColor(String backColor) {
		this.backColor = backColor;
	}
	
	public String getStrDate(Date date) {
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss");
			rs = sdf.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	@Override
	public String toString() {
		return "CalendarDTO [cal_id=" + cal_id + ", room_id=" + room_id + ", cal_title=" + cal_title + ", cal_writer="
				+ cal_writer + ", cal_content=" + cal_content + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", allday=" + allday + ", textColor=" + textColor + ", backColor=" + backColor + ", getCal_id()="
				+ getCal_id() + ", getRoom_id()=" + getRoom_id() + ", getCal_title()=" + getCal_title()
				+ ", getCal_writer()=" + getCal_writer() + ", getCal_content()=" + getCal_content()
				+ ", getStart_date()=" + getStart_date() + ", getEnd_date()=" + getEnd_date() + ", isAllday()="
				+ isAllday() + ", getTextColor()=" + getTextColor() + ", getBackColor()=" + getBackColor()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
