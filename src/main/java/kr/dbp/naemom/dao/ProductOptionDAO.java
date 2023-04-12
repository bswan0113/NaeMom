package kr.dbp.naemom.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.DayOFFVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.TempOFFVO;

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

	public boolean insertTmpOff(@Param("to_do_num")int do_num, @Param("to_start")Date to_start, @Param("to_end")Date to_end);

	public void insertDayOffTmp(@Param("do")DayOFFVO dayoff);

	public ArrayList<TempOFFVO> getDayOffTmp(@Param("pd_num")int pd_num);

	public void insertOptionFile(@Param("fi")FileVO file);
	
	
	public boolean insertRestrauntOption(@Param("reo")Option_restrauntVO option);

	public FileVO getFileREOption(@Param("fi_table_key")int reo_num, @Param("fi_table")String string);

	public boolean deleteRestraunt(@Param("reo_num")int reo_num);

	public boolean updateRestraunt(@Param("reo")Option_restrauntVO restraunt);

	public void updateRestrauntOptionFile(@Param("fi")FileVO file, @Param("fi_num")int fi_num);

	
	public boolean insertAccomodationOption(@Param("ao")Option_accomodationVO option);

	public FileVO getFileAOption(@Param("fi_table_key")int ao_num, @Param("fi_table")String string);
	
	public boolean deleteAccomodation(@Param("ao_num")int reo_num);

	public boolean updateAccomodation(@Param("ao")Option_accomodationVO accomodation);

	public void updateAccomodationOptionFile(@Param("fi")FileVO file, @Param("fi_num")int fi_num);




		

}
