package com.bjbj.letter;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class LetterDTO {
	private int no;
	private String email;
	private String title;
	private String content;
	private String written_date;
	private String read;
	
	public LetterDTO() {}

	public LetterDTO(int no, String email, String title, String content, String written_date, String read) {
		super();
		this.no = no;
		this.email = email;
		this.title = title;
		this.content = content;
		this.written_date = written_date;
		this.read = read;
	}

	public LetterDTO(int no, String email, String title, String content, Date written_date, String read) {
		super();
		this.no = no;
		this.email = email;
		this.title = title;
		this.content = content;
		this.written_date = getStrDate(written_date);
		this.read = read;
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

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWritten_date() {
		return written_date;
	}

	public void setWritten_date(String written_date) {
		this.written_date = written_date;
	}
	
	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}
}

