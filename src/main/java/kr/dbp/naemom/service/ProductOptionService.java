package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.TempOFFVO;

public interface ProductOptionService {

	boolean deleteFestival(int fo_num);

	boolean insertFestival(ArrayList<Option_festivalVO> festival);

	boolean updateFestival(Option_festivalVO festival);

	boolean insertLandmark(ArrayList<Option_landMarkVO> landmark);

	boolean deleteLandmark(int lo_num);

	boolean updateLandmark(Option_landMarkVO landmark);

	boolean updateDayOff(String[] dayOff, int pdNum);

	boolean insertDayOff(String[] dayOff, int pdNum);

	boolean insertDayOffTmp(TempOFFVO temp, int productNum);

}
