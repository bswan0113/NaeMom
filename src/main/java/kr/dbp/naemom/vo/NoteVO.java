package kr.dbp.naemom.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoteVO {

	int nt_num;
	String nt_sender;
	String nt_receiver;
	boolean nt_is_read;
	String nt_content;
	Date nt_date;

	public String getNt_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(nt_date == null)
			return "";
		return format.format(nt_date);
	}
}
