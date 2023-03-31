package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewCommentVO {

	int rc_num;
	int rc_re_num;
	String rc_me_id;
	String rc_content;
	Date rc_date;
	int reportCount;
	
	public String getRc_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		return format.format(rc_date);
	}
	
}
