package kr.dbp.naemom.vo;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WishVO {

	int wi_num;
	int wi_pd_num;
	String pd_title;
	int wishcount;
	String wi_me_id;
	ProductVO product;
	@Override
	public String toString() {
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	        return objectMapper.writeValueAsString(this);
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

}
