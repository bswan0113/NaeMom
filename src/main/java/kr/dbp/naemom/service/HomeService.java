package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.vo.CourseItemVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

public interface HomeService {

	ArrayList<ProductVO> getHomeContent();

	ArrayList<ProductVO> searchProductByKeyword(String keyword);

	ArrayList<ProductVO> getProductList();

	void insertProductChecked(int[] pdc_checked);

	void deleteProductChecked(int[] pdc_checked);

	ArrayList<ProductVO> getCheckedList();

	FileVO getFiles(int pd_num);

	void addImage(MultipartFile files);

	ArrayList<FileVO> getFileList();

	ArrayList<FileVO> selectImage();

	void deleteFileChecked(int[] fc_checked);

	void insertFileChecked(int[] fc_checked);

	ProductVO getProductById(int pd_num);

	ArrayList<CourseVO> getCourseList();

	Collection<? extends CourseItemVO> getCourseItem(int co_num);

	ArrayList<FileVO> getProductImgList();

	ArrayList<ProductVO> getFestivalList();

	ArrayList<FileVO> getFestivalImgList();

	ArrayList<ProductVO> getProductListByScore();

	void deleteFileByEvent(int[] fi_num);




	

}
