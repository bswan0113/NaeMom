package kr.dbp.naemom.vo;


import java.text.SimpleDateFormat;
import java.util.Date;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewVO {

	int re_num;
	double re_rating;
	int re_pd_num;
	String re_me_id;
	String re_content;
	Date re_date;
	Date re_update_date;
	FileVO re_file;
	int reportCount;

	public String getRe_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		return format.format(re_date);
	}
	public String getRe_update_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		if(re_update_date ==null) return null;
		return format.format(re_update_date);
	}
}
