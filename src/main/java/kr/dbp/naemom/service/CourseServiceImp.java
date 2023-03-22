package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.CourseDAO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class CourseServiceImp implements CourseService{

	@Autowired
	CourseDAO courseDao;
	
	@Override
	public void insertCourse(CourseVO cos, String id) {
		if(id == null)
			return;
		if(cos == null || cos.getCo_title().trim().length() == 0 ||
				cos.getCo_cc_category() == 0 || cos.getCo_cs_schedule() == 0 || 
				cos.getCo_content().trim().length() ==0)
			return;
		courseDao.insertCourse(cos,id);
		
	}

	@Override
	public ArrayList<ProductVO> getSearchProduct(ProductVO pr) {
		if(pr.getPd_title().trim().length() == 0)
			return null;
		
		return courseDao.selectSearchProduct(pr);
	}

	@Override
	public ArrayList<Hash_tagVO> getHashTag(int pd_num) {
		if(pd_num == 0)
			return null;
		return courseDao.selectHashTag(pd_num);
	}
	
	
}
