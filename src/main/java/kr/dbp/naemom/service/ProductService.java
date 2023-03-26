package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.LikeVO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.WishVO;

public interface ProductService {

	boolean insertProduct(ProductVO product, MultipartFile[] files);

	ProductVO getProduct(int i);

	ArrayList<ProductCategoryVO> getCategory();

	ArrayList<ProductVO> getProductList();

	ArrayList<FileVO> getFiles(int pd_num);

	ArrayList<ProductVO> getRandomProduct();

	ArrayList<FileVO> getRandomThumbNail();

	WishVO getWish(String string, int pd_num);

	int likeUpdate(String me_id, int pd_num, int li_state);

	void updateViewCount(int pd_num);

	Option_landMarkVO getLandMarkOption(int pd_pc_num);

	Option_restrauntVO getRestrauntOption(int pd_pc_num);

	Option_accomodationVO getAcomodationOption(int pd_pc_num);

	Option_festivalVO getFestivalOption(int pd_pc_num);



}
