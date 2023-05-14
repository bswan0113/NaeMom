package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Reservation_roomVO {

	int rr_num;
	Date rr_check_in;
	Date rr_check_out;
	int rr_ao_num;
	int rr_pd_num;
	String rr_me_id;
	String rr_bl_num;
	
	public String getRr_check_in() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(rr_check_in == null)
			return "";
		return format.format(rr_check_in);
	}
	public String getRr_check_out() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(rr_check_out == null)
			return "";
		return format.format(rr_check_out);
	}
	
}
