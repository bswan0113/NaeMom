package kr.dbp.naemom.vo;


import java.text.SimpleDateFormat;


import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {

	
	int rep_num;
	int rep_table_key;
	String rep_content;
	Date rep_date;
	String rep_category;
	String rep_table;
	String rep_me_id;
	
	public String getRep_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(rep_date == null)
			return "";
		return format.format(rep_date);
	}

}
