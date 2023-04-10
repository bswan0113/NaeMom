package kr.dbp.naemom.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TempOFFVO {

	int to_num;
	int to_do_num;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	Date to_start;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	Date to_end;
	
}
