package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

public interface ProductService {

	boolean insertProduct(ProductVO product, MultipartFile[] files);

	ProductVO getProduct(int i);

	ArrayList<ProductCategoryVO> getCategory();

}
