package kr.dbp.naemom.vo;


import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Option_festivalVO {

	int fo_num;
	int fo_price;
	int fo_pd_num;
	String fo_age;
	Date fo_date;
	
}
