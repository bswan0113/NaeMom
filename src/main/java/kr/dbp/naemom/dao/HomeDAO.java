package kr.dbp.naemom.dao;

import java.util.ArrayList;

import kr.dbp.naemom.vo.ProductVO;

public interface HomeDAO {

	ArrayList<ProductVO> selectBoardList();

	ArrayList<ProductVO> selectProductByKeyword(String keyword);

//	ProductVO selectProductByNum(int pd_num);

//	Object updateProductChecked(String[] checkedPids);
//
//	Object updateProduct(String pd_title, String pd_content);
//
	ArrayList<ProductVO> getProductList();

	int insertProductChecked(int[] pdc_checked);

	void deleteProductChecked(int[] pdc_checked);

	ArrayList<ProductVO> getCheckedList();

	
}
