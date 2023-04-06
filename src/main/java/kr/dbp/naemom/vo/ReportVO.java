package kr.dbp.naemom.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
	int rep_num;
	int rep_table_key;
	String rep_table;
	String rep_content;
	Date rep_date;
	String rep_category;
	String rep_me_id;

}
