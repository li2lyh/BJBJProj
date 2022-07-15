package com.bjbj.bookclub;

public class RoleDTO {
	private String email;
	private int room_id;
	private String role;
	
	public RoleDTO() {}
	public RoleDTO(String email, int room_id, String role) {
		super();
		this.email = email;
		this.room_id = room_id;
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "RoleDTO [email=" + email + ", room_id=" + room_id + ", role=" + role + "]";
	}
	
}
