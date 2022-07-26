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
	
	@RequestMapping("/map")
	public String toLibrary() {
		return "library/map";
	}
	
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
	
	@ExceptionHandler
	public String errorHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}

}
