package kr.dbp.naemom.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CourseVO {

	int co_num;
	String co_me_id;
	String co_title;
	String co_content;
	int co_cc_category;
	int co_cs_schedule;
	
}
