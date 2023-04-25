package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

public interface HomeDAO {

	ArrayList<ProductVO> selectBoardList();

	ArrayList<ProductVO> selectProductByKeyword(String keyword);

	ArrayList<ProductVO> getProductList();

	int insertProductChecked(int[] pdc_checked);

	void deleteProductChecked(int[] pdc_checked);

	ArrayList<ProductVO> getCheckedList();

	FileVO getFile(@Param("pd_num")int pd_num, @Param("product")String string, @Param("fi_category")String string2);

	
}
