package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Shopping_basketVO {

	int sb_num;
	String sb_me_id;
	int sb_amount;
	String sb_table;
	int sb_table_key;
	int sb_price;
	Date sb_date;
	int sb_time;
	
	Option_accomodationVO home;
	Option_landMarkVO travel;
	Option_festivalVO festival;
	Option_restrauntVO food;
	
	public String getSb_date() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(sb_date == null)
			return "";
		return format.format(sb_date);
	}
}
