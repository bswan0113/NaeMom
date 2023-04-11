package kr.dbp.naemom.vo;


import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Option_landMarkVO {

	int lo_num;
	int lo_price;
	int lo_pd_num;
	String lo_age;
	Date lo_date;
}
