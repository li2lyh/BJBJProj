package com.bjbj.calendar;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	@Autowired
	private CalendarDAO dao; 
	
public List<CalendarDTO> calendarList(int room_id) throws Exception{
		
		return dao.calendarList(room_id);
		
	}

public void insertPlan(CalendarDTO dto) throws Exception{
	dao.insertPlan(dto);
}

public String setDateFormat(String string) {
	return dao.setDateFormat(string);
}




















}
