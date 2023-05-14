
package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_name;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date me_birthday;
	private String me_phone;
	private String me_gender;
	private int me_authority;
	private String me_nickname;
	private String me_street_address;
	private String me_registered_address;
	private String me_detail_address;
	private int me_mileage;
	private String me_session_id;
	private Date me_session_limit;
	private String me_ma_email;
	boolean autoLogin;
	private String me_post;
	Member_profileVO member_profile;
	int expirationMileage;
	int me_score_ao;
	int me_score_fe;
	int me_score_la;
	int me_score_reo;
	int unreadMail;
	
	public String getMe_birthday_str() {
		SimpleDateFormat format =
				  new SimpleDateFormat("yyyy-MM-dd");
		if(me_birthday == null)
			return "";
		return format.format(me_birthday);
		
	}

	public String getMe_session_limit_str() {
		if(me_session_limit==null) return null;
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd");
		return format.format(me_session_limit);
	}
	
}
