package com.bjbj.home;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjbj.bookclub.BookclubDTO;
import com.bjbj.bookclub.BookclubService;
import com.bjbj.books.BookService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class HomeController {

	@Autowired
	private BookService service;
	@Autowired
	private BookclubService clubService;

	// 메인 페이지 작업
	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {
		String newBooksList = service.getBookList("ItemNewAll", "");

		String allList = service.getBookList("Bestseller", ""); // 종합 카테고리

		// ObjectMapper를 통해 가져온 String을 Map형식으로 데이터 변환 (databind)
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> newBooksMap = mapper.readValue(newBooksList, Map.class);
		model.addAttribute("newBooks", newBooksMap.get("item"));

		Map<String, Object> bestBooksMap = mapper.readValue(allList, Map.class);
		model.addAttribute("bestBooks", bestBooksMap.get("item"));
	
		// 북클럽
		List<BookclubDTO> clubList = clubService.selectList();
		
		for (BookclubDTO dto : clubList) { 
			dto.setOpen_date(clubService.getStrDate(dto.getOpen_date())); //모임 시작
			dto.setClose_date(clubService.getStrDate(dto.getClose_date()));
			dto.setRecruit_start(clubService.getStrDate(dto.getRecruit_start())); //모집 시작
			dto.setRecruit_end(clubService.getStrDate(dto.getRecruit_end()));
		}
		model.addAttribute("clubList", clubList);
		
		return "main";
	}
	
	@RequestMapping(value ="/search")
	public String search(String text, Model model) throws Exception{
		System.out.println("target text : " + text);
		String text1 = text;
		text = URLEncoder.encode(text, "UTF-8");
		
		String bookList = service.searchBookByKeyword(text,"keyword").toString();

		// ObjectMapper를 통해 가져온 String을 Map형식으로 데이터 변환 (databind)
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(bookList, Map.class);
		System.out.println(map.get("item"));

		model.addAttribute("search", map.get("item"));
		model.addAttribute("keyword", text1);

		// 북클럽 검색
		List<BookclubDTO> clubList = clubService.searchByTitle(text1);
		System.out.println("검색 클럽 : " + clubList.toString());
		for (BookclubDTO dto : clubList) {
			dto.setRecruit_start(clubService.getStrDate(dto.getRecruit_start()));
			dto.setRecruit_end(clubService.getStrDate(dto.getRecruit_end()));
		}

		model.addAttribute("club", clubList);

		return "search";
	}
	
	//introducce
	@RequestMapping(value = "/toIntroduce")
	public String toIntroduce() {
		return "introduce";
	}
	
	// Error
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
	
	// 에러 핸들링
	@ExceptionHandler
	public String errorHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
}
