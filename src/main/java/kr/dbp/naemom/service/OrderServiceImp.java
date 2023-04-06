package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.OrderDAO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductVO;

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
}
