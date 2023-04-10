package kr.dbp.naemom.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.DayOFFVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;

public interface ProductOptionDAO {


	public boolean deleteFestival(@Param("fo_num")int fo_num);

	public void insertFestivalOption(@Param("fo")Option_festivalVO item);

	public boolean updateFestival(@Param("fo")Option_festivalVO festival);

	public void insertLandmarkOption(@Param("lo")Option_landMarkVO item);

	public boolean deleteLandmark(@Param("lo_num")int lo_num);

	public boolean updateLandmark(@Param("lo")Option_landMarkVO landmark);

	public DayOFFVO getDayOff(@Param("pd_num")int pdNum, @Param("do_date")String day);

	public int deleteDayOff(@Param("pd_num")int pdNum, @Param("do_date")String day);

	public boolean insertDayOff(@Param("pd_num")int pdNum, @Param("do_date")String day);

	public boolean insertTmpOff(@Param("to_do_num")int do_num, @Param("to_start")Date to_start, @Param("do_end")Date to_end);

	public void insertDayOffTmp(@Param("do")DayOFFVO dayoff);



		

}
