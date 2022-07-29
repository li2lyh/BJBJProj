package com.bjbj.books;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping(value = "/books")
@Controller
public class BookController {

	@Autowired
	private BookService service;
	
	// 베스트셀러 페이지로 이동
	@RequestMapping(value = "/bestseller")
	public String toBestPage(Model model) throws Exception {
		String allList = service.getBookList("Bestseller", ""); // 종합 카테고리
		String businessList = service.getBookList("Bestseller", "170"); // 경제경영 카테고리
		String classicList = service.getBookList("Bestseller", "2105"); // 고전 카테고리
		String artList = service.getBookList("Bestseller", "517"); // 예술/대중문화 카테고리
		String literatureList = service.getBookList("Bestseller", "1"); // 문학 카테고리
		String essayList = service.getBookList("Bestseller", "55889"); // 에세이 카테고리
		
		// ObjectMapper를 통해 가져온 String을 Map형식으로 데이터 변환 (databind)
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> mapAll = mapper.readValue(allList, Map.class);
		model.addAttribute("all", mapAll.get("item"));
		Map<String, Object> mapBusiness = mapper.readValue(businessList, Map.class);
		model.addAttribute("business", mapBusiness.get("item"));
		Map<String, Object> mapClassic = mapper.readValue(classicList, Map.class);
		model.addAttribute("classic", mapClassic.get("item"));
		Map<String, Object> mapArt = mapper.readValue(artList, Map.class);
		model.addAttribute("art", mapArt.get("item"));
		Map<String, Object> mapLiterature = mapper.readValue(literatureList, Map.class);
		model.addAttribute("literature", mapLiterature.get("item"));
		Map<String, Object> mapEssay = mapper.readValue(essayList, Map.class);
		model.addAttribute("essay", mapEssay.get("item"));
		
		return "/books/bestseller";
	}
	
	// 신간도서 페이지로 이동
	@RequestMapping(value = "/arrivals")
	public String toArrivePage(Model model) throws Exception {
		String newBooksList = service.getBookList("ItemNewAll", "");
		
		// ObjectMapper를 통해 가져온 String을 Map형식으로 데이터 변환 (databind)
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(newBooksList, Map.class);
		model.addAttribute("newBooks", map.get("item"));
		
		return "/books/arrivals";
	}
	
	// 도서 찜 하기
	@ResponseBody
	@RequestMapping(value = "/likes")
	public String likeBook(LikeBookDTO dto) throws Exception {
		System.out.println(dto.toString());
		dto.setImg_id("sample");
		int rs = service.addLikeBook(dto);
		if (rs > 0) {
			return "success";
		} else {
			return "failed";
		}
	}
	
	// 도서 찜 해제하기
	@RequestMapping(value = "/undo-like")
	public String undoLikeBook(String book_isbn) throws Exception {
		String email = "a";
		int rs = service.removeLikeBook(email, book_isbn);
		return "/books/bestseller";
	}
	
	@ExceptionHandler
	public String errorHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
	
}