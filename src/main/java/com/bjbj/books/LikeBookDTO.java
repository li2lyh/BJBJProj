package com.bjbj.books;

public class LikeBookDTO {
	private String book_isbn;
	private String book_title;
	private String book_author;
	private String email;
	private String img_id;
	
	public LikeBookDTO() {}
	public LikeBookDTO(String book_isbn, String book_title, String book_author, String email, String img_id) {
		super();
		this.book_isbn = book_isbn;
		this.book_title = book_title;
		this.book_author = book_author;
		this.email = email;
		this.img_id = img_id;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImg_id() {
		return img_id;
	}
	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}
	
	
}
