package com.bjbj.review;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ReviewDTO {
	private int review_no;
	private String review_title;
	private String email;
	private String book_title;
	private String nickname;
	private Date written_date;
	private String content;
	private int views;
	private String img_id;

  public ReviewDTO() {}
	
}
