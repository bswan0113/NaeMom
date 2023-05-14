package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Reservated_optionVO {

	int ro_num;
	String ro_option_name;
	Date ro_date;
	int ro_time;
	int ro_pd_num;
	String ro_me_id;
	String ro_bl_num;
	
	public String getRo_date() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(ro_date == null)
			return "";
		return format.format(ro_date);
	}
	
}
