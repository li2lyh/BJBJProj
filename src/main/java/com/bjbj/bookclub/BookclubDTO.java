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
	private Date recruit_start;
	private Date recruit_end;
	private Date open_date;
	private Date close_date;
	private String room_status;
	private String img_id;
	private String tag;
	private int meet_week;
	private String place;
	
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호

	
	public BookclubDTO() {}
	public BookclubDTO(int room_id, String room_title, String room_detail, String book_title, String book_cover,
			int room_people, Date recruit_start, Date recruit_end, Date open_date, Date close_date,
			String room_status, String img_id, String tag, int meet_week, String place, int startRowNum,
	         int endRowNum, int prevNum, int nextNum) {
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
	    this.startRowNum = startRowNum;
	    this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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
	public Date getRecruit_start() {
		return recruit_start;
	}
	public void setRecruit_start(Date recruit_start) {
		this.recruit_start = recruit_start;
	}
	public Date getRecruit_end() {
		return recruit_end;
	}
	public void setRecruit_end(Date recruit_end) {
		this.recruit_end = recruit_end;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public Date getClose_date() {
		return close_date;
	}
	public void setClose_date(Date close_date) {
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
	
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	@Override
	public String toString() {
		return room_id + " : " + room_title + " : " + room_detail + " : " + book_title + " : " + book_cover + " : " + room_people
				+ " : " + recruit_start + " : " + recruit_end + " : " + open_date + " : " + close_date + " : " + room_status+ " : " + img_id
				+ " : " + tag + " : " + meet_week + " : " + place;
	}
}
