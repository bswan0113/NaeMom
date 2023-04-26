package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Order_listVO {

	int ol_num;
	int ol_amount;
	int ol_price;
	String ol_bl_num;
	int ol_table_key;
	String ol_table;
	Date ol_date;
	
	public String getSb_date() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		if(ol_date == null)
			return "";
		return format.format(ol_date);
	}
	
	
}
