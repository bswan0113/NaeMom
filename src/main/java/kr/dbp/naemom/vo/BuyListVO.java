package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BuyListVO {

	int bl_num;
	String bl_state;
	int bl_total_price;
	int bl_price;
	int bl_stack_mile;
	int bl_use_mile;
	String bl_me_id;
	@DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss")
	Date bl_date;
	
	public String getBl_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(bl_date);
	}
	
}