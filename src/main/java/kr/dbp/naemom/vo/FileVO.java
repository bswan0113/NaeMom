package kr.dbp.naemom.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {

		int fi_num;
		int fi_pd_num;
		String fi_category;
		String fi_ori_name;
		String fi_name;
		String fi_path;
		
		public FileVO(String fi_category, String fi_ori_name, String fi_name, int fi_pd_num) {
			this.fi_category = fi_category;
			this.fi_ori_name = fi_ori_name;
			this.fi_name = fi_name;
			this.fi_pd_num=fi_pd_num;
		}
}
