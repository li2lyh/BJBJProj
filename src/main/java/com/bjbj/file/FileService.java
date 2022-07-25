package com.bjbj.file;

import org.springframework.beans.factory.annotation.Autowired;

public class FileService {

	@Autowired
	private FileDAO dao;
	
	// 이미지 업로드
	public int uploadPhoto(FileDTO dto) throws Exception {
		return dao.uploadPhoto(dto);
	}
}
