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

	public List<CalendarDTO> calendarList(int room_id) throws Exception {

		return session.selectList("calendarMapper.calendarList", room_id);

	}

	public void insertPlan(CalendarDTO dto) throws Exception {

		session.insert("calendarMapper.insertPlan", dto);
	}

	public void deletePlan(int cal_id) throws Exception{
	
		session.delete("calendarMapper.deletePlan", cal_id);
	}
	
	public void updatePlan(CalendarDTO dto)throws Exception{
		
		session.update("calendarMapper.updatePlan", dto);
	}
	
	//날짜 형식 변경 String to String
		public String getCalStrDate(String string) {
			String rs = null;
			try {
				// String to Date
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date(sdf.parse(string).getTime());

				// Date to String
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				rs = sdf2.format(date);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return rs;
		}
	
	
}
