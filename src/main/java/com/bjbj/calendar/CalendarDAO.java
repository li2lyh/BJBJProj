package com.bjbj.calendar;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {
	@Autowired
	private SqlSession session;
	
	public List<CalendarDTO> calendarList(int room_id) throws Exception{
		
		return session.selectList("calendarMapper.calendarList", room_id);
		
	}
	
	public void insertPlan(CalendarDTO dto) throws Exception{
		
		session.insert("calendarMapper.insertPlan", dto);
	}
	
	
	
	
	public String setDateFormat(String string) {
		String afterDate = null;
			try {
				
				System.out.println("String : " + string);
		DateFormat dateFormat = new SimpleDateFormat("EEE MMM dd yyyy'T'hh:mm:ss z (zzzz)", Locale.KOREA);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
			
		java.util.Date date =  dateFormat.parse(string);
		afterDate = sdf.format(date);
		
		System.out.println(date);
		System.out.println(afterDate);
				
		/*
		//time:String
		val format = SimpleDateFormat("YYYY-MM-DD'T'hh:mm:ss.SSSZ", Locale.KOREAN)
		val date = format.parse(time)
		val formatter = SimpleDateFormat("yyyy-MM-dd",Locale.KOREAN)
		val dateString: String = formatter.format(date!!)
		
		*/
		
		
		
		
			} catch (Exception e) {
				e.printStackTrace();
			}
			return afterDate;
		}

		
	
}
