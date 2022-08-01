package com.bjbj.books;

public class LikeBookDTO {
	private String book_isbn;
	private String book_title;
	private String book_author;
	private String email;
	private String book_cover;
	
	public LikeBookDTO() {}

	public LikeBookDTO(String book_isbn, String book_title, String book_author, String email, String book_cover) {
		super();
		this.book_isbn = book_isbn;
		this.book_title = book_title;
		this.book_author = book_author;
		this.email = email;
		this.book_cover = book_cover;
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

	public String getBook_cover() {
		return book_cover;
	}

	public void setBook_cover(String book_cover) {
		this.book_cover = book_cover;
	}

	@Override
	public String toString() {
		return "LikeBookDTO [book_isbn=" + book_isbn + ", book_title=" + book_title + ", book_author=" + book_author
				+ ", email=" + email + ", book_cover=" + book_cover + "]";
	}
	
}
