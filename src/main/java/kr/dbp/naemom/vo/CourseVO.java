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
	int co_report;
	int cs_schedule_num;
	String cs_schedule_name;
	String cc_category_name;
	
	
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
	public CourseVO(int co_num, String co_me_id, String co_title, String co_content, int co_cc_category_num,
			int co_cs_schedule_num, String co_total_distance, Date co_register_date, Date co_update_date, int co_up,
			int co_down, int co_views, int co_report) {
		this.co_num = co_num;
		this.co_me_id = co_me_id;
		this.co_title = co_title;
		this.co_content = co_content;
		this.co_cc_category_num = co_cc_category_num;
		this.co_cs_schedule_num = co_cs_schedule_num;
		this.co_total_distance = co_total_distance;
		this.co_register_date = co_register_date;
		this.co_update_date = co_update_date;
		this.co_up = co_up;
		this.co_down = co_down;
		this.co_views = co_views;
		this.co_report = co_report;
	}
}
