package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class qna_AnswerVO {

	int qaa_num;
	int qaa_qa_num;
	String qaa_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date qaa_registerd_date;
	
	public String getQaa_registerd_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd");
		return format.format(qaa_registerd_date);
	}
	
		
		
}
