package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

public interface MapDAO {

	ArrayList<ProductVO> selectGetProductList();
	
	ArrayList<ProductVO> selectGetProductListCri(@Param("cri")Criteria cri);

	ArrayList<FileVO> getFileList();

	FileVO getFile(@Param("pd_num")int pd_num, @Param("product")String string, @Param("fi_category")String string2);

	ArrayList<ProductVO> selectProductByCategory(@Param("pd_pc_num")int pd_pc_num);

	ArrayList<ProductVO> selectSearchProduct(@Param("product")ProductVO product);

	ArrayList<ProductCategoryVO> selectProductCategory();

	ArrayList<ProductVO> selectProductNum(@Param("pd_num")int pd_num);

	FileVO selectProductImg(@Param("pd_num")int pd_num, @Param("fi_category")String fi_category, @Param("fi_table")String fi_table);

	ArrayList<ProductVO> selectSearchProductAddress(ProductVO product);

	int selectTotalCountProduct(@Param("cri")Criteria cri);

	

}
