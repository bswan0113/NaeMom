package kr.dbp.naemom.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SearchKeywordVO {

	int sk_num;
	String sk_keyword;
	int sk_pd_num;
	Date sk_date;
	int count;
	double per;
	@Override
	public String toString() {
		return "{'sk_num':" + sk_num + ", 'sk_keyword':'" + sk_keyword + "', 'sk_pd_num':" + sk_pd_num
				+ ", 'sk_date':" + sk_date + ", 'count':" + count + ", 'per':" + per + "}";
	}

	
	
}
