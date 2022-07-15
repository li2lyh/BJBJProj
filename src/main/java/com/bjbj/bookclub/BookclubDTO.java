package com.bjbj.bookclub;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class BookclubDTO {
   
   private int room_id;
    private String room_title;
    private String room_detail;
    private String book_title;
    private String book_cover;
    private int room_people;
    private String recruit_start; //sysdate
    private String recruit_end;   // 모집 종료날짜 (14일동안)
    private String open_date;      
    private String close_date;
    private String room_status;
    private String img_id;
    private String tag;
    private int meet_week;
    private String place;
    
    public BookclubDTO() {}
	public BookclubDTO(int room_id, String room_title, String room_detail, String book_title, String book_cover,
			int room_people, String recruit_start, String recruit_end, String open_date, String close_date,
			String room_status, String img_id, String tag, int meet_week, String place) {
		super();
		this.room_id = room_id;
		this.room_title = room_title;
		this.room_detail = room_detail;
		this.book_title = book_title;
		this.book_cover = book_cover;
		this.room_people = room_people;
		this.recruit_start = recruit_start;
		this.recruit_end = recruit_end;
		this.open_date = open_date;
		this.close_date = close_date;
		this.room_status = room_status;
		this.img_id = img_id;
		this.tag = tag;
		this.meet_week = meet_week;
		this.place = place;
	}	
	
	public String getStrDate(Date date){
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
			rs = sdf.format(date);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;	
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
	public String getRoom_detail() {
		return room_detail;
	}
	public void setRoom_detail(String room_detail) {
		this.room_detail = room_detail;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_cover() {
		return book_cover;
	}
	public void setBook_cover(String book_cover) {
		this.book_cover = book_cover;
	}
	public int getRoom_people() {
		return room_people;
	}
	public void setRoom_people(int room_people) {
		this.room_people = room_people;
	}
	public String getRecruit_start() {
		return recruit_start;
	}
	public void setRecruit_start(String recruit_start) {
		this.recruit_start = recruit_start;
	}
	public String getRecruit_end() {
		return recruit_end;
	}
	public void setRecruit_end(String recruit_end) {
		this.recruit_end = recruit_end;
	}
	public String getOpen_date() {
		return open_date;
	}
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}
	public String getClose_date() {
		return close_date;
	}
	public void setClose_date(String close_date) {
		this.close_date = close_date;
	}
	public String getRoom_status() {
		return room_status;
	}
	public void setRoom_status(String room_status) {
		this.room_status = room_status;
	}
	public String getImg_id() {
		return img_id;
	}
	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getMeet_week() {
		return meet_week;
	}
	public void setMeet_week(int meet_week) {
		this.meet_week = meet_week;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}

}
