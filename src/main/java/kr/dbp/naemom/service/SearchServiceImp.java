package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.SearchDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.CalendarVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class SearchServiceImp implements SearchService{


	@Autowired
	SearchDAO searchDao;
	@Override
	public ArrayList<ProductVO> getProduct(Criteria cri, int pd_pc_num) {
		return searchDao.getProduct(cri,pd_pc_num);
	}
	@Override
	public ArrayList<CourseVO> getCourse(Criteria cri) {
		cri.setPerPageNum(4);
		return searchDao.getCourse(cri);
	}
	@Override
	public ArrayList<ProductVO> getFeList(CalendarVO date) {
		if(date== null ||
				date.getYear()<=0||
				date.getMonth()<=0) date= new CalendarVO();
	return searchDao.getFeListByDate(date.getYear(),date.getMonth(), date.getDay());
	}
	@Override
	public Integer getTotalCount(int pc_category) {
		return searchDao.getTotalCountByCategory(pc_category);
	}
	




}
