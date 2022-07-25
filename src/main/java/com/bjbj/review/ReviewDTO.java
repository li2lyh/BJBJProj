package com.bjbj.review;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ReviewDTO {
	
	private String review_no;
	private String review_title;
	private String email;
	private String book_title;
	private String nickname;
	private Date written_date;
	private String content;
	private int views;
	private String img_id;
	
	private int startRowNum;
	private int endRowNum;
	private int prevNum; // 이전글의 글번호
	private int nextNum; // 다음글의 글번호
	
	public ReviewDTO() {}

	public ReviewDTO(String review_no, String review_title, String email, String book_title, String nickname,
			Date written_date, String content, int views, String img_id, int startRowNum, int endRowNum, int prevNum,
			int nextNum) {
		super();
		this.review_no = review_no;
		this.review_title = review_title;
		this.email = email;
		this.book_title = book_title;
		this.nickname = nickname;
		this.written_date = written_date;
		this.content = content;
		this.views = views;
		this.img_id = img_id;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	public String getReview_no() {
		return review_no;
	}

	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getWritten_date() {
		return written_date;
	}

	public void setWritten_date(Date written_date) {
		this.written_date = written_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getImg_id() {
		return img_id;
	}

	public void setImg_id(String img_id) {
		this.img_id = img_id;
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
		return "ReviewDTO [review_no=" + review_no + ", review_title=" + review_title + ", email=" + email
				+ ", book_title=" + book_title + ", nickname=" + nickname + ", written_date=" + written_date
				+ ", content=" + content + ", views=" + views + ", img_id=" + img_id + ", startRowNum=" + startRowNum
				+ ", endRowNum=" + endRowNum + ", prevNum=" + prevNum + ", nextNum=" + nextNum + "]";
	}
	
}
