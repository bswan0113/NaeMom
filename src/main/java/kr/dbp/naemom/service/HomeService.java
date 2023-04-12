package kr.dbp.naemom.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

public interface HomeService {

	ArrayList<ProductVO> getHomeContent();

	ArrayList<ProductVO> searchProductByKeyword(String keyword);

//	ArrayList<ProductVO> checkedProduct(HttpServletRequest request);

//	void updateProductChecked(String[] checkedPids);
//
//	void updateProduct(String pd_title, String pd_content);
//
	ArrayList<ProductVO> getProductList();

	void insertProductChecked(int[] pdc_checked);

	void deleteProductChecked(int[] pdc_checked);

	ArrayList<ProductVO> getCheckedList();

	FileVO getFiles(int pd_num);
	

}
