package com.bjbj.bookclub;

public class WaitingDTO {
	private int room_id;
	private String email;
	private String approval;

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

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public WaitingDTO() {
	}

	public WaitingDTO(int room_id, String email, String approval) {
		super();
		this.room_id = room_id;
		this.email = email;
		this.approval = approval;
	}

	@Override
	public String toString() {
		return "WaitingDTO [room_id=" + room_id + ", email=" + email + ", approval=" + approval + ", getRoom_id()="
				+ getRoom_id() + ", getEmail()=" + getEmail() + ", getApproval()=" + getApproval() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
