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

	
	public BookclubDTO() {}

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

}
