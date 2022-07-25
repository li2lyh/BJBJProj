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

	private int room_current;

	private String recruit_start; // sysdate
	private String recruit_end; // 모집 종료날짜 (14일동안)
	private String open_date; // 모임 시작일
	private String close_date; // 모임 종료일
	private String room_status;
	private String img_id;
	private String tag;
	private int meet_week;
	private String place;
	
	private int rank; // 순위

	public BookclubDTO() {}
  
	public BookclubDTO(int room_id, String room_title, String room_detail, String book_title, String book_cover,
			int room_people, int room_current, String recruit_start, String recruit_end, String open_date,
			String close_date, String room_status, String img_id, String tag, int meet_week, String place, int rank) {
		super();
		this.room_id = room_id;
		this.room_title = room_title;
		this.room_detail = room_detail;
		this.book_title = book_title;
		this.book_cover = book_cover;
		this.room_people = room_people;
		this.room_current = room_current;
		this.recruit_start = recruit_start;
		this.recruit_end = recruit_end;
		this.open_date = open_date;
		this.close_date = close_date;
		this.room_status = room_status;
		this.img_id = img_id;
		this.tag = tag;
		this.meet_week = meet_week;
		this.place = place;
		this.rank = rank;
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

	public int getRoom_current() {
		return room_current;
	}

	public void setRoom_current(int room_current) {
		this.room_current = room_current;
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
	  
	@Override
	public String toString() {
		return "BookclubDTO [room_id=" + room_id + ", room_title=" + room_title + ", room_detail=" + room_detail
				+ ", book_title=" + book_title + ", book_cover=" + book_cover + ", room_people=" + room_people
				+ ", room_current=" + room_current + ", recruit_start=" + recruit_start + ", recruit_end=" + recruit_end
				+ ", open_date=" + open_date + ", close_date=" + close_date + ", room_status=" + room_status
				+ ", img_id=" + img_id + ", tag=" + tag + ", meet_week=" + meet_week + ", place=" + place + "]";
	}

}