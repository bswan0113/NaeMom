package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

public interface MapService {

	ArrayList<ProductVO> getProductList();
	
	ArrayList<ProductVO> getProductListCri(Criteria cri);

	ArrayList<FileVO> getFileList();

	FileVO getFiles(int pd_num);

	ArrayList<ProductVO> getProductListByCategory(int pd_pc_num);

	ArrayList<ProductVO> getSearchProduct(ProductVO product);

	ArrayList<ProductCategoryVO> getProductCategory();

	ArrayList<ProductVO> getSelectProduct(int pd_num);

	FileVO getProductImg(int pd_num);

	ArrayList<ProductVO> getSearchProductAddress(ProductVO product);

	int getTotalCountBoard(Criteria cri);

	

}
