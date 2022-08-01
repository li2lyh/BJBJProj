package com.bjbj.bookclub;

public class ExpirationDTO {

	private int room_id;
	private String room_title;
	private String room_detail;
	private String book_title;
	private String book_cover;
	private int room_people;
	private int room_current;
	private String open_date;
	private String close_date;
	private String tag;
	private int meet_week;
	private String place;
	
	
	public ExpirationDTO() {}
	public ExpirationDTO(int room_id, String room_title, String room_detail, String book_title, String book_cover,
			int room_people, int room_current, String open_date, String close_date, String tag, int meet_week,
			String place) {
		super();
		this.room_id = room_id;
		this.room_title = room_title;
		this.room_detail = room_detail;
		this.book_title = book_title;
		this.book_cover = book_cover;
		this.room_people = room_people;
		this.room_current = room_current;
		this.open_date = open_date;
		this.close_date = close_date;
		this.tag = tag;
		this.meet_week = meet_week;
		this.place = place;
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
	
	@Override
	public String toString() {
		return "ExpirationDTO [room_id=" + room_id + ", room_title=" + room_title + ", room_detail=" + room_detail
				+ ", book_title=" + book_title + ", book_cover=" + book_cover + ", room_people=" + room_people
				+ ", room_current=" + room_current + ", open_date=" + open_date + ", close_date=" + close_date
				+ ", tag=" + tag + ", meet_week=" + meet_week + ", place=" + place + "]";
	}
	
	
	
	
}
