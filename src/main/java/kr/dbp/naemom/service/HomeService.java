package kr.dbp.naemom.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

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

	

}
