package kr.dbp.naemom.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LikeVO {
	
	int li_num;
	int li_table_key;
	String li_table;
	String li_me_id;
	int li_updown;
	

}
