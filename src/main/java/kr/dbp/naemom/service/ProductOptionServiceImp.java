package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.ProductOptionDAO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;

@Service
public class ProductOptionServiceImp implements ProductOptionService{

	@Autowired
	ProductOptionDAO productOptionDao;
	
	@Override
	public boolean deleteFestival(int fo_num) {
		
		return productOptionDao.deleteFestival(fo_num);
	}

	@Override
	public boolean insertFestival(ArrayList<Option_festivalVO> list) {
		if(list==null || list.size()<=0)return false;
		for(Option_festivalVO item : list) {
			if(item.getFo_age()== null) return false;
			if(item.getFo_pd_num()<=0) return false;
			if(item.getFo_price()<=0) return false;
			productOptionDao.insertFestivalOption(item);
		}
		
		return true;
	}

	@Override
	public boolean updateFestival(Option_festivalVO festival) {
		if(festival==null||
				festival.getFo_age()==null||
				festival.getFo_num()<=0||
				festival.getFo_pd_num()<=0||
				festival.getFo_price()<0 
		)return false;
		
		return productOptionDao.updateFestival(festival);
	}

	@Override
	public boolean insertLandmark(ArrayList<Option_landMarkVO> list) {
		if(list==null || list.size()<=0)return false;
			for(Option_landMarkVO item : list) {
				if(item.getLo_age()== null) return false;
				if(item.getLo_pd_num()<=0) return false;
				if(item.getLo_price()<=0) return false;
				productOptionDao.insertLandmarkOption(item);
			}
		
		return true;
	}

	@Override
	public boolean deleteLandmark(int lo_num) {
		return productOptionDao.deleteLandmark(lo_num);
	}

	@Override
	public boolean updateLandmark(Option_landMarkVO landmark) {
		if(landmark==null||
				landmark.getLo_age()==null||
				landmark.getLo_num()<=0||
				landmark.getLo_pd_num()<=0||
				landmark.getLo_price()<0 
		)return false;
		
		return productOptionDao.updateLandmark(landmark);
	}

}
