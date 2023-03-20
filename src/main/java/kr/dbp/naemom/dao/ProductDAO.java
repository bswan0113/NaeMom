package kr.dbp.naemom.dao;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.ProductVO;

public interface ProductDAO {

	public void insertProduct(@Param("pr")ProductVO product);

	public void insertProductOption(@Param("pd_pc_num")int pd_pc_num);
		

}
