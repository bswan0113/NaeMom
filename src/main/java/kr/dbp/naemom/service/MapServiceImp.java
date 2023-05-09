package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.MapDAO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class MapServiceImp implements MapService {
	
	@Autowired
	MapDAO mapDao;

	@Override
	public ArrayList<ProductVO> getProductList() {
		return mapDao.selectGetProductList();
	}

	@Override
	public ArrayList<FileVO> getFileList() {
		return mapDao.getFileList();
	}

	@Override
	public FileVO getFiles(int pd_num) {
		FileVO files= mapDao.getFile(pd_num,"product", "게시글 썸네일");
		return files;
	}

	@Override
	public ArrayList<ProductVO> getProductListByCategory(int pd_pc_num) {
		return mapDao.selectProductByCategory(pd_pc_num);
	}

	@Override
	public ArrayList<ProductVO> getSearchProduct(ProductVO product) {
		return mapDao.selectSearchProduct(product);
		
	}

	@Override
	public ArrayList<ProductCategoryVO> getProductCategory() {
		return mapDao.selectProductCategory();
	}

	@Override
	public ProductVO getSelectProduct(int pd_num) {
		return mapDao.selectProductNum(pd_num);
	}

	@Override
	public FileVO getProductImg(int pd_num) {
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		return mapDao.selectProductImg(pd_num, fi_category, fi_table);
	}

}
