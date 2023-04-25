package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class qnaVO {
	
	int qa_num;
	String qa_title;
	String qa_content;
	@DateTimeFormat(pattern ="yyyy-MM-dd HH:mm:dd")
	Date qa_registerd_date;
	String qa_state;
	String qa_me_id;
	int qa_pd_num;
	String qa_qs_category;
	
	public String getQa_registerd_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:dd");
		return format.format(qa_registerd_date);
	}
	
}