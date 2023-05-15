package kr.dbp.naemom.vo;

import java.util.Date;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChangeProductVO {

	int cp_num;
	int cp_pd_num;
	String pd_title;
	int cp_rated;
	int cp_viewcount;
	int cp_search_volume_count;
	Date cp_date;
	int view_dif;
	int rate_dif;
	
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
