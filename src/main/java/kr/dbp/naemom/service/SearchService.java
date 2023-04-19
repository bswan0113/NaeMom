package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.ProductVO;

public interface SearchService {

	ArrayList<ProductVO> getProduct(Criteria cri,int pd_pc_num);

	ArrayList<CourseVO> getCourse(Criteria cri);



}
