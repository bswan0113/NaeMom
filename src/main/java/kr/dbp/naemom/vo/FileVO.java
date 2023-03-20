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
}
