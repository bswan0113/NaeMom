package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

public interface HomeDAO {

	ArrayList<ProductVO> selectBoardList();

	ArrayList<ProductVO> selectProductByKeyword(String keyword);

	ArrayList<ProductVO> getProductList();

	int insertProductChecked(int[] pdc_checked);

	void deleteProductChecked(int[] pdc_checked);

	ArrayList<ProductVO> getCheckedList();

	FileVO getFile(@Param("pd_num")int pd_num, @Param("product")String string, @Param("fi_category")String string2);

	void insertFile(FileVO fileVo);

	void addImage(@Param("fi")FileVO fileVo);

	ArrayList<FileVO> selectImage();

	void deleteFileChecked(int[] fc_checked);

	void insertFileChecked(int[] fc_checked);

	ArrayList<FileVO> getFileList();

	
}
