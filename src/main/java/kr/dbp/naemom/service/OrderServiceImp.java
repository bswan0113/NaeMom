package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.OrderDAO;
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

@Service
public class OrderServiceImp implements OrderService{
	
	@Autowired
	OrderDAO orderDao;

	@Override
	public ProductVO getProductByPdNum(String tmp) {
		int pd_num = IntegerNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectProduct(pd_num);
	}

	@Override
	public ArrayList<Option_landMarkVO> getTravelByPdNum(String tmp) {
		int pd_num = IntegerNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectTravelOption(pd_num);
	}

	@Override
	public ArrayList<Option_restrauntVO> getFoodByPdNum(String tmp) {
		int pd_num = IntegerNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectFoodOption(pd_num);
	}

	@Override
	public ArrayList<Option_accomodationVO> getHomeByPdNum(String tmp) {
		int pd_num = IntegerNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectHomeOption(pd_num);
	}

	@Override
	public ArrayList<Option_festivalVO> getFestivalByPdNum(String tmp) {
		int pd_num = IntegerNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectFestivalOption(pd_num);
	}

	
	private int IntegerNum(String tmp) {
		if(tmp == null)
			return 0;
		int pd_num = Integer.parseInt(tmp);
		if(pd_num == 0)
			return 0;
		return pd_num;
	}

	@Override
	public FileVO getFileByPdNum(String tmp) {
		int pd_num = IntegerNum(tmp);
		if(pd_num==0)
			return null;
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		return orderDao.selectFileByPdNum(pd_num,fi_category,fi_table);
	}

	@Override
	public int addBasket(List<OptionListDTO> list, String me_id) {
		int res = 0;
		for(OptionListDTO tmp : list) {
			if(tmp.getPr_num() == 0 || tmp.getPr_amount() == 0 || tmp.getPr_date() == null || tmp.getPr_option() == null)
				return res=0;
			res = orderDao.insertBasket(tmp, me_id);
		}
		return res;
		
	}

	@Override
	public ArrayList<Shopping_basketVO> getBasket(String me_id) {
		if(me_id == null)
			return null;
		
		return orderDao.selectBasket(me_id);
	}

	@Override
	public ArrayList<FileVO> getFileListByBasket(ArrayList<Shopping_basketVO> basket) {
		ArrayList<FileVO> fList = new ArrayList<FileVO>();
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		for(int i = 0; i< basket.size();i++) {
			String table = basket.get(i).getSb_table();
			if(table.equals("festival_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getFestival().getFo_pd_num(),fi_category,fi_table);
				fList.add(file);
			}else if(table.equals("accomodation_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getHome().getAo_pd_num(),fi_category,fi_table);
				fList.add(file);
			}else if(table.equals("restraunt_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getFood().getReo_pd_num(),fi_category,fi_table);
				fList.add(file);
					
			}else if(table.equals("landmark_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getTravel().getLo_pd_num(),fi_category,fi_table);
				fList.add(file);
					
			}
		}
		return fList;
	}

	@Override
	public ArrayList<ProductVO> getProductByBasket(ArrayList<Shopping_basketVO> basket) {
		ArrayList<ProductVO> prList = new ArrayList<ProductVO>();
		for(int i = 0; i< basket.size();i++) {
			String table = basket.get(i).getSb_table();
			if(table.equals("festival_option")) {
				ProductVO product = orderDao.selectProduct(basket.get(i).getFestival().getFo_pd_num());
				prList.add(product);
			}else if(table.equals("accomodation_option")) {
				ProductVO product = orderDao.selectProduct(basket.get(i).getHome().getAo_pd_num());
				prList.add(product);
			}else if(table.equals("restraunt_option")) {
				ProductVO product = orderDao.selectProduct(basket.get(i).getFood().getReo_pd_num());
				prList.add(product);
					
			}else if(table.equals("landmark_option")) {
				ProductVO product = orderDao.selectProduct(basket.get(i).getTravel().getLo_pd_num());
				prList.add(product);
					
			}
		}
		return prList;
	}

	@Override
	public int deleteBasket(int sb_num, String me_id) {
		if(sb_num == 0 || me_id == null)
			return 0;
		return orderDao.deleteBasket(sb_num,me_id);
	}

	@Override
	public int deleteAllBasket(String me_id) {
		if(me_id == null)
			return 0;
		return orderDao.deleteAllBasket(me_id);
	}

	@Override
	public ArrayList<Shopping_basketVO> getBasketBySbNum(String me_id, String[] sb_num) {
		ArrayList<Shopping_basketVO> list = new ArrayList<Shopping_basketVO>();
		if(me_id == null)
			return null;
		int num = 0;
		for(String tmp : sb_num) {
			num = IntegerNum(tmp);
			Shopping_basketVO item = orderDao.selectBasketBySbNum(me_id,num);
			list.add(item);
		}
		return list;
	}

	

	@Override
	public String insertBuyList(PayDTO dto, String me_id) {
		if(dto == null || dto.getItemState() =="" || dto.getPrice() == 0 || dto.getAdd_mile() =="" || dto.getOrder_name()=="")
			return null;
		Buy_listVO bl = new Buy_listVO(dto.getOrder_id(),dto.getItemState(), dto.getPrice(), Integer.parseInt(dto.getAdd_mile()), 0, me_id, dto.getOrder_name());
		if(dto.getUse_mile() != null) {
			bl.setBl_use_mile(Integer.parseInt(dto.getUse_mile()));
		}
		orderDao.insertBuyList(bl);
		for(String tmp : dto.getSb_num()) {
			orderDao.insertOrderList(tmp,bl.getBl_num());
		}
		return bl.getBl_num();
	}

	@Override
	public int updateBuyList(String bl_num, String me_id) {
		if(bl_num == null || me_id == null)
			return 0;
		String state = "결제완료";
		System.out.println(bl_num);
		return orderDao.updateBuyList(bl_num, me_id, state);
	}

	@Override
	public int deleteBuyList(String bl_num, String me_id) {
		if(bl_num == null || me_id == null)
			return 0;
		int res = orderDao.deleteOrderList(bl_num);
		if(res != 0)
			res = orderDao.deleteBuyList(bl_num, me_id);
		return 0;
	}

	@Override
	public Buy_listVO getBuyListByBlNum(String bl_num) {
		if(bl_num == null)
			return null;
		return orderDao.selectBuyListByBlNum(bl_num);
	}

	

	
}
