package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.List;

import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.PayDTO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Shopping_basketVO;

public interface OrderService {

	ProductVO getProductByPdNum(String tmp);

	ArrayList<Option_landMarkVO> getTravelByPdNum(String tmp);

	ArrayList<Option_restrauntVO> getFoodByPdNum(String tmp);

	ArrayList<Option_accomodationVO> getHomeByPdNum(String tmp);

	ArrayList<Option_festivalVO> getFestivalByPdNum(String tmp);

	FileVO getFileByPdNum(String tmp);

	int addBasket(List<OptionListDTO> list, String me_id);

	ArrayList<Shopping_basketVO> getBasket(String me_id);

	ArrayList<FileVO> getFileListByBasket(ArrayList<Shopping_basketVO> basket);

	ArrayList<ProductVO> getProductByBasket(ArrayList<Shopping_basketVO> basket);

	int deleteBasket(int sb_num, String me_id);

	int deleteAllBasket(String me_id);

	ArrayList<Shopping_basketVO> getBasketBySbNum(String me_id, String[] sb_num);



	String insertBuyList(PayDTO dto, String me_id);

	int updateBuyList(String bl_num, String me_id);

	int deleteBuyList(String bl_num, String me_id);

	Buy_listVO getBuyListByBlNum(String bl_num);


	

}
