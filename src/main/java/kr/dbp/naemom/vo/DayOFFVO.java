package kr.dbp.naemom.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DayOFFVO {

	int do_num;
	int do_pd_num;
	String do_state;
	String do_date;
	
	ArrayList<TempOFFVO> tempOff;
	
	
}
