package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.ProductVO;

public interface CourseDAO {

	int insertCourse(@Param("cos")CourseVO cos,@Param("id")String id);

	ArrayList<ProductVO> selectSearchProduct(@Param("pr")ProductVO pr);

	ArrayList<Hash_tagVO> selectHashTag(@Param("pd_num")int pd_num);

	ProductVO selectProductNum(@Param("pd_num")int pd_num);

	void insertCourseItem(@Param("co_num")int co_num, @Param("pd_num")int pr_num,  @Param("index")int index);

}
