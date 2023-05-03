package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

public interface MapDAO {

	ArrayList<ProductVO> selectGetProductList();

	ArrayList<FileVO> getFileList();

	FileVO getFile(@Param("pd_num")int pd_num, @Param("product")String string, @Param("fi_category")String string2);

}
