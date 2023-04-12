package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Shopping_basketVO;

public interface OrderService {

	ProductVO getProductByPdNum(String tmp);

	ArrayList<Option_landMarkVO> getTravelByPdNum(String tmp);

	ArrayList<Option_restrauntVO> getFoodByPdNum(String tmp);

	ArrayList<Option_accomodationVO> getHomeByPdNum(String tmp);

	ArrayList<Option_festivalVO> getFestivalByPdNum(String tmp);

	FileVO getFileByPdNum(String tmp);

	void addBasket(OptionListDTO tmp, String me_id);

	ArrayList<Shopping_basketVO> getBasket(String me_id);

	ArrayList<Option_landMarkVO> getTravelListByBasket(ArrayList<Shopping_basketVO> basket);

	ArrayList<Option_restrauntVO> getFoodListByBasket(ArrayList<Shopping_basketVO> basket);

	ArrayList<Option_accomodationVO> getHomeListByBasket(ArrayList<Shopping_basketVO> basket);

	ArrayList<Option_festivalVO> getFestivalListByBasket(ArrayList<Shopping_basketVO> basket);

	ArrayList<FileVO> getFileListByBasket(ArrayList<Shopping_basketVO> basket);


	

}
