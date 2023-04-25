package kr.dbp.naemom.service;

import java.util.ArrayList;

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

public interface CourseService {

	int insertCourse(CourseVO cos, String id);

	ArrayList<ProductVO> getSearchProduct(ProductVO pr);

	ArrayList<Hash_tagVO> getHashTag(int pd_num);

	ProductVO getSelectProduct(int pd_num);

	void insertCourseItem(int co_num, String[] pd_num);

	ArrayList<ProductCategoryVO> getProductCategory();

	FileVO getProductImg(int pd_num);

	ArrayList<CourseVO> getCourseList(Criteria cri);

	int getTotalCountBoard(Criteria cri);

	ArrayList<CourseItemVO> getCourseItem(int co_num);

	ArrayList<FileVO> getProductImgList();

	CourseVO getcourseByNum(int co_num);

	boolean deleteCourse(int co_num, MemberVO user);

	int updateCourse(CourseVO cos, MemberVO user, int co_num, String[] pd_num);

	int updateLike(int li_co_num, int li_updown, MemberVO user);

	LikeVO getLikes(MemberVO user, int co_num);

	int insertReportCourse(ReportVO rep);

	void updateCourseByReport(int co_num);

	int selectReport(ReportVO rep);

	void updateViewCount(int co_num);

	CourseVO getcourseByNumUser(int co_num, MemberVO user);


}
