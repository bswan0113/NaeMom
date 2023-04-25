package kr.dbp.naemom.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportManageVO {

	  private String title;
	  private String rep_table;
	  private int reportCount;
}
