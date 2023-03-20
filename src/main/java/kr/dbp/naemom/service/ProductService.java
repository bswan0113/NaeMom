package kr.dbp.naemom.service;

import kr.dbp.naemom.vo.ProductVO;

public interface ProductService {

	boolean insertProduct(ProductVO product);

	ProductVO getProduct(int i);

}
