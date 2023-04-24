package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Shopping_basketVO;

public interface OrderDAO {

	ProductVO selectProduct(@Param("pd_num")int pd_num);

	ArrayList<Option_landMarkVO> selectTravelOption(@Param("pd_num")int pd_num);

	ArrayList<Option_restrauntVO> selectFoodOption(@Param("pd_num")int pd_num);

	ArrayList<Option_accomodationVO> selectHomeOption(@Param("pd_num")int pd_num);

	ArrayList<Option_festivalVO> selectFestivalOption(@Param("pd_num")int pd_num);

	FileVO selectFileByPdNum(@Param("fi_table_key")int pd_num, @Param("fi_category")String fi_category, @Param("fi_table")String fi_table);

	int insertBasket(@Param("tmp")OptionListDTO tmp,@Param("me_id")String me_id);

	ArrayList<Shopping_basketVO> selectBasket(@Param("me_id")String me_id);

	int deleteBasket(@Param("sb_num")int sb_num, @Param("me_id")String me_id);

	int deleteAllBasket(@Param("me_id")String me_id);

	Shopping_basketVO selectBasketBySbNum(@Param("me_id")String me_id, @Param("sb_num")int num);

	MemberVO selectMember(@Param("me_id")String me_id);

	void insertBuyList(@Param("bl")Buy_listVO bl);

	void insertOrderList(@Param("sb_num")String tmp, @Param("bl_num")String bl_num);

	int updateBuyList(@Param("bl_num")String bl_num, @Param("me_id")String me_id, @Param("state")String state);

	int deleteOrderList(@Param("bl_num")String bl_num);

	int deleteBuyList(String bl_num, String me_id);



}
