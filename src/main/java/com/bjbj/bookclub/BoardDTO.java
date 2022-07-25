package com.bjbj.bookclub;

public class BoardDTO {
	
	private int board_seq;
	private int room_id;
	private String email;
	private String board_title;
	private String board_content;
	private String nickname;
	private String board_date;
	private int board_count;
	
	

	public BoardDTO() {}
	public BoardDTO(int board_seq, int room_id, String email, String board_title, String board_content, String nickname,
			String board_date, int board_count) {
		super();
		this.board_seq = board_seq;
		this.room_id = room_id;
		this.email = email;
		this.board_title = board_title;
		this.board_content = board_content;
		this.nickname = nickname;
		this.board_date = board_date;
		this.board_count = board_count;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}


	@Override
	public String toString() {
		return "BoardDTO [board_seq=" + board_seq + ", room_id=" + room_id + ", email=" + email + ", board_title="
				+ board_title + ", board_content=" + board_content + ", nickname=" + nickname + ", board_date="
				+ board_date + ", board_count=" + board_count + "]";
	}
	
	
}
