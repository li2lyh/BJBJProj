package com.bjbj.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReviewController {
	// 리뷰 게시판과 관련된 요청 처리

	@Autowired
	private ReviewService service;
	@Autowired
	private HttpSession session;
	
	// 리뷰 게시판 페이지로 이동
	@RequestMapping(value = "/board")
	public String toReviewBoard(Model model) throws Exception {
		List<Map<String, Object>> boardList = service.selectAllReview();
		model.addAttribute("list", boardList);
		return "/review/board";
	}
	
	// 리뷰 게시물 상세 페이지로 이동
	@RequestMapping(value = "/detail")
	public String selectReview(int review_no, Model model) throws Exception {
		ReviewDTO dto = service.selectByNo(review_no);
		model.addAttribute("dto", dto);
		return "/review/detail";
	}
	
	// 리뷰 작성 페이지로 이동
	@RequestMapping(value = "/toWrite")
	public String toWriteReview() throws Exception {
		return "/review/write-review";
	}
	
	// 리뷰 작성 요청
	@RequestMapping(value = "/writeProc")
	public String insertReview(ReviewDTO dto, MultipartFile file) throws Exception {
		System.out.println(dto.toString());
		String path = session.getServletContext().getRealPath("photo");
		// service.insertReview(dto, path, file);
		
		return "redirect:/review/board";
	}
	
	// 리뷰 삭제 요청
	@RequestMapping(value = "/deleteProc")
	public String deleteReview(int review_no) throws Exception {
		int rs = service.deleteReview(review_no);
		System.out.println(rs);
		return "redirect:/review/board";
	}
	
	@ExceptionHandler
	public String errorHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
}
