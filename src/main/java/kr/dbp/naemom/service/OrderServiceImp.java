package kr.dbp.naemom.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.OrderDAO;
import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.DayOFFVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.Order_listVO;
import kr.dbp.naemom.vo.PayDTO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Reservated_optionVO;
import kr.dbp.naemom.vo.Reservation_roomVO;
import kr.dbp.naemom.vo.Shopping_basketVO;
import kr.dbp.naemom.vo.TempOFFVO;
import kr.dbp.naemom.vo.Use_memberVO;

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
			ArrayList<Shopping_basketVO> sbList = orderDao.selectBasketById(me_id);
			if(sbList.size() ==0) {
				res = orderDao.insertBasket(tmp, me_id);
				continue;
			}
			for(Shopping_basketVO tmp2 : sbList) {
				if(tmp2.getSb_date().equals(tmp.getPr_date()) && tmp2.getSb_table().equals("restraunt_option") &&
						tmp.getPr_category().equals("restraunt_option")&& tmp2.getSb_time() == tmp.getPr_time()
						&& tmp2.getSb_table_key() == tmp.getPr_option_num() && tmp2.getSb_me_id().equals(me_id)) {
					res = orderDao.updateBasket(tmp, me_id);
					return res;
				}
			}
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

	@Override
	public int insertUseMember(Use_memberVO useMember) {
		if(useMember == null)
			return 0;
		return orderDao.insertUseMember(useMember);
	}

	@Override
	public void insertMileage(Buy_listVO bl) {
		if(bl == null)
			return;
		int mi_update = bl.getBl_stack_mile() - bl.getBl_use_mile();
		int res = orderDao.insertMileage(bl,mi_update);
		if(res != 0)
			orderDao.updateMemberByMileage(bl,mi_update);
		
	}

	@Override
	public void insertReservation(Buy_listVO bl) {
		for(Order_listVO tmp : bl.getOrderlist()) {
			if(tmp.getOl_table().equals("restraunt_option") && bl.getBl_num().equals(tmp.getOl_bl_num())) {
				Option_restrauntVO food = orderDao.selectFoodOptionByTableKey(tmp.getOl_table_key());
				orderDao.insertFoodOption(tmp,food,bl.getBl_me_id());
			}
			if(tmp.getOl_table().equals("accomodation_option") && bl.getBl_num().equals(tmp.getOl_bl_num())) {
				Option_accomodationVO home = orderDao.selectHomeOptionByTableKey(tmp.getOl_table_key());
				LocalDate date = LocalDate.parse(tmp.getOl_date());
				date = date.plusDays(tmp.getOl_amount());
				orderDao.insertHomeOption(tmp,home,bl.getBl_me_id(),date);
			}
		}
		
	}

	@Override
	public int selectReservationRoom(String checkIn) {
		
		return 0;
	}

	@Override
	public ArrayList<Reservated_optionVO> checkFood(Reservated_optionVO ro, String me_id) {
		ArrayList<Reservated_optionVO> tmp = new ArrayList<Reservated_optionVO>();
		if(ro.getRo_date() == null || ro.getRo_pd_num() == 0 || me_id == null) {
			ro.setRo_option_name("실패");
			tmp.add(ro);
			return tmp;
		}
		
		return orderDao.selectFood(ro, me_id);
	}

	@Override
	public int checkProduct(String[] list) {
		for(String tmp : list) {
			int sb_num = IntegerNum(tmp);
			Shopping_basketVO item = orderDao.selectBasketAndPdNum(sb_num);
			if(item.getSb_table().equals("landmark_option")) {
				int pd_num = item.getTravel().getLo_pd_num();
				DayOFFVO off = orderDao.selectDayOff(pd_num);
				if(off != null) {
					pd_num = checkTempOff(pd_num , item, off);
					if(pd_num != 0)
						return pd_num;
				}
			}else if(item.getSb_table().equals("restraunt_option")) {
				int pd_num = item.getFood().getReo_pd_num();
				DayOFFVO off = orderDao.selectDayOff(pd_num);
				if(off != null) {
					pd_num = checkTempOff(pd_num , item, off);
					if(pd_num != 0)
						return pd_num;
				}
				//int count = orderDao.selectReservFood(item.getFood().get)
			}else if(item.getSb_table().equals("festival_option")) {
				int pd_num = item.getFestival().getFo_pd_num();
				DayOFFVO off = orderDao.selectDayOff(pd_num);
				if(off != null) {
					pd_num = checkTempOff(pd_num , item, off);
					if(pd_num != 0)
						return pd_num;
				}
			}else if(item.getSb_table().equals("accomodation_option")) {
				int pd_num = item.getHome().getAo_pd_num();
				DayOFFVO off = orderDao.selectDayOff(pd_num);
				if(off != null) {
					pd_num = checkTempOff(pd_num , item, off);
					if(pd_num != 0)
						return pd_num;
				}
				//Reservation_roomVO rr = orderDao.selectReservRoom(item.getHome().getAo_num());
			}
			
		}
		return 0;
		
	}

	private int checkTempOff(int pd_num, Shopping_basketVO item, DayOFFVO off) {
		for(TempOFFVO temp : off.getTempOff()) {
			LocalDate date1 = LocalDate.parse(temp.getTo_start_str());
			LocalDate date2 = LocalDate.parse(item.getSb_date());
			LocalDate date3 = LocalDate.parse(temp.getTo_end_str());
			DayOfWeek dayOfWeek = date2.getDayOfWeek();
			String days = dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN);
			String dayOff = off.getDo_date();
			LocalDate now = LocalDate.now();
			if((date2.isAfter(date1) && date2.isBefore(date3)) || date2.isEqual(date1) 
					|| date2.isEqual(date3) || date2.isBefore(now))
				return pd_num;
			if(dayOff != null) {
				if(days.equals(dayOff)) 
					return pd_num;
			}
		}
		return 0;
	}



	

	
}
