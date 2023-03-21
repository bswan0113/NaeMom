package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

public interface ProductDAO {

	public void insertProduct(@Param("pd")ProductVO product);

	public void insertProductOption(@Param("pd_pc_num")int pd_pc_num);

	public ProductVO selectProductByNum(@Param("pd_num")int i);

	public ArrayList<ProductCategoryVO> getCategoryList();

	public void insertFile(@Param("fi")FileVO fileVo);
		

}
