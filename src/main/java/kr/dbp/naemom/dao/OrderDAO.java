package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductVO;

public interface OrderDAO {

	ProductVO selectProduct(@Param("pd_num")int pd_num);

	ArrayList<Option_landMarkVO> selectTravelOption(@Param("pd_num")int pd_num);

	ArrayList<Option_restrauntVO> selectFoodOption(@Param("pd_num")int pd_num);

	ArrayList<Option_accomodationVO> selectHomeOption(@Param("pd_num")int pd_num);

	ArrayList<Option_festivalVO> selectFestivalOption(@Param("pd_num")int pd_num);

	FileVO selectFileByPdNum(@Param("fi_table_key")int pd_num, @Param("fi_category")String fi_category, @Param("fi_table")String fi_table);

	void insertBasket(@Param("tmp")OptionListDTO tmp);


}
