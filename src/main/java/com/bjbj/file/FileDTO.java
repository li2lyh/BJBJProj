package com.bjbj.file;

public class FileDTO { // img_file
	
	private int img_no;
	private String ori_name;
	private String sys_name;
	
	public FileDTO() {}

	public FileDTO(int img_no, String ori_name, String sys_name) {
		super();
		this.img_no = img_no;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
	}

	public int getimg_no() {
		return img_no;
	}

	public void setimg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getSys_name() {
		return sys_name;
	}

	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}

	@Override
	public String toString() {
		return "FileDTO [img_no=" + img_no + ", ori_name=" + ori_name + ", sys_name=" + sys_name + "]";
	}
	
}
