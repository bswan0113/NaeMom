package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OptionListDTO {

	int pr_num;
	String pr_category;
	String pr_title;
	String pr_option;
	int pr_amount;
	Date pr_date;
	int pr_price;
	int pr_option_num;
	
	public String getPr_date() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(pr_date == null)
			return "";
		return format.format(pr_date);
	}
	
}
