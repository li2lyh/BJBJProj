package com.bjbj.bookclub;

public class LikeClubDTO {
	private int room_id;
	private String email;
	
	public LikeClubDTO() {}
	public LikeClubDTO(int room_id, String email) {
		super();
		this.room_id = room_id;
		this.email = email;
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
	@Override
	public String toString() {
		return room_id + " : " + email;
	}	
}

