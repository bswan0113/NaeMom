package kr.dbp.naemom.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Shopping_basketVO {

	int sb_num;
	String sb_me_id;
	int sb_amount;
	String sb_table;
	int sb_table_key;
	int sb_price;
	
}
