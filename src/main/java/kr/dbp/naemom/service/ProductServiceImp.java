package kr.dbp.naemom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.ProductDAO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class ProductServiceImp implements ProductService{

	@Autowired
	ProductDAO productDao;

	@Override
	public boolean insertProduct(ProductVO product) {
		if(product ==null) return false;
		if(product.getPd_capacity() <= 0 || 
			product.getPd_close_time() == null || 
			product.getPd_content().trim().length() ==0 ||
			product.getPd_open_time() == null ||
			product.getPd_parking().trim().length() ==0 ||
			product.getPd_pc_num()<= 0 ||
			product.getPd_registerd_address().trim().length() ==0 ||
			product.getPd_street_address().trim().length() ==0 ||
			product.getPd_subtitle().trim().length() ==0||
			product.getPd_title().trim().length() ==0) return false;
		productDao.insertProduct(product);
		productDao.insertProductOption(product.getPd_pc_num());
		return true;
		
	}

	@Override
	public ProductVO getProduct(int i) {
		if(i<=0) return null;
		return productDao.selectProductByNum(i);
	}
}
