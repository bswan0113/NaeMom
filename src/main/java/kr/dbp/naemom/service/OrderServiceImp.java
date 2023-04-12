package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.OrderDAO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Shopping_basketVO;

@Service
public class OrderServiceImp implements OrderService{
	
	@Autowired
	OrderDAO orderDao;

	@Override
	public ProductVO getProductByPdNum(String tmp) {
		int pd_num = IntegerPdNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectProduct(pd_num);
	}

	@Override
	public ArrayList<Option_landMarkVO> getTravelByPdNum(String tmp) {
		int pd_num = IntegerPdNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectTravelOption(pd_num);
	}

	@Override
	public ArrayList<Option_restrauntVO> getFoodByPdNum(String tmp) {
		int pd_num = IntegerPdNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectFoodOption(pd_num);
	}

	@Override
	public ArrayList<Option_accomodationVO> getHomeByPdNum(String tmp) {
		int pd_num = IntegerPdNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectHomeOption(pd_num);
	}

	@Override
	public ArrayList<Option_festivalVO> getFestivalByPdNum(String tmp) {
		int pd_num = IntegerPdNum(tmp);
		if(pd_num==0)
			return null;
		return orderDao.selectFestivalOption(pd_num);
	}

	
	private int IntegerPdNum(String tmp) {
		if(tmp == null)
			return 0;
		int pd_num = Integer.parseInt(tmp);
		if(pd_num == 0)
			return 0;
		return pd_num;
	}

	@Override
	public FileVO getFileByPdNum(String tmp) {
		int pd_num = IntegerPdNum(tmp);
		if(pd_num==0)
			return null;
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		return orderDao.selectFileByPdNum(pd_num,fi_category,fi_table);
	}

	@Override
	public void addBasket(OptionListDTO tmp, String me_id) {
		if(tmp == null || tmp.getPr_num() == 0 || tmp.getPr_amount() == 0 || tmp.getPr_category() == "")
			return;
		
		orderDao.insertBasket(tmp,me_id);
		
	}

	@Override
	public ArrayList<Shopping_basketVO> getBasket(String me_id) {
		if(me_id == null)
			return null;
		
		return orderDao.selectBasket(me_id);
	}

	@Override
	public ArrayList<Option_landMarkVO> getTravelListByBasket(ArrayList<Shopping_basketVO> basket) {
		if(basket == null)
			return null;
		ArrayList<Option_landMarkVO> travelList = new ArrayList<Option_landMarkVO>();
		for(int i = 0; i< basket.size();i++) {
			String table = basket.get(i).getSb_table();
			if(table.equals("landmark_option")) {
				Option_landMarkVO travel = orderDao.selectTravelByNum(basket.get(i).getSb_table_key());
				basket.get(i).setPd_num(travel.getLo_pd_num());
				travelList.add(travel);
			}
		}
		return travelList;
	}

	@Override
	public ArrayList<Option_restrauntVO> getFoodListByBasket(ArrayList<Shopping_basketVO> basket) {
		if(basket == null)
			return null;
		ArrayList<Option_restrauntVO> foodList = new ArrayList<Option_restrauntVO>();
		for(int i = 0; i< basket.size();i++) {
			String table = basket.get(i).getSb_table();
			if(table.equals("restraunt_option")) {
				Option_restrauntVO food = orderDao.selectFoodByNum(basket.get(i).getSb_table_key());
				basket.get(i).setPd_num(food.getReo_pd_num());
				foodList.add(food);
			}
		}
		return foodList;
	}

	@Override
	public ArrayList<Option_accomodationVO> getHomeListByBasket(ArrayList<Shopping_basketVO> basket) {
		if(basket == null)
			return null;
		ArrayList<Option_accomodationVO> homeList = new ArrayList<Option_accomodationVO>();
		for(int i = 0; i< basket.size();i++) {
			String table = basket.get(i).getSb_table();
			if(table.equals("accomodation_option")) {
				Option_accomodationVO home = orderDao.selectHomeByNum(basket.get(i).getSb_table_key());
				basket.get(i).setPd_num(home.getAo_pd_num());
				homeList.add(home);
			}
		}
		return homeList;
	}

	@Override
	public ArrayList<Option_festivalVO> getFestivalListByBasket(ArrayList<Shopping_basketVO> basket) {
		if(basket == null)
			return null;
		ArrayList<Option_festivalVO> festivalList = new ArrayList<Option_festivalVO>();
		for(int i = 0; i< basket.size();i++) {
			String table = basket.get(i).getSb_table();
			if(table.equals("festival_option")) {
				Option_festivalVO festival = orderDao.selectFestivalByNum(basket.get(i).getSb_table_key());
				basket.get(i).setPd_num(festival.getFo_pd_num());
				festivalList.add(festival);
			}
		}
		return festivalList;
	}

	@Override
	public ArrayList<FileVO> getFileListByBasket(ArrayList<Shopping_basketVO> basket) {
		ArrayList<FileVO> fList = new ArrayList<FileVO>();
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		for(int i = 0; i< basket.size();i++) {
			String table = basket.get(i).getSb_table();
			if(table.equals("festival_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getPd_num(),fi_category,fi_table);
				for(FileVO tmp : fList) {
					if(tmp == null || file.getFi_table_key() != tmp.getFi_table_key()) {
						System.out.println(2);
						
						fList.add(file);
					}
				}
			}else if(table.equals("accomodation_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getPd_num(),fi_category,fi_table);
				for(FileVO tmp : fList) {
					if(tmp == null || file.getFi_table_key() != tmp.getFi_table_key()) {
						System.out.println(3);
						fList.add(file);
					}
				}
			}else if(table.equals("restraunt_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getPd_num(),fi_category,fi_table);
				for(FileVO tmp : fList) {
					if(tmp == null || file.getFi_table_key() != tmp.getFi_table_key()) {
						System.out.println(4);
						
						fList.add(file);
					}
				}
			}else if(table.equals("landmark_option")) {
				FileVO file = orderDao.selectFileByPdNum(basket.get(i).getPd_num(),fi_category,fi_table);
				for(FileVO tmp : fList) {
					if(tmp == null || file.getFi_table_key() != tmp.getFi_table_key()) {
						System.out.println(5);
						
						fList.add(file);
					}
				}
			}
		}
		return fList;
	}

	

	
}
