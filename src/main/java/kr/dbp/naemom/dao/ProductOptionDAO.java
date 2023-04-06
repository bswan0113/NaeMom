package kr.dbp.naemom.dao;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;

public interface ProductOptionDAO {


	public boolean deleteFestival(@Param("fo_num")int fo_num);

	public void insertFestivalOption(@Param("fo")Option_festivalVO item);

	public boolean updateFestival(@Param("fo")Option_festivalVO festival);

	public void insertLandmarkOption(@Param("lo")Option_landMarkVO item);

	public boolean deleteLandmark(@Param("lo_num")int lo_num);

	public boolean updateLandmark(@Param("lo")Option_landMarkVO landmark);



		

}
