package com.bjbj.library;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping(value = "/library")
@Controller
public class LibraryController {
	
	@Autowired
	private LibraryService service;
	
	// 도서관 지도 페이지로 이동
	@RequestMapping("/map")
	public String toLibrary() {
		return "library/map";
	}
	
	// 근처 도서관 정보 조회
	@ResponseBody
	@RequestMapping(value = "/getLibrary")
	public Map<String, Object> getLibrary(String addr_depth1, String addr_depth2) throws Exception {
		System.out.println(addr_depth1);
		System.out.println(addr_depth2);
		
		String allLibrary = service.getAllLibrary(addr_depth1, addr_depth2);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(allLibrary, Map.class);
		
		System.out.println(allLibrary);
		return map;
	}
	
	// 에러 핸들링
	@ExceptionHandler
	public String errorHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}

}
