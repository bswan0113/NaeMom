package kr.dbp.naemom.vo;


import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewVO {

	int re_num;
	double re_ration;
	int re_pd_num;
	String re_me_id;
	String re_content;
	Date re_date;
	Date re_update_date;
}
