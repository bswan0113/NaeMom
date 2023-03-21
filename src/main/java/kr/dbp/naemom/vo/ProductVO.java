package kr.dbp.naemom.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductVO {

	int pd_num;
	int pd_capacity;
	int pd_viewcount;
	int pd_pc_num;
	@DateTimeFormat(pattern = "HH:mm")
	Date pd_open_time;
	@DateTimeFormat(pattern = "HH:mm")
	Date pd_close_time;
	String pd_title;
	String pd_subtitle;
	String pd_content;
	String pd_street_address;
	String pd_registerd_address;
	String pd_detail_address;
	String pd_parking;
	
}
