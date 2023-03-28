package kr.dbp.naemom.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {

		int fi_num;
		int fi_table_key;
		String fi_category;
		String fi_ori_name;
		String fi_name;
		String fi_table;
		
		public FileVO(String fi_category, String fi_ori_name, String fi_name, int fi_table_key) {
			this.fi_category = fi_category;
			this.fi_ori_name = fi_ori_name;
			this.fi_name = fi_name;
			this.fi_table_key=fi_table_key;
		}
}
