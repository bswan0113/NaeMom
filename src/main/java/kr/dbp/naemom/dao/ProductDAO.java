package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.DayOFFVO;
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

public interface ProductDAO {

	public void insertProduct(@Param("pd")ProductVO product);

	public void insertProductOption(@Param("pd_pc_num")int pd_pc_num);

	public ProductVO selectProductByNum(@Param("pd_num")int i);

	public ArrayList<ProductCategoryVO> getCategoryList();

	public void insertFile(@Param("fi")FileVO fileVo);

	public ArrayList<ProductVO> getProductList(@Param("cri")Criteria cri);

	public ArrayList<FileVO> getFile(@Param("pd_num")int pd_num, @Param("product")String string);

	public int getTotalCountOfProduct();

	public FileVO getThumbNail(@Param("random")int random, @Param("ThumbNail")String Thum, @Param("product")String string);

	public WishVO getWish(@Param("me_id")String me_id, @Param("pd_num")int pd_num);

	public void insertWish(@Param("me_id")String me_id, @Param("pd_num")int pd_num);

	public int deleteWish(@Param("me_id")String me_id, @Param("pd_num")int pd_num);

	public void updateViewCount(@Param("pd_num")int pd_num);

	public ArrayList<Object> getLandMarkOption(@Param("pd_num")int pd_num);

	public ArrayList<Object> getRestrauntOption(@Param("pd_num")int pd_num);

	public ArrayList<Object> getAcomodationOption(@Param("pd_num")int pd_num);

	public ArrayList<Object> getFestivalOption(@Param("pd_num")int pd_num);

	public double getReviewAvg(@Param("pd_num")int pd_num);

	public boolean insertReview(@Param("re")ReviewVO review);

	public FileVO getAoFileByOption(@Param("fi_table_key")int num,@Param("fi_table")String string);

	public FileVO getReoFileByOption(@Param("fi_table_key")int num,@Param("fi_table")String string);

	public int deleteProduct(@Param("pd_num")int number);

	public int updateProduct(@Param("pd")ProductVO product);

	public int updateThumbNail(@Param("fi_num") int fi_num, @Param("fi_table") String fi_table, @Param("fi_ori_name") String fi_ori_name, @Param("fi_name") String fi_name, @Param("fi_category") String fi_category);

	public int deleteFile(@Param("fi_num")int fi_num);

	public int getProductCount();

	public ArrayList<DayOFFVO> getDayOff(@Param("pd_num")int pd_num);


	


		

}
