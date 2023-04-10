package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductVO;

public interface OrderService {

	ProductVO getProductByPdNum(String tmp);

	ArrayList<Option_landMarkVO> getTravelByPdNum(String tmp);

	ArrayList<Option_restrauntVO> getFoodByPdNum(String tmp);

	ArrayList<Option_accomodationVO> getHomeByPdNum(String tmp);

	ArrayList<Option_festivalVO> getFestivalByPdNum(String tmp);

	FileVO getFileByPdNum(String tmp);


	

}
