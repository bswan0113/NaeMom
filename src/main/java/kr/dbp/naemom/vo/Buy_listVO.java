package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Buy_listVO {

	String bl_num;
	String bl_state;
	int bl_total_price;
	int bl_stack_mile;
	int bl_use_mile;
	String bl_me_id;
	String bl_name;
	
	Date bl_date;
	
	List<Order_listVO> orderlist;
	Use_memberVO useMember;
	
	public Buy_listVO(String bl_num,String bl_state, int bl_total_price, int bl_stack_mile, int bl_use_mile, String bl_me_id,
			String bl_name) {
		this.bl_num = bl_num;
		this.bl_state = bl_state;
		this.bl_total_price = bl_total_price;
		this.bl_stack_mile = bl_stack_mile;
		this.bl_use_mile = bl_use_mile;
		this.bl_me_id = bl_me_id;
		this.bl_name = bl_name;
	}
	public String getBl_date() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(bl_date);
	}
	
	
}
