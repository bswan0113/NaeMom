package kr.dbp.naemom.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OptionDTO {

	ArrayList<OptionListDTO> list = new ArrayList<OptionListDTO>();
	

	
}
