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
import kr.dbp.naemom.vo.LikeVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.ReportVO;

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

	@Override
	public CourseVO getcourseByNum(int co_num) {
		if(co_num == 0)
			return null;
		return courseDao.selectCourseByNum(co_num);
	}

	@Override
	public boolean deleteCourse(int co_num, MemberVO user) {
		CourseVO cos = courseDao.selectCourseByNum(co_num);
		if(user == null)
			return false;
		if(cos == null || cos.getCo_me_id().equals(user.getMe_id()))
			return false;
		ArrayList<CourseItemVO> cosItem = courseDao.selectCourseItem(co_num);
		deleteCourse(cosItem);
		int res = courseDao.deleteCourse(co_num);
		if(res==0)
			return false;
		return true;
	}

	private void deleteCourse(ArrayList<CourseItemVO> cosItem) {
		if(cosItem == null || cosItem.size()==0)
			return;
		for(CourseItemVO tmp : cosItem) {
			courseDao.deleteCourseItem(tmp.getCi_co_num());
		}
		
	}

	@Override
	public int updateCourse(CourseVO cos, MemberVO user, int co_num, String[] pd_num) {
		if(user == null)
			return 0;
		if(cos == null || cos.getCo_title().trim().length() == 0 || //!cos.getCo_me_id().equals(user.getMe_id()) ||
				cos.getCo_cc_category_num() == 0 || cos.getCo_cs_schedule_num() == 0 || 
				cos.getCo_content().trim().length() ==0)
			return 0;
		if(co_num != cos.getCo_num())
			return 0;
		int res = courseDao.updateCourse(cos,user.getMe_id(),co_num);
		if(res ==0)
			return 0;
		int index=0;
		courseDao.deleteCourseItem(co_num);
		for(String tmp : pd_num) {
			if(tmp == null)
				return 0;
			int pr_num = Integer.parseInt(tmp);
			if(pr_num == 0)
				return 0;
			index++;
			courseDao.insertCourseItem(co_num,pr_num,index);
			
		}
		return res;
	}

	@Override
	public int updateLike(int li_co_num, int li_updown, MemberVO user) {
		if(user == null)
			return -100;
		int res = 0;
		String table = "course";
		LikeVO dbLikeVo = courseDao.selectLike(li_co_num, user.getMe_id(), table);
		if(dbLikeVo == null) {
			LikeVO likeVo = new LikeVO(li_updown, user.getMe_id(), li_co_num, table);
			courseDao.insertLike(likeVo);
			res = li_updown;
		}else if(dbLikeVo.getLi_updown() == li_updown) {
			//취소
			LikeVO likeVo = new LikeVO(0, user.getMe_id(), li_co_num, table);
			courseDao.updateLike(likeVo);
			res = 0;
		}else {
			//변경
			LikeVO likeVo = new LikeVO(li_updown, user.getMe_id(), li_co_num, table);
			courseDao.updateLike(likeVo);
			res = li_updown;
		}
		courseDao.updateCourseUpAndDown(li_co_num);
		
		return res;
	}

	@Override
	public LikeVO getLikes(MemberVO user, int co_num) {
		if(user == null)
			return null;
		String table = "course";
		LikeVO likeVo = courseDao.selectLike(co_num, user.getMe_id(), table);
		return likeVo;
	}

	@Override
	public int insertReportCourse(ReportVO rep) {
		if(rep == null || rep.getRep_category().trim().length() ==0 || rep.getRep_content().trim().length() ==0 ||
				rep.getRep_table_key() == 0 || !rep.getRep_table().equals("course") || rep.getRep_me_id().trim().length() == 0)
			return 0;
		
		return courseDao.insertReportCourse(rep);
	}

	@Override
	public void updateCourseByReport(int co_num) {
		if(co_num == 0)
			return;
		courseDao.updateCourseByReport(co_num);
		return; 
	}

	@Override
	public int selectReport(ReportVO rep) {
		int res = courseDao.selectReportById(rep);
		
		return res;
	}

	@Override
	public void updateViewCount(int co_num) {
		courseDao.updateViewCount(co_num);
		
	}


	
	
}
