package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TempOFFVO {

	int to_num;
	int to_do_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date to_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date to_end;

	
	public String getTo_start_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd");
		return format.format(to_start);
	}
	public String getTo_end_str() {
		SimpleDateFormat format = 
				new SimpleDateFormat("yyyy-MM-dd");
			return format.format(to_end);
	}
}
