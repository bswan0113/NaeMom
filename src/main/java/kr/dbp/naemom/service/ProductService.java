package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.LikeVO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.WishVO;

public interface ProductService {

	boolean insertProduct(ProductVO product, MultipartFile[] files);

	ProductVO getProduct(int i);

	ArrayList<ProductCategoryVO> getCategory();

	ArrayList<ProductVO> getProductList();

	ArrayList<FileVO> getFiles(int pd_num);

	ArrayList<ProductVO> getRandomProduct();

	ArrayList<FileVO> getThumbNailByRandomProduct(ArrayList<ProductVO> randomProduct);

	WishVO getWish(String string, int pd_num);

	int likeUpdate(String me_id, int pd_num, int li_state);

	void updateViewCount(int pd_num);

	ArrayList<Object> getLandMarkOption(int pd_pc_num);

	ArrayList<Object> getRestrauntOption(int pd_pc_num);

	ArrayList<Object> getAcomodationOption(int pd_pc_num);

	ArrayList<Object> getFestivalOption(int pd_pc_num);

	double getRatingAvg(int pd_num);

	ArrayList<FileVO> getOptFile(ProductVO product);





}
