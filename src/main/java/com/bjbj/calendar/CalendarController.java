package com.bjbj.calendar;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bjbj.bookclub.BookclubService;
import com.bjbj.member.MemberDTO;
import com.bjbj.member.MemberService;
import com.fasterxml.jackson.annotation.JsonFormat;

@RequestMapping(value="/calendar")
@Controller
public class CalendarController {
@Autowired
private CalendarService service;
@Autowired
private MemberService memberService;
@Autowired
private BookclubService clubService;	
@Autowired
private HttpSession session;
@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
private Date date;
@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
private LocalDateTime createDate;




@RequestMapping(value="/selectAll")  // 목록 불러오기
@ResponseBody
public List<Map<String, Object>> plan() throws Exception{
	String email = ((MemberDTO)session.getAttribute("loginSession")).getEmail();
	int room_id = clubService.selectRole(email).getRoom_id();
	
	List<CalendarDTO> list = service.calendarList(room_id);
	
     JSONArray arr = new JSONArray();
     JSONObject obj = new JSONObject();
     
     HashMap<String, Object> map = new HashMap<>();
     
     for( int i = 0; i < list.size(); i++) {
    	 map.put("id",list.get(i).getCal_id());
    	 map.put("start", list.get(i).getStart_date());
    	 map.put("end", list.get(i).getEnd_date());
    	 map.put("title", list.get(i).getCal_title()); 
    	 map.put("textColor", list.get(i).getTextColor());
    	 map.put("backColor", list.get(i).getBackColor());
    	 
    	 obj = new JSONObject(map);
         arr.add(obj);
     }
     
    return arr;
	
}

@RequestMapping(value="/insertPlan") // 일정 추가
@ResponseBody
public String insertPlan(CalendarDTO dto) throws Exception{
	String email = ((MemberDTO)session.getAttribute("loginSession")).getEmail();
	int room_id = clubService.selectRole(email).getRoom_id();
	String nickname= ((MemberDTO)session.getAttribute("loginSession")).getNickname();
	
	System.out.println(dto.getCal_title());
	System.out.println(dto.getStart_date());
	System.out.println(dto.getEnd_date());
	
	dto.setRoom_id(room_id);
	dto.setCal_writer(nickname);
	
	//System.out.println(service.setDateFormat(dto.getStart_date()));
	
	//dto.setStart_date( service.setDateFormat(dto.getStart_date()));
	//dto.setEnd_date(service.setDateFormat(dto.getEnd_date()));
	
	service.insertPlan(dto);
	
	return "redirect:/calendar/selectAll";
}

@RequestMapping(value = "/deletePlan")
@ResponseBody
public String deletePlan(int cal_id) throws Exception{

		System.out.println("target Id : " + cal_id);
	
		service.deletePlan(cal_id);
	
	return "redirect:/calendar/selectAll";
}


@RequestMapping(value = "/updatePlan")
@ResponseBody
public String updatePlan(CalendarDTO dto)throws Exception{
	System.out.println(dto.getCal_id());
	System.out.println(dto.getCal_title());
	System.out.println(dto.getStart_date());
	System.out.println(dto.getEnd_date());
	
	service.updatePlan(dto);
	
	return "redirect:/calendar/selectAll";
}



















	
}
