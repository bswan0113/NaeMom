package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;

public interface ProductOptionService {

	boolean deleteFestival(int fo_num);

	boolean insertFestival(ArrayList<Option_festivalVO> festival);

	boolean updateFestival(Option_festivalVO festival);

	boolean insertLandmark(ArrayList<Option_landMarkVO> landmark);

	boolean deleteLandmark(int lo_num);

	boolean updateLandmark(Option_landMarkVO landmark);

}
