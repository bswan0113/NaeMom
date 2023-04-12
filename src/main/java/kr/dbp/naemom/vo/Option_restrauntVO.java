package kr.dbp.naemom.vo;



import java.util.Date;


import com.fasterxml.jackson.annotation.JsonIgnore;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Option_restrauntVO {

	int reo_num;
	int reo_price;
	int reo_pd_num;
	String reo_name;
	String reo_content;

	Date reo_date;

    @JsonIgnore
    transient FileVO file;
	
	public Option_restrauntVO(int reo_price, int reo_pd_num, String reo_name, String reo_content) {
		this.reo_price = reo_price;
		this.reo_pd_num = reo_pd_num;
		this.reo_name = reo_name;
		this.reo_content = reo_content;
	}
	

}
