package kr.dbp.naemom.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class CalendarVO {

	
	int year;
	int month;
	int lastDay;
	int toDay;
	String firstDay;
	int day;


	public CalendarVO() {
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int year = cal.get(java.util.Calendar.YEAR); // 년도
		int month = cal.get(java.util.Calendar.MONTH) + 1; // 월
		int today = cal.get(java.util.Calendar.DATE);
		java.util.Calendar firstDayOfMonth = java.util.Calendar.getInstance();
		firstDayOfMonth.set(year, month - 1, 1); // 해당 월의 첫 날로 설정
		this.toDay = today;
		this.year = year;
		this.month = month;
		this.lastDay = firstDayOfMonth.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		java.text.SimpleDateFormat aa = new java.text.SimpleDateFormat("E");
		this.firstDay = aa.format(firstDayOfMonth.getTime());
	}
	

	public CalendarVO(int year, int month) {
	    java.util.Calendar cal = java.util.Calendar.getInstance();
	    int today = cal.get(java.util.Calendar.DATE);
	    cal.set(year, month-1, 1);
	    this.toDay = today;
	    this.year = year;
	    this.month = month;
	    this.lastDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	    java.text.SimpleDateFormat aa = new java.text.SimpleDateFormat("E");
	    this.firstDay = aa.format(cal.getTime());
	}
	
	public CalendarVO(int year, int month, int day) {
	    java.util.Calendar cal = java.util.Calendar.getInstance();
	    cal.set(year, month-1,1) ;
	    this.toDay = cal.get(java.util.Calendar.DATE);
	    this.day = day;
	    this.year = year;
	    this.month = month;
	    this.lastDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	    java.text.SimpleDateFormat aa = new java.text.SimpleDateFormat("E");
	    this.firstDay = aa.format(cal.getTime());
	}

	
	
}
