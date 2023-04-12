package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {

	String me_id;
	String me_pw;
	String me_name;
	Date me_birthday;
	String me_phone;
	String me_gender;
	int me_authority;
	String me_detail_address;
	String me_nickname;
	String me_street_address;
	String me_registered_address;
	int me_mileage;
	String me_session_id;
	Date me_session_limit;
	String me_ma_email;
	FileVO file;

	
	
	public String getMe_birthday_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd");
		return format.format(me_birthday);
	}
	public String getMe_session_limit_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd");
		return format.format(me_session_limit);
	}
}
