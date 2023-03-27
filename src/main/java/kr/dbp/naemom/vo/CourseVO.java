package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CourseVO {

	int co_num;
	String co_me_id;
	String co_title;
	String co_content;
	int co_cc_category_num;
	int co_cs_schedule_num;
	String co_total_distance;
	Date co_register_date;
	Date co_update_date;
	int co_up;
	int co_down;
	int co_views;
	
	public String getCo_register_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(co_register_date == null)
			return "";
		return format.format(co_register_date);
	}
	public String getCo_update_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(co_update_date == null)
			return "";
		return format.format(co_update_date);
	}
}
