package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.CourseDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.CourseItemVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class CourseServiceImp implements CourseService{

	@Autowired
	CourseDAO courseDao;
	
	@Override
	public int insertCourse(CourseVO cos, String id) {
		if(id == null)
			return 0;
		if(cos == null || cos.getCo_title().trim().length() == 0 ||
				cos.getCo_cc_category_num() == 0 || cos.getCo_cs_schedule_num() == 0 || 
				cos.getCo_content().trim().length() ==0)
			return 0;
		return courseDao.insertCourse(cos,id);
		
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

	@Override
	public ProductVO getSelectProduct(int pd_num) {
		if(pd_num == 0)
			return null;
		return courseDao.selectProductNum(pd_num);
	}

	@Override
	public void insertCourseItem(int co_num, String[] pd_num) {
		if(co_num == 0)
			return;
		int index = 0;
		for(String tmp : pd_num) {
			if(tmp == null)
				return;
			int pr_num = Integer.parseInt(tmp);
			if(pr_num == 0)
				return;
			index++;
			courseDao.insertCourseItem(co_num,pr_num,index);
			
		}
		
	}

	@Override
	public ArrayList<ProductCategoryVO> getProductCategory() {
		
		return courseDao.selectProductCategory();
	}

	@Override
	public FileVO getProductImg(int pd_num) {
		if(pd_num == 0) {
			return null;
		}
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		return courseDao.selectProductImg(pd_num, fi_category, fi_table);
	}

	@Override
	public ArrayList<CourseVO> getCourseList(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return courseDao.selectCourseList(cri);
	}

	@Override
	public int getTotalCountBoard(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return courseDao.selectTotalCountCourse(cri);
	}

	@Override
	public ArrayList<CourseItemVO> getCourseItem(int co_num) {
		if(co_num == 0)
			return null;
		return courseDao.selectCourseItem(co_num);
	}

	@Override
	public ArrayList<FileVO> getProductImgList() {
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		return courseDao.selectProductImgList(fi_category, fi_table);
	}
	
	
}
