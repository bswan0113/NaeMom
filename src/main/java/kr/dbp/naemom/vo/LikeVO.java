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

	
	public LikeVO(int li_updown, String li_me_id, int li_table_key, String li_table) {
		this.li_updown = li_updown;
		this.li_me_id = li_me_id;
		this.li_table_key = li_table_key;
		this.li_table = li_table;
	}
}
