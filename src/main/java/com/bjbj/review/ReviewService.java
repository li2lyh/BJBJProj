package com.bjbj.review;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bjbj.file.FileDAO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO dao;
	@Autowired
	private FileDAO fileDao;
	
	// 게시글 등록
	public void insertReview(ReviewDTO dto, String path, MultipartFile file) throws Exception {
		
		// int img_no = fileDao.selectImgNo();
		// dto.setImg_id(img_id);
		dao.insertReview(dto);
		
		// 파일 업로드 - 서버 root에 폴더가 있는지 확인
		File realPath = new File(path);
		if (!realPath.exists()) realPath.mkdir();
		// 첨부된 파일이 있을 때
		if (!file.isEmpty()) {
			String ori_name = file.getOriginalFilename();
			String sys_name = UUID.randomUUID() + "_" + ori_name;
			
			file.transferTo(new File(path + File.separator + sys_name));
			// fileDao.uploadPhoto(new FileDTO(img_no, ori_name, sys_name));
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
	public List<ReviewDTO> selectAll() throws Exception{
		return dao.selectAll();
	}
	
	/* 최근순으로 조회 */
	public List<ReviewDTO> selectLately() throws Exception {
		return dao.selectLately();
	}
	
	/* 페이징 */
	public void getPage(HttpServletRequest request) throws Exception {
      //한 페이지에 몇개씩 표시할 것인지
      final int PAGE_ROW_COUNT=5;
      //하단 페이지를 몇개씩 표시할 것인지
      final int PAGE_DISPLAY_COUNT=5;
      
      //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
      int pageNum=1;
      //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
      String strPageNum = request.getParameter("pageNum");
      //만일 페이지 번호가 파라미터로 넘어 온다면
      if(strPageNum != null){
         //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
         pageNum=Integer.parseInt(strPageNum);
      }
      
      //보여줄 페이지의 시작 ROWNUM
      int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
      //보여줄 페이지의 끝 ROWNUM
      int endRowNum = pageNum * PAGE_ROW_COUNT;
      
      //startRowNum 과 endRowNum  을 ReviewDTO 객체에 담고
      ReviewDTO dto = new ReviewDTO();
      dto.setStartRowNum(startRowNum);
      dto.setEndRowNum(endRowNum);
      
      // ReviewDTO 객체를 이용해서 목록을 얻어온다.
      List<ReviewDTO> list = dao.selectPage(startRowNum, endRowNum);
      
      //하단 시작 페이지 번호 
      int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
      //하단 끝 페이지 번호
      int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
      
      //전체 row 의 갯수
      int totalRow = dao.getCount();
      //전체 페이지의 갯수 구하기
      int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
      //끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
      if(endPageNum > totalPageCount){
         endPageNum = totalPageCount; //보정해 준다. 
      }
      
      //request 영역에 담아주기
      request.setAttribute("list", list);   //ReviewDTO list
      request.setAttribute("startPageNum", startPageNum);   //시작 페이지 번호
      request.setAttribute("endPageNum", endPageNum);   //끝 페이지 번호
      request.setAttribute("pageNum", pageNum);   //현재 페이지 번호
      request.setAttribute("totalPageCount", totalPageCount);   //모든 페이지 count	      
	}
}
