package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.ProductOptionDAO;
import kr.dbp.naemom.vo.DayOFFVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.TempOFFVO;

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

	@Override
	public boolean updateDayOff(String[] dayOff, int pdNum) {
		 if (dayOff.length == 0) {
		        return true;
		    }
		    if (pdNum <= 0) {
		        return false;
		    }
		    for (String day : dayOff) {
		        DayOFFVO dayoff = productOptionDao.getDayOff(pdNum, day);
		        if (dayoff != null) {
		            if (productOptionDao.deleteDayOff(pdNum, day)<=0) {
		                return false;
		            }
		        }
		    }
		    return true;
	}

	@Override
	public boolean insertDayOff(String[] dayOff, int pdNum) {
		 if (dayOff.length == 0) {
		        return true;
		    }
		    if (pdNum <= 0) {
		        return false;
		    }
		    for (String day : dayOff) {
		        DayOFFVO dayoff = productOptionDao.getDayOff(pdNum, day);
		        if (dayoff == null) {
		        	productOptionDao.insertDayOff(pdNum, day);
		        }
		    }
		    return true;
	}

	@Override
	public boolean insertDayOffTmp(TempOFFVO temp, int productNum) {
		if(temp==null) return false;
		if(productNum<=0) return false;
		
		System.out.println(temp);
		System.out.println(productNum);
		DayOFFVO dayoff = new DayOFFVO();
		dayoff.setDo_state("임");
		dayoff.setDo_pd_num(productNum);
		productOptionDao.insertDayOffTmp(dayoff);
		System.out.println(dayoff);
		
		return productOptionDao.insertTmpOff(dayoff.getDo_num(),temp.getTo_start(), temp.getTo_end());
	}

}
