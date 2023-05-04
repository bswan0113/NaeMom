package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductVO {

	int pd_num;
	int pd_capacity;
	int pd_viewcount;
	int pd_pc_num;
	@DateTimeFormat(pattern = "HH:mm")
	Date pd_open_time;
	@DateTimeFormat(pattern = "HH:mm")
	Date pd_close_time;
	String pd_title;
	String pd_subtitle;
	String pd_content;
	String pd_street_address;
	String pd_registerd_address;
	String pd_detail_address;
	String pd_parking;
	FileVO file;
	Integer wishCount;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	Date pd_fe_end;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	Date pd_fe_start;

	ArrayList<DayOFFVO> dayoff;
	

	

	Integer pdc_num;
	

	public String getPd_fe_end_str() {
		if(pd_fe_end==null) return null;
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd");
		return format.format(pd_fe_end);
	}
	public String getPd_fe_start_str() {
		if(pd_fe_start==null) return null;
		SimpleDateFormat format = 
				new SimpleDateFormat("yyyy-MM-dd");
			return format.format(pd_fe_start);
	}
	
	
	public String getPd_open_time_str() {
		if(pd_open_time==null) return null;
		SimpleDateFormat format = 
			new SimpleDateFormat("HH:mm");
		return format.format(pd_open_time);
	}
	public String getPd_close_time_str() {
		if(pd_close_time==null) return null;
		SimpleDateFormat format = 
				new SimpleDateFormat("HH:mm");
			return format.format(pd_close_time);
	}
	@Override
	public String toString() {
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	        return objectMapper.writeValueAsString(this);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

}
