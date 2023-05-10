package kr.dbp.naemom.vo;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MileageVO {

	int mi_num;
	@DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss")
	Date mi_date;
	int mi_update;
	String mi_me_id;
	String mi_bl_num;
	
	public String getMi_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(mi_date);
	}
	
	 public String getMiDateAfterFiveYears() {
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(mi_date);
	        calendar.add(Calendar.YEAR, 5);
	        Date dateAfterFiveYears = calendar.getTime();
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        return format.format(dateAfterFiveYears);
	    }
	
}
