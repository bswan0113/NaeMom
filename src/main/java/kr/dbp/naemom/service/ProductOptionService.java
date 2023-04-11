package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Option_accomodationDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
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

	ArrayList<TempOFFVO> getDayOffTmp(int pd_num);

	boolean insertRestraunt(ArrayList<Option_restrauntVO> list, MultipartFile[] files);

	FileVO getFileREOption(int reo_num);

	boolean deleteRestraunt(int reo_num);

	boolean updateRestraunt(Option_restrauntVO restraunt);

	boolean updateRestrauntOptionFile(MultipartFile uploadFile, int reo_num);

	boolean insertAccomodation(ArrayList<Option_accomodationVO> arrayList, MultipartFile[] files);

	FileVO getFileAOption(int ao_num);

	boolean deleteAccomodation(int ao_num);

	boolean updateAccomodation(Option_accomodationVO accomodation);

	boolean updateAccomodationOptionFile(MultipartFile uploadFile, int ao_num);

}
