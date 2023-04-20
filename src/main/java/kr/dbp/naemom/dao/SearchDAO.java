package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.ProductVO;

public interface SearchDAO {

	ArrayList<ProductVO> getProduct(@Param("cri")Criteria cri, @Param("pd_pc_num")int i);

	ArrayList<CourseVO> getCourse(@Param("cri")Criteria cri);

	ArrayList<ProductVO> getFeListByDate(@Param("year")int year, @Param("month")int month, @Param("day")int day);

	


}
