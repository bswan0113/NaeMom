package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class VisitedVO {

int vi_num;
String vi_session_id;
Date vi_date;
String vi_is_member;
	
public String getMonth() {
	SimpleDateFormat format = new SimpleDateFormat("MM");
	if(vi_date == null)
		return "";
	return format.format(vi_date);
}

public String getHour() {
	SimpleDateFormat format = new SimpleDateFormat("HH");
	if(vi_date == null)
		return "";
	return format.format(vi_date);
}


public String getDay() {
	SimpleDateFormat format = new SimpleDateFormat("dd");
	if(vi_date == null)
		return "";
	return format.format(vi_date);
}

public String getVi_date_str() {
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if(vi_date == null)
		return "";
	return format.format(vi_date);
}



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
