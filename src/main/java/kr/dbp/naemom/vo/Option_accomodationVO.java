package kr.dbp.naemom.vo;


import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Option_accomodationVO {

	int ao_num;
	int ao_capacity;
	int ao_price;
	int ao_pd_num;
	String ao_name;
	String ao_room_number;
	String ao_room_detail;

	int ao_addCapacity;
	Date ao_date;

	FileVO file;

	
}
