package com.bjbj.file;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	
	@Autowired
	private SqlSession session;
	
	// 파일 업로드
	public int uploadPhoto(FileDTO dto) throws Exception {
		int rs = session.insert("fileMapper.uploadPhoto", dto);
		return rs;
	}
	
	// img_no 미리 가져오기
	public int selectImgNo() throws Exception {
		int rs = session.selectOne("fileMapper.selectNo");
		return rs;
	}

}
