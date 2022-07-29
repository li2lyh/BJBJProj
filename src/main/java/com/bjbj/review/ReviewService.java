package com.bjbj.review;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bjbj.file.FileDAO;
import com.bjbj.file.FileDTO;


@Service
public class ReviewService {
	@Autowired
	private ReviewDAO dao;
	@Autowired
	private FileDAO fileDao;
	
	// 게시글 등록
	public void insertReview(ReviewDTO dto, String path, MultipartFile file) throws Exception {
		
		int img_no = fileDao.selectImgNo();
		System.out.println(img_no);
		dto.setImg_no(img_no);
		dao.insertReview(dto);
		
		// 파일 업로드 - 서버 root에 폴더가 있는지 확인
		File realPath = new File(path);
		if (!realPath.exists()) realPath.mkdir();
		// 첨부된 파일이 있을 때
		if (!file.isEmpty()) {
			String ori_name = file.getOriginalFilename();
			String sys_name = UUID.randomUUID() + "_" + ori_name;
			
			file.transferTo(new File(path + File.separator + sys_name));
			fileDao.uploadPhoto(new FileDTO(img_no, ori_name, sys_name));
		}
	}
	
	// 게시글 전체목록 출력
	public List<Map<String, Object>> selectAllReview() throws Exception {
		return dao.selectAllReview();
	}
	
	// 게시글 클릭해서 조회
	public ReviewDTO selectByNo(int review_no) throws Exception {
		return dao.selectByNo(review_no);
	}
	
	// 게시글 삭제
	public int deleteReview(int review_no) throws Exception {
		return dao.deleteReview(review_no);
	}
	
	/* 전제 조회 */
	public List<ReviewDTO> selectAll() throws Exception {
		return dao.selectAll();
	}

	/* 최근순으로 조회 */
	public List<ReviewDTO> selectLately(String email) throws Exception {
		return dao.selectLately(email);
	}

	/* 페이징 */
	public int getCount(String email) throws Exception {
		return dao.getCount(email);
	}

	/* 페이징 */
	public List<ReviewDTO> selectPage(int start, int end, String email) throws Exception {
		return dao.selectPage(start, end, email);
	}
	
	// 날짜 형식 변경
	public String getDate(String string) throws Exception {
		return dao.getDate(string);
  }
	
}
