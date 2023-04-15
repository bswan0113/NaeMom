package kr.dbp.naemom.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_name;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date me_birthday;
	private String me_phone;
	private String me_gender;
	private String me_authority;
	private String me_nickname;
	private String me_street_address;
	private String me_registered_address;
	private String me_detail_address;
	private int me_mileage;
	private String me_session_id;
	private Date me_session_limit;
	private String me_ma_email;
	boolean autoLogin;
	private int me_post;

	/*
	 * public void setMe_birthday(String me_birthday) { SimpleDateFormat format =
	 * new SimpleDateFormat("yyyy-MM-dd"); try { this.me_birthday =
	 * format.parse(me_birthday); } catch (ParseException e) { this.me_birthday =
	 * null; } }
	 * 
	 * 
	 * public Date getMe_birthday() { return me_birthday; }
	 * 
	 * public String getMe_id() { return me_id; }
	 * 
	 * public void setMe_id(String me_id) { this.me_id = me_id; }
	 * 
	 * public String getMe_pw() { return me_pw; }
	 * 
	 * public void setMe_pw(String me_pw) { this.me_pw = me_pw; }
	 * 
	 * public String getMe_name() { return me_name; }
	 * 
	 * public void setMe_name(String me_name) { this.me_name = me_name; }
	 * 
	 * 
	 * 
	 * public String getMe_phone() { return me_phone; }
	 * 
	 * public void setMe_phone(String me_phone) { this.me_phone = me_phone; }
	 * 
	 * public String getMe_gender() { return me_gender; }
	 * 
	 * public void setMe_gender(String me_gender) { this.me_gender = me_gender; }
	 * 
	 * public String getMe_authority() { return me_authority; }
	 * 
	 * public void setMe_authority(String me_authority) { this.me_authority =
	 * me_authority; }
	 * 
	 * public String getMe_nickname() { return me_nickname; }
	 * 
	 * public void setMe_nickname(String me_nickname) { this.me_nickname =
	 * me_nickname; }
	 * 
	 * public String getMe_street_address() { return me_street_address; }
	 * 
	 * public void setMe_street_address(String me_street_address) {
	 * this.me_street_address = me_street_address; }
	 * 
	 * public String getMe_registered_address() { return me_registered_address; }
	 * 
	 * public void setMe_registered_address(String me_registered_address) {
	 * this.me_registered_address = me_registered_address; }
	 * 
	 * public String getMe_detail_address() { return me_detail_address; }
	 * 
	 * public void setMe_detail_address(String me_detail_address) {
	 * this.me_detail_address = me_detail_address; }
	 * 
	 * public int getMe_mileage() { return me_mileage; }
	 * 
	 * public void setMe_mileage(int me_mileage) { this.me_mileage = me_mileage; }
	 * 
	 * public String getMe_session_id() { return me_session_id; }
	 * 
	 * public void setMe_session_id(String me_session_id) { this.me_session_id =
	 * me_session_id; }
	 * 
	 * public Date getMe_session_limit() { return me_session_limit; }
	 * 
	 * public void setMe_session_limit(Date me_session_limit) {
	 * this.me_session_limit = me_session_limit; }
	 * 
	 * public String getMe_ma_email() { return me_ma_email; }
	 * 
	 * public void setMe_ma_email(String me_ma_email) { this.me_ma_email =
	 * me_ma_email; }
	 */
}